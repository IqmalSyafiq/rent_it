import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/services/top_level_services/main_services.dart/main_services.dart';

class BuildNotification extends ConsumerStatefulWidget {
  final String title;
  final int createdAt;
  final String body;
  const BuildNotification({
    required this.title,
    required this.createdAt,
    required this.body,
    super.key,
  });

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
            Row(children: [
              Text(widget.title, style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(width: 10),
              Text(timeAgo(widget.createdAt), style: AppTextStyles.bodySmall.copyWith(color: Theme.of(context).colorScheme.scrim)),
            ]),
            Text(widget.body, style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w300))
          ],
        ),
      );
}
