import 'package:firebase_auth/firebase_auth.dart';
import 'package:rent_it/models/app_user/app_user.dart';
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
    print('Error updating user fields: $error');
  }
}
