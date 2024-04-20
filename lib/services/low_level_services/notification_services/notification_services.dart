import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:logger/logger.dart';
import 'package:rent_it/models/house/house.dart';
import 'package:rent_it/resources/strings/top_level_strings/firebase/realtime_db_refs.dart';
import 'package:rent_it/services/top_level_services/firebase/firestore_database_services.dart';

Future<void> acceptInvitation(House house, String tenancyId) async {
  try {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) {
      Logger().e('No currently signed-in user');
      return;
    }

    List<String> existingList = List<String>.from(house.tenantsId ?? []);
    existingList.add(uid);
    final value = {
      'tenants_id': existingList,
    };

    final tenancyVal = {
      'is_active': true,
    };

    await updateHouse(house.id, value);
    await updateTenancy(tenancyId, tenancyVal);
  } catch (error) {
    Logger().e(error);
  }
}

Future<void> deleteInvitation(String notificationId) async {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  final path = RealtimeDatabaseRefs().notifcation(uid ?? '', notificationId);
  final docRef = FirebaseDatabase.instance.ref(path);

  try {
    await docRef.remove();
  } catch (error) {
    Logger().e(error);
  }
}
