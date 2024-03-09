import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/shared/notification/build_notifcation.dart';

class BuildNotificationSection extends ConsumerStatefulWidget {
  const BuildNotificationSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BuildNotificationSectionState();
}

class _BuildNotificationSectionState extends ConsumerState<BuildNotificationSection> {
  @override
  Widget build(BuildContext context) {
    int numberOfNotifications = 5;

    List<Widget> notifications = List<Widget>.generate(
      numberOfNotifications,
      (index) => const BuildNotification(),
    );

    return Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Notifications', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.surfaceTint)),
      const SizedBox(height: 20),
      Expanded(
          child: ListView(children: [
        ...notifications, // Use the spread operator to insert all elements of the list
      ]))
    ]));
  }
}
