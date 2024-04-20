import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondaryButton extends ConsumerStatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final bool needLoading;
  final Color? textColor;
  const SecondaryButton({required this.onPressed, required this.text, this.needLoading = false, this.textColor, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends ConsumerState<SecondaryButton> {
  bool loading = false;

  void toggleLoading() {
    setState(() {
      loading = !loading;
    });
  }

  @override
  Widget build(BuildContext context) => SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (widget.needLoading) {
            toggleLoading();
            await Future.delayed(const Duration(seconds: 2));
            widget.onPressed();
            toggleLoading();
          } else {
            widget.onPressed();
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.outline),
          side: MaterialStateProperty.all(BorderSide(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.06))),
          fixedSize: MaterialStateProperty.all(const Size(double.infinity, 48)),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)))),
        ),
        child: loading
            ? CupertinoActivityIndicator(color: Theme.of(context).colorScheme.outlineVariant)
            : Text(
                widget.text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: widget.textColor ?? Theme.of(context).colorScheme.onSurface),
              ),
      ));
}
