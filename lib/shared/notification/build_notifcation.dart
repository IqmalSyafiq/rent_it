import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/models/notification/notification.dart';
import 'package:rent_it/services/top_level_services/main_services.dart/main_services.dart';
import 'package:rent_it/shared/notification/invitation_modal.dart';

class BuildNotification extends ConsumerStatefulWidget {
  final String notificationId;
  final String title;
  final int createdAt;
  final String body;
  final NotificationType type;
  final String? houseId;
  final String? tenancyId;
  const BuildNotification({
    required this.notificationId,
    required this.title,
    required this.createdAt,
    required this.body,
    required this.type,
    this.houseId,
    this.tenancyId,
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
          border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.scrim.withOpacity(0.3))),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(widget.title, style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(width: 10),
              Text(timeAgo(widget.createdAt), style: AppTextStyles.bodySmall.copyWith(color: Theme.of(context).colorScheme.scrim)),
            ]),
            Text(widget.body, style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w300)),
            if (widget.type == NotificationType.invite) buildSeeInviteButton()
          ],
        ),
      );

  Widget buildSeeInviteButton() => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 16, vertical: 2)),
          ),
          onPressed: () {
            showInvitationModal(
              context,
              widget.notificationId,
              widget.houseId ?? '',
              widget.tenancyId ?? '',
            );
          },
          child: Text(
            'View Invitation',
            style: AppTextStyles.bodySmall.copyWith(color: Theme.of(context).colorScheme.primaryContainer),
          ),
        ),
      );
}
