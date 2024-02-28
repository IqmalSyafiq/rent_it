import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrimaryButton extends ConsumerStatefulWidget {
  final VoidCallback onPressed;
  final String text;
  const PrimaryButton({required this.onPressed, required this.text, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends ConsumerState<PrimaryButton> {
  @override
  Widget build(BuildContext context) => SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
          fixedSize: MaterialStateProperty.all(const Size(double.infinity, 48)),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)))),
        ),
        child: Text(widget.text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onInverseSurface)),
      ));
}
