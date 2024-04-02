import 'package:flutter/material.dart';
import 'package:rent_it/constant/app_text_styles.dart';

class BuildInfoHeading extends StatelessWidget {
  final String text;
  const BuildInfoHeading({required this.text, super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Text(text, style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600)),
      );
}

class BuildInfoContainer extends StatelessWidget {
  final String title;
  final String value;
  const BuildInfoContainer({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.outline))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(value, style: AppTextStyles.bodySmall.copyWith(fontSize: 13)),
          ],
        ),
      );
}
