import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import '../pdf/pdf_engine.dart';
import 'ooxml.dart';

/// Un fichier PowerPoint choisi par l'utilisateur, garde en octets bruts.
class PickedPptx {
  const PickedPptx({required this.bytes, required this.name});

  final Uint8List bytes;
  final String name;
}

/// Levee quand l'utilisateur choisit un .ppt (PowerPoint 97-2003), qui est un
/// format binaire proprietaire totalement different du .pptx (ZIP + XML).
class LegacyPptException implements Exception {
  const LegacyPptException(this.fileName);

  final String fileName;

  @override
  String toString() =>
      'L\'ancien format .ppt (PowerPoint 97-2003) n\'est pas pris en charge. '
      'Ouvrez « $fileName » dans PowerPoint puis enregistrez-le en .pptx.';
}

/// Conversion PowerPoint -> PDF *textuelle*.
///
/// Limite assumee et affichee dans l'ecran : seul le texte des diapositives
/// (titre + puces) est repris. Les images, formes, arriere-plans, animations
/// et mises en page personnalisees ne sont pas restitues : cela demanderait un
/// moteur de rendu DrawingML complet, que l'application n'embarque pas.
class PptxToPdf {
  PptxToPdf._();

  /// Diapositive 16:9 en points (10 x 5,625 pouces).
  static const double slideWidthPt = 960;
  static const double slideHeightPt = 540;

  static const double _marginX = 60;
  static const double _accentBarHeight = 14;
  static const double _titleTop = 48;
  static const int _maxTitleLines = 3;
  static const double _bulletIndent = 22;
  static const double _bulletGap = 8;
  static const double _footerZone = 46;

  // Les polices standard PDF sont ecrites en WinAnsiEncoding et Syncfusion
  // tronque chaque unite de code a 8 bits : un caractere au-dela de U+00FF
  // ressort donc faux (le rond de puce U+2022 deviendrait un guillemet).
  // On emet directement le code WinAnsi du glyphe voulu.
  static const int _winAnsiBullet = 0x95; // rond de puce
  static const int _winAnsiEllipsis = 0x85; // points de suspension

  static final String _bullet = String.fromCharCode(_winAnsiBullet);
  static final String _ellipsis = String.fromCharCode(_winAnsiEllipsis);

  /// Unicode -> WinAnsi pour la plage 0x80-0x9F : les seuls caracteres
  /// au-dela de Latin-1 qu'une police standard PDF sait afficher.
  static const Map<int, int> _cp1252 = <int, int>{
    0x20AC: 0x80, // euro
    0x201A: 0x82, // guillemet simple bas
    0x0192: 0x83, // f florin
    0x201E: 0x84, // guillemet double bas
    0x2026: 0x85, // points de suspension
    0x2020: 0x86, // croix
    0x2021: 0x87, // double croix
    0x02C6: 0x88, // accent circonflexe
    0x2030: 0x89, // pour mille
    0x0160: 0x8A, // S caron
    0x2039: 0x8B, // chevron simple gauche
    0x0152: 0x8C, // OE lie
    0x017D: 0x8E, // Z caron
    0x2018: 0x91, // apostrophe ouvrante
    0x2019: 0x92, // apostrophe fermante
    0x201C: 0x93, // guillemet double ouvrant
    0x201D: 0x94, // guillemet double fermant
    0x2022: 0x95, // rond de puce
    0x2013: 0x96, // tiret demi-cadratin
    0x2014: 0x97, // tiret cadratin
    0x02DC: 0x98, // tilde
    0x2122: 0x99, // marque deposee
    0x0161: 0x9A, // s caron
    0x203A: 0x9B, // chevron simple droit
    0x0153: 0x9C, // oe lie
    0x017E: 0x9E, // z caron
    0x0178: 0x9F, // Y trema
  };

  /// Ouvre le selecteur systeme limite a une presentation PowerPoint.
  /// Renvoie null si l'utilisateur annule, leve [LegacyPptException] pour un
  /// .ppt et [FormatException] pour toute autre extension.
  static Future<PickedPptx?> pickPptxFile() async {
    final FilePickerResult? result = await FilePicker.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      // .ppt reste selectionnable puis est refuse avec un message clair :
      // c'est plus comprehensible qu'un fichier grise sans explication.
      allowedExtensions: const <String>['pptx', 'ppt'],
      withData: false,
    );
    final List<PlatformFile> files = result?.files ?? const <PlatformFile>[];
    if (files.isEmpty) return null;

    final PlatformFile file = files.first;
    final String name = file.name;
    final int dot = name.lastIndexOf('.');
    final String ext = dot == -1
        ? (file.extension ?? '').toLowerCase()
        : name.substring(dot + 1).toLowerCase();

    if (ext == 'ppt') throw LegacyPptException(name);
    if (ext != 'pptx') {
      throw const FormatException(
        'Choisissez une presentation PowerPoint au format .pptx.',
      );
    }
    if (file.bytes == null && file.path == null) {
      throw FormatException('Fichier illisible : $name');
    }
    final Uint8List bytes = file.bytes ?? await File(file.path!).readAsBytes();
    return PickedPptx(bytes: bytes, name: name);
  }

  /// Extrait le texte des diapositives (titre + puces).
  static List<PptxSlide> readSlides(Uint8List bytes) => Ooxml.readPptx(bytes);

  /// Nom de fichier PDF suggere a partir du nom de la presentation.
  static String suggestedPdfName(String sourceName) {
    final int dot = sourceName.lastIndexOf('.');
    final String base = (dot > 0 ? sourceName.substring(0, dot) : sourceName)
        .trim();
    return '${base.isEmpty ? 'presentation' : base}.pdf';
  }

  /// Construit le PDF : une page paysage 16:9 par diapositive.
  static Future<Uint8List> convert(
    List<PptxSlide> slides, {
    void Function(int done, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    if (slides.isEmpty) {
      throw const FormatException('Aucune diapositive a convertir.');
    }

    final sf.PdfDocument doc = sf.PdfDocument();
    try {
      final sf.PdfStandardFont titleFont = sf.PdfStandardFont(
        sf.PdfFontFamily.helvetica,
        30,
        style: sf.PdfFontStyle.bold,
      );
      final sf.PdfStandardFont bodyFont = sf.PdfStandardFont(
        sf.PdfFontFamily.helvetica,
        16,
      );
      final sf.PdfStandardFont noteFont = sf.PdfStandardFont(
        sf.PdfFontFamily.helvetica,
        14,
        style: sf.PdfFontStyle.italic,
      );
      final sf.PdfStandardFont footerFont = sf.PdfStandardFont(
        sf.PdfFontFamily.helvetica,
        10,
      );

      final int total = slides.length;
      for (int i = 0; i < total; i++) {
        if (cancelToken?.isCancelled ?? false) {
          throw CancelledException();
        }
        _drawSlide(
          doc: doc,
          slide: slides[i],
          number: i + 1,
          total: total,
          titleFont: titleFont,
          bodyFont: bodyFont,
          noteFont: noteFont,
          footerFont: footerFont,
        );
        onProgress?.call(i + 1, total);
        if ((i + 1) % 3 == 0) {
          await Future<void>.delayed(Duration.zero);
        }
      }

      final List<int> bytes = await doc.save();
      return Uint8List.fromList(bytes);
    } finally {
      doc.dispose();
    }
  }

  // -------------------------------------------------------------------------
  // Rendu d'une diapositive
  // -------------------------------------------------------------------------

  static void _drawSlide({
    required sf.PdfDocument doc,
    required PptxSlide slide,
    required int number,
    required int total,
    required sf.PdfStandardFont titleFont,
    required sf.PdfStandardFont bodyFont,
    required sf.PdfStandardFont noteFont,
    required sf.PdfStandardFont footerFont,
  }) {
    // Une section par page : doc.pages.insert() plante sur un document neuf,
    // et c'est le seul moyen sur de fixer une taille de page personnalisee.
    final sf.PdfSection section = doc.sections!.add();
    section.pageSettings.margins.all = 0;
    // L'orientation doit etre posee explicitement : le setter `size` range
    // toujours largeur/hauteur selon l'orientation courante, donc en portrait
    // (valeur par defaut) une taille 960x540 ressortirait en 540x960.
    section.pageSettings.orientation = sf.PdfPageOrientation.landscape;
    section.pageSettings.size = const Size(slideWidthPt, slideHeightPt);
    final sf.PdfPage page = section.pages.add();
    final sf.PdfGraphics g = page.graphics;

    final sf.PdfBrush background = sf.PdfSolidBrush(sf.PdfColor(247, 248, 252));
    final sf.PdfBrush accent = sf.PdfSolidBrush(sf.PdfColor(63, 81, 181));
    final sf.PdfBrush titleBrush = sf.PdfSolidBrush(sf.PdfColor(26, 30, 58));
    final sf.PdfBrush bodyBrush = sf.PdfSolidBrush(sf.PdfColor(45, 48, 62));
    final sf.PdfBrush mutedBrush = sf.PdfSolidBrush(sf.PdfColor(130, 134, 150));
    final sf.PdfStringFormat noWrap = sf.PdfStringFormat(
      wordWrap: sf.PdfWordWrapType.none,
    );

    g.drawRectangle(
      brush: background,
      bounds: const Rect.fromLTWH(0, 0, slideWidthPt, slideHeightPt),
    );
    g.drawRectangle(
      brush: accent,
      bounds: const Rect.fromLTWH(0, 0, slideWidthPt, _accentBarHeight),
    );

    const double contentWidth = slideWidthPt - 2 * _marginX;
    const double bodyBottom = slideHeightPt - _footerZone;

    // --- Titre -------------------------------------------------------------
    double y = _titleTop;
    final String title = _sanitize(slide.title).trim();
    if (title.isNotEmpty) {
      final double lineHeight = titleFont.height + 4;
      List<String> lines = _wrap(title, titleFont, contentWidth);
      if (lines.length > _maxTitleLines) {
        lines = lines.sublist(0, _maxTitleLines);
        lines[_maxTitleLines - 1] = _withEllipsis(
          lines[_maxTitleLines - 1],
          titleFont,
          contentWidth,
        );
      }
      for (final String line in lines) {
        g.drawString(
          line,
          titleFont,
          brush: titleBrush,
          bounds: Rect.fromLTWH(_marginX, y, contentWidth, lineHeight),
          format: noWrap,
        );
        y += lineHeight;
      }
      y += 8;
      g.drawRectangle(brush: accent, bounds: Rect.fromLTWH(_marginX, y, 72, 4));
      y += 26;
    }

    // --- Puces -------------------------------------------------------------
    final List<String> bullets = <String>[];
    for (final String raw in slide.bullets) {
      final String clean = _sanitize(raw).trim();
      if (clean.isNotEmpty) bullets.add(clean);
    }

    if (bullets.isEmpty) {
      if (title.isEmpty) {
        final double height = bodyBottom - y;
        g.drawString(
          'Diapositive sans texte extractible '
          '(image, forme ou graphique uniquement).',
          noteFont,
          brush: mutedBrush,
          bounds: Rect.fromLTWH(
            _marginX,
            y,
            contentWidth,
            height > noteFont.height ? height : noteFont.height,
          ),
          format: sf.PdfStringFormat(
            alignment: sf.PdfTextAlignment.center,
            lineAlignment: sf.PdfVerticalAlignment.middle,
          ),
        );
      }
    } else {
      final double lineHeight = bodyFont.height + 5;
      const double textX = _marginX + _bulletIndent;
      const double textWidth = slideWidthPt - _marginX - textX;

      // La mise en page est calculee entierement avant d'etre dessinee : c'est
      // le seul moyen de marquer la derniere ligne reellement visible par des
      // points de suspension quand le contenu deborde de la diapositive.
      final List<_BulletLine> laid = <_BulletLine>[];
      bool overflow = false;
      double cursor = y;

      outer:
      for (final String bullet in bullets) {
        final List<String> lines = _wrap(bullet, bodyFont, textWidth);
        for (int i = 0; i < lines.length; i++) {
          if (cursor + lineHeight > bodyBottom) {
            overflow = true;
            break outer;
          }
          laid.add(_BulletLine(lines[i], cursor, i == 0));
          cursor += lineHeight;
        }
        cursor += _bulletGap;
      }

      if (overflow && laid.isNotEmpty) {
        final _BulletLine last = laid.removeLast();
        laid.add(
          _BulletLine(
            _withEllipsis(last.text, bodyFont, textWidth),
            last.y,
            last.first,
          ),
        );
      }

      for (final _BulletLine line in laid) {
        if (line.first) {
          g.drawString(
            _bullet,
            bodyFont,
            brush: accent,
            bounds: Rect.fromLTWH(
              _marginX + 2,
              line.y,
              _bulletIndent,
              lineHeight,
            ),
            format: noWrap,
          );
        }
        g.drawString(
          line.text,
          bodyFont,
          brush: bodyBrush,
          bounds: Rect.fromLTWH(textX, line.y, textWidth, lineHeight),
          format: noWrap,
        );
      }
    }

    // --- Numero de diapositive ---------------------------------------------
    g.drawString(
      '$number / $total',
      footerFont,
      brush: mutedBrush,
      bounds: Rect.fromLTWH(
        _marginX,
        slideHeightPt - 32,
        contentWidth,
        footerFont.height + 2,
      ),
      format: sf.PdfStringFormat(alignment: sf.PdfTextAlignment.right),
    );
  }

  // -------------------------------------------------------------------------
  // Texte
  // -------------------------------------------------------------------------

  /// Ramene le texte a ce qu'une police standard PDF (WinAnsi) sait afficher :
  /// apostrophes et tirets typographiques sont convertis, tout ce qui depasse
  /// Latin-1 (CJK, emoji...) devient « ? » plutot qu'un caractere faux.
  static String _sanitize(String input) {
    final StringBuffer buf = StringBuffer();
    for (final int rune in input.runes) {
      final int? mapped = _cp1252[rune];
      if (mapped != null) {
        buf.writeCharCode(mapped);
      } else if (rune == 0x09 ||
          rune == 0x0A ||
          rune == 0x0B ||
          rune == 0x0C ||
          rune == 0x0D ||
          rune == 0xA0) {
        buf.write(' ');
      } else if (rune < 0x20 || rune == 0x7F) {
        // Caractere de controle : ignore.
        continue;
      } else if (rune <= 0xFF) {
        buf.writeCharCode(rune);
      } else {
        buf.write('?');
      }
    }
    return buf.toString();
  }

  /// Decoupe [text] en lignes ne depassant pas [maxWidth] points.
  static List<String> _wrap(String text, sf.PdfFont font, double maxWidth) {
    final List<String> out = <String>[];
    final List<String> words = text
        .split(RegExp(r'\s+'))
        .where((String w) => w.isNotEmpty)
        .toList();
    if (words.isEmpty) return out;

    String current = '';
    for (final String word in words) {
      final String candidate = current.isEmpty ? word : '$current $word';
      if (font.measureString(candidate).width <= maxWidth) {
        current = candidate;
        continue;
      }
      if (current.isNotEmpty) {
        out.add(current);
        current = '';
      }
      if (font.measureString(word).width <= maxWidth) {
        current = word;
        continue;
      }
      // Mot plus long qu'une ligne entiere (URL, reference...) : coupe brute.
      String chunk = '';
      for (int i = 0; i < word.length; i++) {
        final String ch = word[i];
        if (chunk.isNotEmpty &&
            font.measureString('$chunk$ch').width > maxWidth) {
          out.add(chunk);
          chunk = ch;
        } else {
          chunk = '$chunk$ch';
        }
      }
      current = chunk;
    }
    if (current.isNotEmpty) out.add(current);
    return out;
  }

  static String _withEllipsis(String line, sf.PdfFont font, double maxWidth) {
    String s = line.trimRight();
    while (s.isNotEmpty &&
        font.measureString('$s$_ellipsis').width > maxWidth) {
      s = s.substring(0, s.length - 1).trimRight();
    }
    return '$s$_ellipsis';
  }
}

class _BulletLine {
  const _BulletLine(this.text, this.y, this.first);

  final String text;
  final double y;

  /// Vrai pour la premiere ligne d'une puce : c'est elle qui porte le point.
  final bool first;
}
