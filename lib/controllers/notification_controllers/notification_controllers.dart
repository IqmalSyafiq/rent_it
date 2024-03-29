import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/models/notification/notification.dart';

final userNotificationsListStreamProvider = StreamProvider.family<List<Notification>, String>((ref, path) async* {
  final docRef = FirebaseDatabase.instance.ref(path);
  final stream = docRef.onValue;

  await for (final event in stream) {
    final snapshot = event.snapshot;

    if (snapshot.value == null) {
      yield []; // Use null to represent absence of data
    } else {
      // Map each item in the snapshot to a Notification object
      final notificationsMap = snapshot.value as Map;
      final notificationsList = notificationsMap.entries.map((entry) => Notification.fromJson(Map<String, dynamic>.from(entry.value))).toList();
      yield notificationsList;
    }
  }
});
