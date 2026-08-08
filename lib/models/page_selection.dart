import 'source_doc.dart';

/// A single page picked from a [SourceDoc], with the total rotation
/// (intrinsic + user) already resolved by the caller when needed.
class PageSelection {
  const PageSelection({required this.source, required this.pageIndex});

  final SourceDoc source;
  final int pageIndex;

  int get extraRotationDegrees => source.rotations[pageIndex];
}
