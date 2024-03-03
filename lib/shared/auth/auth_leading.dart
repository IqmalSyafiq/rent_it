import 'package:flutter/material.dart';

class AuthLeading extends StatelessWidget {
  final String text;
  const AuthLeading({required this.text, super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 20, right: 20),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      );
}
