enum DiffLineType { same, added, removed }

class DiffLine {
  const DiffLine(this.type, this.text);
  final DiffLineType type;
  final String text;
}

class PageDiff {
  const PageDiff({required this.pageNumber, required this.lines});
  final int pageNumber;
  final List<DiffLine> lines;

  bool get hasChanges => lines.any((l) => l.type != DiffLineType.same);
}

/// Simple line-based diff engine built on a classic LCS dynamic-programming
/// table — no external dependency needed for page-sized text.
class CompareEngine {
  CompareEngine._();

  static List<String> splitLines(String text) {
    if (text.isEmpty) return const <String>[];
    return text
        .replaceAll('\r\n', '\n')
        .split('\n')
        .map((l) => l.trimRight())
        .where((l) => l.isNotEmpty)
        .toList();
  }

  /// Computes a line-level diff between [a] and [b] using an O(N*M) LCS
  /// dynamic-programming table, then walks the table back to produce a
  /// same/added/removed sequence.
  static List<DiffLine> diffLines(List<String> a, List<String> b) {
    final int n = a.length;
    final int m = b.length;
    final List<List<int>> dp = List.generate(
      n + 1,
      (_) => List<int>.filled(m + 1, 0),
    );
    for (var i = n - 1; i >= 0; i--) {
      for (var j = m - 1; j >= 0; j--) {
        if (a[i] == b[j]) {
          dp[i][j] = dp[i + 1][j + 1] + 1;
        } else {
          dp[i][j] = dp[i + 1][j] >= dp[i][j + 1] ? dp[i + 1][j] : dp[i][j + 1];
        }
      }
    }

    final List<DiffLine> result = [];
    var i = 0, j = 0;
    while (i < n && j < m) {
      if (a[i] == b[j]) {
        result.add(DiffLine(DiffLineType.same, a[i]));
        i++;
        j++;
      } else if (dp[i + 1][j] >= dp[i][j + 1]) {
        result.add(DiffLine(DiffLineType.removed, a[i]));
        i++;
      } else {
        result.add(DiffLine(DiffLineType.added, b[j]));
        j++;
      }
    }
    while (i < n) {
      result.add(DiffLine(DiffLineType.removed, a[i]));
      i++;
    }
    while (j < m) {
      result.add(DiffLine(DiffLineType.added, b[j]));
      j++;
    }
    return result;
  }

  static PageDiff diffPage(int pageNumber, String textA, String textB) {
    return PageDiff(
      pageNumber: pageNumber,
      lines: diffLines(splitLines(textA), splitLines(textB)),
    );
  }
}
