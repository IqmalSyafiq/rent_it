import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:rent_it/models/house/house.dart';
import 'package:rent_it/models/notification/notification.dart';
import 'package:rent_it/models/report/report.dart';
import 'package:rent_it/services/top_level_services/firebase/firestore_database_services.dart';
import 'package:rent_it/services/top_level_services/firebase/firestore_services.dart';
import 'package:rent_it/services/top_level_services/firebase/realtime_db_services.dart';

Future<void> addReport(String title, String description, House house, String userName) async {
  final uid = FirebaseAuth.instance.currentUser?.uid;

  final report = Report(
    id: getRandString(22),
    reporterId: uid ?? '',
    receiverId: house.ownerId,
    houseId: house.id,
    title: title,
    description: description,
    createdAt: DateTime.now().millisecondsSinceEpoch,
  );

  final notification = Notification(
    id: getRandString(22),
    userId: uid ?? '',
    reportId: report.id,
    title: title,
    body: 'You have a new report from $userName on ${house.addressLineOne} house',
    createdAt: DateTime.now().millisecondsSinceEpoch,
  );

  try {
    await setReport(report);
    await setNotificatio(notification);
  } catch (error) {
    Logger().e(error);
  }
}
