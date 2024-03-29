import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrimaryButton extends ConsumerStatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final bool needLoading;
  final bool disabled;
  final VoidCallback? onDisabledPressed;
  const PrimaryButton({
    required this.onPressed,
    required this.text,
    this.needLoading = false,
    this.disabled = false,
    this.onDisabledPressed,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends ConsumerState<PrimaryButton> {
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
        onPressed: widget.disabled
            ? widget.onDisabledPressed
            : () async {
                if (widget.needLoading) {
                  toggleLoading();
                  await Future.delayed(const Duration(seconds: 2)).then((value) async {
                    widget.onPressed();
                  });
                  toggleLoading();
                } else {
                  widget.onPressed();
                }
              },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
          fixedSize: MaterialStateProperty.all(const Size(double.infinity, 48)),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)))),
        ),
        child: loading
            ? const CupertinoActivityIndicator(color: Colors.white)
            : Text(
                widget.text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onInverseSurface),
              ),
      ));
}
