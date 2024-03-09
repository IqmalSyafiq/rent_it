import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/shared/notification/build_notifcation.dart';

class NotificationView extends ConsumerStatefulWidget {
  const NotificationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotificationViewState();
}

class _NotificationViewState extends ConsumerState<NotificationView> {
  @override
  Widget build(BuildContext context) {
    int numberOfNotifications = 15;

    List<Widget> notifications = List<Widget>.generate(
      numberOfNotifications,
      (index) => const BuildNotification(),
    );

    return ListView(
      children: [
        ...notifications,
      ],
    );
  }
}
