import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';

class BuildReportWidget extends ConsumerStatefulWidget {
  const BuildReportWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BuildReportWidgetState();
}

class _BuildReportWidgetState extends ConsumerState<BuildReportWidget> {
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Theme.of(context).colorScheme.scrim.withOpacity(0.3)),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('House Update', style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(width: 10),
                Text('- 2 days ago', style: AppTextStyles.bodySmall.copyWith(color: Theme.of(context).colorScheme.scrim)),
              ],
            ),
            Row(
              children: [
                Text('B-23-52', style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w500)),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'House',
                    style: AppTextStyles.labelSmall.copyWith(color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Your house policy for B-35-23 has been successfully update.',
              style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w300),
            )
          ],
        ),
      );
}
