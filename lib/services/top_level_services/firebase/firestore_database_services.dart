import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:rent_it/models/app_user/app_user.dart';
import 'package:rent_it/models/house/house.dart';
import 'package:rent_it/models/report/report.dart';
import 'package:rent_it/resources/strings/top_level_strings/firebase/firestore_paths.dart';
import 'package:rent_it/services/top_level_services/firebase/firestore_services.dart';

Future<AppUser?> getUser() async {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  try {
    final documentSnapshot = await FirestoreService.instance.getDataSnaphot(path: FirestorePath.user(uid!));
    return AppUser.fromFirestore(documentSnapshot);
  } catch (error) {
    return null;
  }
}

Future<void> updateUserFields(Map<String, dynamic> value) async {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  try {
    await FirestoreService.instance.updateData(path: FirestorePath.user(userId ?? ''), data: value);
  } catch (error) {
    Logger().e(error);
  }
}

Future<void> setHouse() async {
  final house = House(
    id: getRandString(21),
    ownerId: getRandString(21),
    addressLineOne: 'B-32-52',
    addressLineTwo: 'Jalan 1/149E',
    postCode: '58000',
    city: 'Kuala Lumpur',
    state: 'Kuala Lumpur',
    numRooms: 3,
    bathrooms: 2,
    monthlyRent: 200,
    tenantsId: [
      FirebaseAuth.instance.currentUser?.uid ?? ''
    ],
  );

  try {
    await FirestoreService.instance.setData(path: FirestorePath.house(house.id), data: house.toJson(), merge: true);
  } catch (error) {
    Logger().e(error);
  }
}

Future<void> setReport(Report report) async {
  try {
    await FirestoreService.instance.setData(path: FirestorePath.report(report.id), data: report.toJson());
  } catch (error) {
    Logger().e(error);
  }
}

  // Future<void> updateDocumentFields(String documentId, Map<String, dynamic> value) async {
  //   try {
  //     await _service.updateData(path: FirestorePath.document(documentId), data: value);
  //   } catch (error) {
  //     throw Exception('Error updating document fields: $error');
  //   }
  // }
