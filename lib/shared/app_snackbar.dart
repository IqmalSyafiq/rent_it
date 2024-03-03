import 'package:flutter/material.dart';

SnackBar appSnackBar(BuildContext context, {required String message, bool error = false}) {
  return SnackBar(
    backgroundColor: error ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.primary,
    content: Text(
      message,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.inversePrimary),
    ),
    action: SnackBarAction(
      textColor: Theme.of(context).colorScheme.surfaceTint,
      label: 'Close',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
}
