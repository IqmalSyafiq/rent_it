import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:rent_it/models/app_user/app_user.dart';
import 'package:rent_it/models/house/house.dart';
import 'package:rent_it/models/report/report.dart';
import 'package:rent_it/models/tenancy/tenancy.dart';
import 'package:rent_it/models/tenancy_document/tenancy_document.dart';
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

Future<void> setHouse(House house) async {
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

Future<void> setTenancy(Tenancy tenancy) async {
  try {
    await FirestoreService.instance.setData(path: FirestorePath.tenancyById(tenancy.id), data: tenancy.toJson(), merge: true);
  } catch (error) {
    Logger().e(error);
  }
}

Future<void> setTenancyDocument(TenancyDocument doc) async {
  try {
    await FirestoreService.instance.setData(path: FirestorePath.tenancyDocument(doc.id), data: doc.toJson(), merge: true);
  } catch (error) {
    Logger().e(error);
  }
}

Future<String?> getUserByEmailAddress(String email) async {
  try {
    final userSnapshot = await FirebaseFirestore.instance.collection(FirestoreCollections.users).where('email', isEqualTo: email).get();

    if (userSnapshot.docs.isNotEmpty) {
      return userSnapshot.docs.first.id;
    } else {
      return null;
    }
  } catch (error) {
    Logger().e(error);
    return null;
  }
}

Future<void> updateHouse(String houseId, Map<String, dynamic> value) async {
  try {
    await FirestoreService.instance.updateData(path: FirestorePath.house(houseId), data: value);
  } catch (error) {
    Logger().e(error);
  }
}

Future<void> updateTenancy(String tenancyId, Map<String, dynamic> value) async {
  try {
    await FirestoreService.instance.updateData(path: FirestorePath.tenancyById(tenancyId), data: value);
  } catch (error) {
    Logger().e(error);
  }
}

Future<void> deleteTenancy(String tenancyId) async {
  try {
    await FirestoreService.instance.deleteData(path: FirestorePath.tenancyById(tenancyId));
  } catch (error) {
    Logger().e(error);
  }
}

Future<void> deleteTenancyDocument(String id) async {
  try {
    await FirestoreService.instance.deleteData(path: FirestorePath.tenancyDocument(id));
  } catch (error) {
    Logger().e(error);
  }
}

Future<void> updateReport(String reportId, Map<String, dynamic> value) async {
  try {
    await FirestoreService.instance.updateData(path: FirestorePath.report(reportId), data: value);
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
