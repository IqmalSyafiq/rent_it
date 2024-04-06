import 'package:firebase_database/firebase_database.dart';
import 'package:logger/logger.dart';
import 'package:rent_it/models/notification/notification.dart';
import 'package:rent_it/resources/strings/top_level_strings/firebase/realtime_db_refs.dart';

Future<void> setNotification(Notification notification) async {
  final dbRef = RealtimeDatabaseRefs().notifcation(notification.userId, notification.id);
  final docRef = FirebaseDatabase.instance.ref(dbRef);
  try {
    await docRef.set(notification.toJson());
  } catch (e) {
    Logger().e(e);
  }
}
