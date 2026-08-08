import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../core/pdf/pdf_engine.dart';

class _ProgressDialog<T> extends StatefulWidget {
  const _ProgressDialog({
    required this.title,
    required this.future,
    required this.progress,
    required this.cancelToken,
    required this.onSettled,
  });

  final String title;
  final Future<T> future;
  final ValueListenable<double?> progress;
  final CancelToken cancelToken;
  final void Function(T? result, Object? error) onSettled;

  @override
  State<_ProgressDialog<T>> createState() => _ProgressDialogState<T>();
}

class _ProgressDialogState<T> extends State<_ProgressDialog<T>> {
  @override
  void initState() {
    super.initState();
    widget.future
        .then((r) {
          widget.onSettled(r, null);
          if (mounted) Navigator.of(context).pop();
        })
        .catchError((Object e) {
          widget.onSettled(null, e);
          if (mounted) Navigator.of(context).pop();
        });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        title: Text(widget.title),
        content: ValueListenableBuilder<double?>(
          valueListenable: widget.progress,
          builder: (context, v, _) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(value: v),
                const SizedBox(height: 12),
                Text(v == null ? 'Préparation…' : '${(v * 100).round()} %'),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: widget.cancelToken.cancel,
            child: const Text('Annuler'),
          ),
        ],
      ),
    );
  }
}

/// Runs [task] while showing a modal, cancellable progress dialog. Returns
/// null if the user cancelled, the result otherwise. Rethrows any other
/// error so the caller can show it.
Future<T?> runWithProgressDialog<T>({
  required BuildContext context,
  required String title,
  required Future<T> Function(
    CancelToken token,
    void Function(int done, int total) onProgress,
  )
  task,
}) async {
  final CancelToken cancelToken = CancelToken();
  final ValueNotifier<double?> progress = ValueNotifier<double?>(null);
  final Future<T> future = task(cancelToken, (done, total) {
    progress.value = total == 0 ? null : done / total;
  });
  T? result;
  Object? error;
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => _ProgressDialog<T>(
      title: title,
      future: future,
      progress: progress,
      cancelToken: cancelToken,
      onSettled: (r, e) {
        result = r;
        error = e;
      },
    ),
  );
  if (error != null) {
    if (error is CancelledException) return null;
    throw error!;
  }
  return result;
}
