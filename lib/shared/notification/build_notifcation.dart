import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';

class BuildNotification extends ConsumerStatefulWidget {
  const BuildNotification({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BuildNotificationState();
}

class _BuildNotificationState extends ConsumerState<BuildNotification> {
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
            Text(
              'Your house policy for B-35-23 has been successfully update.',
              style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w300),
            )
          ],
        ),
      );
}
