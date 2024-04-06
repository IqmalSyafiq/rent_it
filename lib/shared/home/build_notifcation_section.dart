import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/notification_controllers/notification_controllers.dart';
import 'package:rent_it/resources/strings/top_level_strings/firebase/realtime_db_refs.dart';
import 'package:rent_it/shared/notification/build_notifcation.dart';

class BuildNotificationSection extends ConsumerStatefulWidget {
  const BuildNotificationSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BuildNotificationSectionState();
}

class _BuildNotificationSectionState extends ConsumerState<BuildNotificationSection> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(userNotificationsListStreamProvider(RealtimeDatabaseRefs().notifications(FirebaseAuth.instance.currentUser?.uid ?? ''))).when(
        data: (notification) => Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Notifications', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.surfaceTint)),
                const SizedBox(height: 20),
                notification.isNotEmpty ? onNotificationExist() : onNotificationDontExist(),
              ],
            )),
        loading: CupertinoActivityIndicator.new,
        error: (_, __) => Container());
  }

  Widget onNotificationExist() => Expanded(
        child: ref.watch(userNotificationsListStreamProvider(RealtimeDatabaseRefs().notifications(FirebaseAuth.instance.currentUser?.uid ?? ''))).when(
              data: (notifications) {
                return ListView(
                  children: notifications
                      .map((notification) => BuildNotification(
                            notificationId: notification.id,
                            title: notification.title,
                            createdAt: notification.createdAt,
                            body: notification.body ?? '',
                            type: notification.type,
                            houseId: notification.houseId,
                          ))
                      .toList(),
                );
              },
              loading: CupertinoActivityIndicator.new,
              error: (_, __) => Container(),
            ),
      );

  Widget onNotificationDontExist() => const Text('No notification', style: TextStyle(color: Colors.grey));
}
