import 'dart:math' as math;

import '../../models/page_selection.dart';
import '../../models/source_doc.dart';

/// The app's signature feature: a simplex scanner produces two files — odd
/// pages in order, even pages usually in *reverse* order (the stack comes
/// out of the feeder upside down on the second pass) — and this interleaves
/// them back into reading order.
class RectoVerso {
  RectoVerso._();

  static List<PageSelection> interleave({
    required SourceDoc oddDoc,
    required SourceDoc evenDoc,
    required bool evenIsReversed,
  }) {
    final int oddCount = oddDoc.pageCount;
    final int evenCount = evenDoc.pageCount;
    final int total = math.max(oddCount, evenCount);
    final List<PageSelection> result = <PageSelection>[];
    for (var i = 0; i < total; i++) {
      if (i < oddCount) {
        result.add(PageSelection(source: oddDoc, pageIndex: i));
      }
      final int evenIndex = evenIsReversed ? evenCount - 1 - i : i;
      if (evenIndex >= 0 && evenIndex < evenCount) {
        result.add(PageSelection(source: evenDoc, pageIndex: evenIndex));
      }
    }
    return result;
  }
}
