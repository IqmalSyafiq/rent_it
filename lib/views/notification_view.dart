import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/notification_controllers/notification_controllers.dart';
import 'package:rent_it/resources/strings/top_level_strings/firebase/realtime_db_refs.dart';
import 'package:rent_it/shared/notification/build_notifcation.dart';

class NotificationView extends ConsumerStatefulWidget {
  const NotificationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotificationViewState();
}

class _NotificationViewState extends ConsumerState<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(userNotificationsListStreamProvider(RealtimeDatabaseRefs().notifications(FirebaseAuth.instance.currentUser?.uid ?? ''))).when(
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
        );
  }
}
