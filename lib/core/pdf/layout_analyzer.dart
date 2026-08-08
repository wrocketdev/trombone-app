import 'dart:math' as math;
import 'dart:ui';

import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

/// A styled fragment of text inside a paragraph.
///
/// Consecutive words that share the same style are merged into a single run so
/// that a Word/PowerPoint exporter gets clean formatting runs instead of one
/// run per word. Concatenating the [text] of every run of a paragraph in order
/// rebuilds the whole paragraph: each run except the last carries the space
/// that separated it from the next one.
class LayoutRun {
  const LayoutRun({
    required this.text,
    required this.bold,
    required this.italic,
    required this.fontSize,
  });

  final String text;
  final bool bold;
  final bool italic;
  final double fontSize;

  @override
  String toString() =>
      'LayoutRun("$text", bold: $bold, italic: $italic, fontSize: $fontSize)';
}

/// What a [LayoutBlock] represents.
enum LayoutBlockKind { paragraph, table }

/// One reconstructed structural element of a page: either a paragraph (with
/// styled [runs] and an optional [headingLevel]) or a table (with [rows]).
class LayoutBlock {
  const LayoutBlock({
    required this.kind,
    required this.runs,
    required this.headingLevel,
    required this.rows,
    required this.bounds,
  });

  /// Convenience constructor for a paragraph block.
  const LayoutBlock.paragraph({
    required this.runs,
    required this.bounds,
    this.headingLevel = 0,
  }) : kind = LayoutBlockKind.paragraph,
       rows = const <List<String>>[];

  /// Convenience constructor for a table block.
  const LayoutBlock.table({required this.rows, required this.bounds})
    : kind = LayoutBlockKind.table,
      runs = const <LayoutRun>[],
      headingLevel = 0;

  /// paragraph | table
  final LayoutBlockKind kind;

  /// Styled fragments — paragraph blocks only (empty for tables).
  final List<LayoutRun> runs;

  /// 0 = body text, 1..3 = heading level.
  final int headingLevel;

  /// Table cells, row by row — table blocks only (empty for paragraphs).
  /// Every row has the same length ([columnCount]); missing cells are ''.
  final List<List<String>> rows;

  /// Union of the source lines' bounds, in PDF points (y grows downward).
  final Rect bounds;

  /// Plain text of a paragraph block.
  String get text => runs.map((LayoutRun r) => r.text).join();

  /// Number of columns of a table block (0 for a paragraph).
  int get columnCount => rows.isEmpty ? 0 : rows.first.length;

  bool get isHeading => headingLevel > 0;
}

/// The reconstructed structure of a single PDF page.
class PageLayout {
  const PageLayout({
    required this.pageIndex,
    required this.sizePoints,
    required this.blocks,
  });

  /// 0-based index of the page in the source document.
  final int pageIndex;

  /// Page size in PDF points.
  final Size sizePoints;

  /// Blocks in reading order (top to bottom).
  final List<LayoutBlock> blocks;

  /// True for a page that yielded no extractable text (a pure scan, typically).
  bool get isEmpty => blocks.isEmpty;
}

/// Rebuilds paragraphs, headings and tables from the positioned text of a
/// loaded PDF. Pure Dart + Syncfusion: no rendering, no platform calls.
class LayoutAnalyzer {
  LayoutAnalyzer._();

  /// Groups Syncfusion's positioned TextLines into paragraphs, headings and
  /// tables for a LOADED sf.PdfDocument. Never mutates the document.
  ///
  /// [startPage] / [endPage] are 0-based and inclusive; they default to the
  /// whole document and are clamped to the real page range. A page that
  /// contains no extractable text yields a [PageLayout] with no blocks rather
  /// than an error.
  static List<PageLayout> analyze(
    sf.PdfDocument loadedDoc, {
    int? startPage,
    int? endPage,
  }) {
    final int pageCount = loadedDoc.pages.count;
    if (pageCount <= 0) return const <PageLayout>[];

    final int first = (startPage ?? 0).clamp(0, pageCount - 1);
    final int last = (endPage ?? pageCount - 1).clamp(first, pageCount - 1);

    sf.PdfTextExtractor? extractor;
    try {
      extractor = sf.PdfTextExtractor(loadedDoc);
    } catch (_) {
      extractor = null;
    }

    final List<PageLayout> pages = <PageLayout>[];
    for (var i = first; i <= last; i++) {
      pages.add(_analyzePage(loadedDoc, extractor, i));
    }
    return pages;
  }

  static PageLayout _analyzePage(
    sf.PdfDocument doc,
    sf.PdfTextExtractor? extractor,
    int pageIndex,
  ) {
    Size size;
    try {
      size = doc.pages[pageIndex].size;
    } catch (_) {
      size = Size.zero;
    }

    List<sf.TextLine> raw = const <sf.TextLine>[];
    if (extractor != null) {
      try {
        raw = extractor.extractTextLines(
          startPageIndex: pageIndex,
          endPageIndex: pageIndex,
        );
      } catch (_) {
        raw = const <sf.TextLine>[];
      }
    }
    if (raw.isEmpty) {
      return PageLayout(
        pageIndex: pageIndex,
        sizePoints: size,
        blocks: const <LayoutBlock>[],
      );
    }

    final List<_Line> lines = _buildLines(raw);
    if (lines.isEmpty) {
      return PageLayout(
        pageIndex: pageIndex,
        sizePoints: size,
        blocks: const <LayoutBlock>[],
      );
    }

    double median = _weightedMedianFontSize(lines);
    if (!(median > 0)) median = _defaultFontSize;

    final List<List<_Seg>> segments = lines
        .map((_Line l) => _segments(l, median))
        .toList(growable: false);
    final List<_TableRun> tables = _detectTables(lines, segments, median);

    return PageLayout(
      pageIndex: pageIndex,
      sizePoints: size,
      blocks: _buildBlocks(lines, segments, tables, median),
    );
  }

  // ---------------------------------------------------------------- lines ---

  /// Converts Syncfusion's TextLines into positioned [_Line]s, then merges the
  /// ones that share a visual row. Syncfusion sometimes emits several TextLines
  /// for a single printed row (one per font change or per table cell); merging
  /// them is what makes column detection work at all.
  static List<_Line> _buildLines(List<sf.TextLine> raw) {
    final List<_Line> prelim = <_Line>[];
    for (final sf.TextLine tl in raw) {
      final List<_Word> words = _wordsOf(tl);
      if (words.isEmpty) continue;
      prelim.add(_Line(words));
    }
    if (prelim.length < 2) return prelim;

    prelim.sort((_Line a, _Line b) {
      final int c = a.top.compareTo(b.top);
      return c != 0 ? c : a.left.compareTo(b.left);
    });

    final List<List<_Word>> rows = <List<_Word>>[];
    List<_Word> current = List<_Word>.of(prelim.first.words);
    _Line currentLine = prelim.first;
    for (var i = 1; i < prelim.length; i++) {
      final _Line next = prelim[i];
      if (_sameRow(currentLine, next)) {
        current.addAll(next.words);
        currentLine = _Line(_sortedByLeft(current));
      } else {
        rows.add(current);
        current = List<_Word>.of(next.words);
        currentLine = next;
      }
    }
    rows.add(current);

    final List<_Line> merged = rows
        .map((List<_Word> w) => _Line(_sortedByLeft(w)))
        .toList();
    merged.sort((_Line a, _Line b) {
      final int c = a.top.compareTo(b.top);
      return c != 0 ? c : a.left.compareTo(b.left);
    });
    return merged;
  }

  static List<_Word> _sortedByLeft(List<_Word> words) {
    final List<_Word> out = List<_Word>.of(words);
    out.sort((_Word a, _Word b) => a.left.compareTo(b.left));
    return out;
  }

  /// A line joins the row being accumulated when it overlaps it vertically by
  /// more than half of the shorter box AND sits in a horizontal gap of that
  /// row. The horizontal test is done word by word rather than against the
  /// row's full span: once "Le mot" and "est ici." are in the row, a bold
  /// "important" printed between them still has to be able to slot in.
  static bool _sameRow(_Line row, _Line candidate) {
    final double overlap =
        math.min(row.bottom, candidate.bottom) -
        math.max(row.top, candidate.top);
    if (overlap <= 0.5 * math.min(row.height, candidate.height)) return false;
    final double candWidth = candidate.right - candidate.left;
    for (final _Word w in row.words) {
      final double h =
          math.min(w.right, candidate.right) - math.max(w.left, candidate.left);
      if (h <= 0) continue;
      final double narrower = math.min(w.right - w.left, candWidth);
      if (narrower <= 0) continue;
      if (h > 0.5 * narrower) return false;
    }
    return true;
  }

  static List<_Word> _wordsOf(sf.TextLine line) {
    final bool lineBold = line.fontStyle.contains(sf.PdfFontStyle.bold);
    final bool lineItalic = line.fontStyle.contains(sf.PdfFontStyle.italic);
    final double lineSize = line.fontSize > 0 ? line.fontSize : 0;
    final Rect lb = line.bounds;

    final List<_Word> out = <_Word>[];
    double cursor = lb.left;
    for (final sf.TextWord w in line.wordCollection) {
      final String t = _clean(w.text);
      if (t.isEmpty) continue;
      final bool bold = w.fontStyle.contains(sf.PdfFontStyle.bold) || lineBold;
      final bool italic =
          w.fontStyle.contains(sf.PdfFontStyle.italic) || lineItalic;
      final double fs = w.fontSize > 0 ? w.fontSize : lineSize;
      final Rect b = w.bounds;
      double left, right, top, bottom;
      if (b.width > 0 && b.height > 0) {
        left = b.left;
        right = b.right;
        top = b.top;
        bottom = b.bottom;
      } else {
        // Degenerate word bounds: keep the text and lay it out after the
        // previous word using a rough average glyph width, rather than
        // dropping it (which would silently lose content).
        final double approx = t.length * (fs > 0 ? fs : _defaultFontSize) * 0.5;
        left = cursor;
        right = cursor + approx;
        top = lb.top;
        bottom = lb.height > 0 ? lb.bottom : lb.top + _defaultFontSize;
      }
      cursor = right;
      out.add(
        _Word(
          text: t,
          left: left,
          right: right,
          top: top,
          bottom: bottom,
          fontSize: fs,
          bold: bold,
          italic: italic,
        ),
      );
    }

    if (out.isEmpty) {
      final String t = _clean(line.text);
      if (t.isEmpty) return const <_Word>[];
      out.add(
        _Word(
          text: t,
          left: lb.left,
          right: lb.width > 0 ? lb.right : lb.left + t.length * 5.0,
          top: lb.top,
          bottom: lb.height > 0 ? lb.bottom : lb.top + _defaultFontSize,
          fontSize: lineSize,
          bold: lineBold,
          italic: lineItalic,
        ),
      );
    }
    return out;
  }

  // --------------------------------------------------------------- metrics ---

  /// Character-weighted median font size. Weighting by characters instead of by
  /// line makes the baseline immune to a page whose few body lines are
  /// outnumbered by big title lines.
  static double _weightedMedianFontSize(List<_Line> lines) {
    final List<_Word> samples = <_Word>[];
    for (final _Line l in lines) {
      for (final _Word w in l.words) {
        if (w.fontSize > 0 && w.text.isNotEmpty) samples.add(w);
      }
    }
    if (samples.isEmpty) return 0;
    samples.sort((_Word a, _Word b) => a.fontSize.compareTo(b.fontSize));
    final int total = samples.fold<int>(
      0,
      (int s, _Word w) => s + w.text.length,
    );
    if (total <= 0) return samples[samples.length ~/ 2].fontSize;
    var acc = 0;
    for (final _Word w in samples) {
      acc += w.text.length;
      if (acc * 2 >= total) return w.fontSize;
    }
    return samples.last.fontSize;
  }

  // ---------------------------------------------------------------- tables ---

  /// Splits a line into candidate cells: consecutive words are kept together
  /// until the horizontal gap between them grows past a full em, which is far
  /// wider than any inter-word space (even in justified text).
  static List<_Seg> _segments(_Line line, double median) {
    final double fs = line.fontSize > 0 ? line.fontSize : median;
    final double gapLimit = math.max(fs * 1.0, 6.0);
    final List<_Seg> segs = <_Seg>[];
    _Seg? cur;
    for (final _Word w in line.words) {
      if (cur == null || w.left - cur.right > gapLimit) {
        cur = _Seg(w.left, w.right, w.text);
        segs.add(cur);
      } else {
        cur.right = math.max(cur.right, w.right);
        cur.text = '${cur.text} ${w.text}';
      }
    }
    return segs;
  }

  static List<_TableRun> _detectTables(
    List<_Line> lines,
    List<List<_Seg>> segments,
    double median,
  ) {
    final double tol = (median * 0.45).clamp(3.0, 8.0);
    final List<_TableRun> runs = <_TableRun>[];
    var i = 0;
    while (i < lines.length) {
      if (segments[i].length < 2) {
        i++;
        continue;
      }
      var j = i;
      while (j + 1 < lines.length && segments[j + 1].length >= 2) {
        final double gap = lines[j + 1].top - lines[j].bottom;
        final double h = math.max(lines[j].height, lines[j + 1].height);
        if (gap > 2.5 * h) break;
        if (_alignmentScore(segments[j], segments[j + 1], tol) < 2) break;
        j++;
      }
      // A table needs at least 2 rows AND at least 2 columns: a lone
      // right-aligned figure on its own line must never become a table.
      if (j > i) {
        final List<List<_Seg>> rows = segments.sublist(i, j + 1);
        final _ColumnModel? model = _columnModel(rows, tol);
        if (model != null && model.starts.length >= 2) {
          runs.add(_TableRun(i, j, model));
          i = j + 1;
          continue;
        }
      }
      i++;
    }
    return runs;
  }

  /// How many cells of [a] line up with a cell of [b]. Left edges are matched
  /// in order; when both lines have the same number of cells a right-edge match
  /// counts too, so that right-aligned numeric columns are still recognised.
  static int _alignmentScore(List<_Seg> a, List<_Seg> b, double tol) {
    var score = 0;
    var bi = 0;
    for (final _Seg s in a) {
      while (bi < b.length && b[bi].left < s.left - tol) {
        bi++;
      }
      if (bi < b.length && (b[bi].left - s.left).abs() <= tol) {
        score++;
        bi++;
      }
    }
    if (a.length == b.length) {
      var positional = 0;
      for (var k = 0; k < a.length; k++) {
        if ((a[k].left - b[k].left).abs() <= tol ||
            (a[k].right - b[k].right).abs() <= tol) {
          positional++;
        }
      }
      if (positional > score) score = positional;
    }
    return score;
  }

  static _ColumnModel? _columnModel(List<List<_Seg>> rows, double tol) {
    // Uniform cell count: trust the position of each cell. This is the only
    // model that survives right-aligned columns, where left edges never agree.
    final int k = rows.first.length;
    if (k >= 2 && rows.every((List<_Seg> r) => r.length == k)) {
      var consistent = true;
      for (var c = 1; c < k && consistent; c++) {
        final bool leftsAgree = _spread(rows, c, left: true) <= tol * 2;
        final bool rightsAgree = _spread(rows, c, left: false) <= tol * 2;
        consistent = leftsAgree || rightsAgree;
      }
      if (consistent) {
        final List<double> starts = List<double>.generate(k, (int c) {
          double m = rows.first[c].left;
          for (final List<_Seg> r in rows) {
            m = math.min(m, r[c].left);
          }
          return m;
        });
        return _ColumnModel(starts, positional: true);
      }
    }

    // Otherwise cluster the left edges and keep the clusters that appear on at
    // least two different rows.
    final List<_LeftSample> lefts = <_LeftSample>[];
    for (var r = 0; r < rows.length; r++) {
      for (final _Seg s in rows[r]) {
        lefts.add(_LeftSample(s.left, r));
      }
    }
    if (lefts.length < 4) return null;
    lefts.sort((_LeftSample a, _LeftSample b) => a.x.compareTo(b.x));

    final List<double> starts = <double>[];
    var clusterMin = lefts.first.x;
    var sum = 0.0;
    var count = 0;
    Set<int> support = <int>{};
    void flush() {
      if (count > 0 && support.length >= 2) starts.add(sum / count);
    }

    for (final _LeftSample s in lefts) {
      if (count > 0 && s.x - clusterMin > tol) {
        flush();
        clusterMin = s.x;
        sum = 0;
        count = 0;
        support = <int>{};
      }
      sum += s.x;
      count++;
      support.add(s.row);
    }
    flush();

    if (starts.length < 2) return null;
    return _ColumnModel(starts, positional: false);
  }

  static double _spread(List<List<_Seg>> rows, int col, {required bool left}) {
    double lo = double.infinity;
    double hi = -double.infinity;
    for (final List<_Seg> r in rows) {
      final double v = left ? r[col].left : r[col].right;
      lo = math.min(lo, v);
      hi = math.max(hi, v);
    }
    return hi - lo;
  }

  static List<List<String>> _tableRows(
    List<List<_Seg>> rows,
    _ColumnModel model,
  ) {
    final int n = model.starts.length;
    final List<List<String>> out = <List<String>>[];
    for (final List<_Seg> row in rows) {
      final List<String> cells = List<String>.filled(n, '');
      if (model.positional && row.length == n) {
        for (var c = 0; c < n; c++) {
          cells[c] = row[c].text;
        }
      } else {
        for (final _Seg s in row) {
          var c = 0;
          for (var k = 0; k < n; k++) {
            if (s.left + 2.0 >= model.starts[k]) c = k;
          }
          cells[c] = cells[c].isEmpty ? s.text : '${cells[c]} ${s.text}';
        }
      }
      out.add(cells);
    }
    return out;
  }

  // ---------------------------------------------------------------- blocks ---

  static List<LayoutBlock> _buildBlocks(
    List<_Line> lines,
    List<List<_Seg>> segments,
    List<_TableRun> tables,
    double median,
  ) {
    final Map<int, _TableRun> startsAt = <int, _TableRun>{
      for (final _TableRun t in tables) t.start: t,
    };

    final List<_Entry> entries = <_Entry>[];
    _Para? para;
    void flush() {
      if (para != null) {
        entries.add(_Entry.paragraph(para!));
        para = null;
      }
    }

    var i = 0;
    while (i < lines.length) {
      final _TableRun? table = startsAt[i];
      if (table != null) {
        flush();
        entries.add(
          _Entry.table(
            _tableRows(
              segments.sublist(table.start, table.end + 1),
              table.model,
            ),
            _union(lines.sublist(table.start, table.end + 1)),
            lines[table.start].top,
          ),
        );
        i = table.end + 1;
        continue;
      }
      final _Line line = lines[i];
      if (para == null) {
        para = _Para(line);
      } else if (_startsNewParagraph(para!, line, median)) {
        flush();
        para = _Para(line);
      } else {
        para!.add(line);
      }
      i++;
    }
    flush();

    final List<LayoutBlock> blocks = <LayoutBlock>[];
    for (var e = 0; e < entries.length; e++) {
      final _Entry entry = entries[e];
      if (entry.table != null) {
        blocks.add(LayoutBlock.table(rows: entry.table!, bounds: entry.bounds));
        continue;
      }
      final _Para p = entry.para!;
      final double gapAfter = e + 1 < entries.length
          ? entries[e + 1].top - p.lines.last.bottom
          : double.infinity;
      blocks.add(
        LayoutBlock.paragraph(
          runs: _buildRuns(p, median),
          bounds: _union(p.lines),
          headingLevel: _headingLevel(p, median, gapAfter),
        ),
      );
    }
    return blocks;
  }

  static bool _startsNewParagraph(_Para para, _Line cur, double median) {
    final _Line prev = para.lines.last;
    final double h = math.max(prev.height, cur.height);
    final double prevSize = prev.fontSize > 0 ? prev.fontSize : median;
    final double curSize = cur.fontSize > 0 ? cur.fontSize : median;

    // Vertical pitch (top to top) noticeably larger than a normal line.
    if (cur.top - prev.top > 1.55 * h) return true;

    // Material font size change.
    final double hi = math.max(prevSize, curSize);
    final double lo = math.max(math.min(prevSize, curSize), 0.1);
    if (hi / lo > 1.15) return true;

    // A fully bold line next to a non-bold one is a heading, not a continuation.
    if (prev.allBold != cur.allBold) return true;

    // The previous line stopped well short of the block's right margin, so it
    // ended the paragraph.
    if (prev.right < para.maxRight - 2.5 * prevSize) return true;

    // Indent change. The one exception is the classic first-line indent, where
    // line 2 of a paragraph starts to the LEFT of line 1.
    final double indentTol = math.max(4.0, median * 0.6);
    final double dl = cur.left - prev.left;
    if (dl.abs() > indentTol) {
      final bool firstLineIndent =
          para.lines.length == 1 && dl < 0 && dl.abs() < 5 * median;
      if (!firstLineIndent) return true;
    }
    return false;
  }

  static int _headingLevel(_Para p, double median, double gapAfter) {
    double maxFs = 0;
    for (final _Line l in p.lines) {
      maxFs = math.max(maxFs, l.maxFontSize);
    }
    if (maxFs <= 0) maxFs = median;
    final double ratio = median > 0 ? maxFs / median : 1.0;
    final bool allBold = p.lines.every((_Line l) => l.allBold);

    if (ratio >= 1.6) return 1;
    if (ratio >= 1.3) return 2;
    if (ratio >= 1.15 && allBold) return 3;

    // A short, fully bold, single line followed by extra whitespace reads as a
    // run-in heading even when its size matches the body text.
    if (allBold && p.lines.length == 1) {
      final String t = p.plainText;
      final int wordCount = t
          .split(' ')
          .where((String w) => w.isNotEmpty)
          .length;
      final bool sentenceLike =
          t.endsWith('.') || t.endsWith(';') || t.endsWith(',');
      if (wordCount > 0 &&
          wordCount <= 12 &&
          !sentenceLike &&
          gapAfter > 0.6 * p.lines.first.height) {
        return 3;
      }
    }
    return 0;
  }

  static List<LayoutRun> _buildRuns(_Para p, double median) {
    final List<_Tok> toks = <_Tok>[];
    for (var li = 0; li < p.lines.length; li++) {
      final _Line line = p.lines[li];
      final double lineSize = line.fontSize > 0 ? line.fontSize : median;
      for (var wi = 0; wi < line.words.length; wi++) {
        final _Word w = line.words[wi];
        var text = w.text;
        var spaceAfter = true;
        final bool lastOfLine = wi == line.words.length - 1;
        if (lastOfLine && li < p.lines.length - 1 && text.length > 1) {
          // Soft hyphen at a line break: glue the two halves back together.
          final List<_Word> nextWords = p.lines[li + 1].words;
          if (text.endsWith('-') &&
              nextWords.isNotEmpty &&
              _startsLowercase(nextWords.first.text)) {
            text = text.substring(0, text.length - 1);
            spaceAfter = false;
          }
        }
        if (text.isEmpty) continue;
        final double fs = w.fontSize > 0 ? w.fontSize : lineSize;
        toks.add(
          _Tok(
            text: text,
            bold: w.bold,
            italic: w.italic,
            fontSize: _roundHalf(fs > 0 ? fs : median),
            spaceAfter: spaceAfter,
          ),
        );
      }
    }
    if (toks.isEmpty) return const <LayoutRun>[];

    final List<LayoutRun> runs = <LayoutRun>[];
    final StringBuffer buf = StringBuffer();
    _Tok style = toks.first;
    for (var i = 0; i < toks.length; i++) {
      final _Tok t = toks[i];
      if (!t.sameStyleAs(style)) {
        runs.add(
          LayoutRun(
            text: buf.toString(),
            bold: style.bold,
            italic: style.italic,
            fontSize: style.fontSize,
          ),
        );
        buf.clear();
        style = t;
      }
      buf.write(t.text);
      // The separating space is written at the end of the current run, so that
      // concatenating every run restores the paragraph exactly.
      if (t.spaceAfter && i < toks.length - 1) buf.write(' ');
    }
    runs.add(
      LayoutRun(
        text: buf.toString(),
        bold: style.bold,
        italic: style.italic,
        fontSize: style.fontSize,
      ),
    );
    return runs;
  }

  // ----------------------------------------------------------------- utils ---

  static Rect _union(List<_Line> lines) {
    double l = lines.first.left;
    double t = lines.first.top;
    double r = lines.first.right;
    double b = lines.first.bottom;
    for (final _Line line in lines) {
      l = math.min(l, line.left);
      t = math.min(t, line.top);
      r = math.max(r, line.right);
      b = math.max(b, line.bottom);
    }
    return Rect.fromLTRB(l, t, r, b);
  }

  static bool _startsLowercase(String s) {
    if (s.isEmpty) return false;
    final String c = s[0];
    return c.toLowerCase() == c && c.toUpperCase() != c;
  }

  static double _roundHalf(double v) => (v * 2).roundToDouble() / 2;

  /// Drops control characters and collapses every run of whitespace into a
  /// single space. Done by code unit rather than by regexp so that a stray
  /// NUL or form feed inside an extracted string can never reach the output.
  static String _clean(String s) {
    final StringBuffer b = StringBuffer();
    var pendingSpace = false;
    for (var i = 0; i < s.length; i++) {
      final int c = s.codeUnitAt(i);
      final bool isSpace =
          c == 0x20 ||
          c == 0x09 ||
          c == 0x0A ||
          c == 0x0D ||
          c == 0x0B ||
          c == 0x0C ||
          c == 0xA0;
      if (isSpace) {
        if (b.isNotEmpty) pendingSpace = true;
        continue;
      }
      if (c < 0x20 || c == 0x7F) continue;
      if (pendingSpace) {
        b.write(' ');
        pendingSpace = false;
      }
      b.writeCharCode(c);
    }
    return b.toString();
  }
}

/// Used whenever a PDF reports no usable font size at all.
const double _defaultFontSize = 12;

// ---------------------------------------------------------------- internals ---

class _Word {
  _Word({
    required this.text,
    required this.left,
    required this.right,
    required this.top,
    required this.bottom,
    required this.fontSize,
    required this.bold,
    required this.italic,
  });

  final String text;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final double fontSize;
  final bool bold;
  final bool italic;
}

class _Line {
  _Line(this.words) {
    double l = words.first.left;
    double r = words.first.right;
    double t = words.first.top;
    double b = words.first.bottom;
    var bold = true;
    double maxFs = 0;
    final List<_Word> sized = <_Word>[];
    for (final _Word w in words) {
      l = math.min(l, w.left);
      r = math.max(r, w.right);
      t = math.min(t, w.top);
      b = math.max(b, w.bottom);
      if (!w.bold) bold = false;
      if (w.fontSize > 0) {
        maxFs = math.max(maxFs, w.fontSize);
        sized.add(w);
      }
    }
    left = l;
    right = r;
    top = t;
    bottom = b;
    allBold = bold;
    maxFontSize = maxFs;
    if (sized.isEmpty) {
      fontSize = 0;
    } else {
      sized.sort((_Word a, _Word c) => a.fontSize.compareTo(c.fontSize));
      fontSize = sized[sized.length ~/ 2].fontSize;
    }
  }

  final List<_Word> words;
  late final double left;
  late final double right;
  late final double top;
  late final double bottom;
  late final double fontSize;
  late final double maxFontSize;
  late final bool allBold;

  /// Never zero: a degenerate bounds box would break every ratio below.
  double get height {
    final double h = bottom - top;
    if (h > 0.5) return h;
    return fontSize > 0 ? fontSize : _defaultFontSize;
  }

  String get text => words.map((_Word w) => w.text).join(' ');
}

class _Seg {
  _Seg(this.left, this.right, this.text);
  final double left;
  double right;
  String text;
}

class _LeftSample {
  _LeftSample(this.x, this.row);
  final double x;
  final int row;
}

class _ColumnModel {
  _ColumnModel(this.starts, {required this.positional});
  final List<double> starts;

  /// True when cells are matched by their index in the row rather than by
  /// their x position (used for right-aligned columns).
  final bool positional;
}

class _TableRun {
  _TableRun(this.start, this.end, this.model);
  final int start;
  final int end;
  final _ColumnModel model;
}

class _Para {
  _Para(_Line first) {
    lines.add(first);
    maxRight = first.right;
  }

  final List<_Line> lines = <_Line>[];
  late double maxRight;

  void add(_Line line) {
    lines.add(line);
    maxRight = math.max(maxRight, line.right);
  }

  String get plainText => lines.map((_Line l) => l.text).join(' ');
}

class _Tok {
  _Tok({
    required this.text,
    required this.bold,
    required this.italic,
    required this.fontSize,
    required this.spaceAfter,
  });

  final String text;
  final bool bold;
  final bool italic;
  final double fontSize;
  final bool spaceAfter;

  bool sameStyleAs(_Tok o) =>
      bold == o.bold && italic == o.italic && fontSize == o.fontSize;
}

class _Entry {
  _Entry.paragraph(_Para p)
    : para = p,
      table = null,
      bounds = Rect.zero,
      top = p.lines.first.top;

  _Entry.table(this.table, this.bounds, this.top) : para = null;

  final _Para? para;
  final List<List<String>>? table;
  final Rect bounds;
  final double top;
}
