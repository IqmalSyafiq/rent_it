import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/models/app_user/app_user.dart';
import 'package:rent_it/resources/strings/top_level_strings/firebase/firestore_paths.dart';

final userRoleStreamProvider = StreamProvider.autoDispose<UserRole?>((ref) async* {
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    return; // end execution here
  }

  final uid = user.uid;
  final stream = FirebaseFirestore.instance.collection(FirestoreCollections.users).doc(uid).snapshots();

  await for (final snapshot in stream) {
    if (snapshot.exists) {
      final userData = snapshot.data();

      if (userData != null && userData.containsKey('role')) {
        final userRole = userData['role'];
        if (userRole != null) {
          yield userRole == 'owner' ? UserRole.owner : UserRole.tenant;
        } else {
          yield null;
        }
      } else {
        yield null; // yield default value when role is null or doesn't exist
      }
    } else {
      yield null; // yield default value when user object doesn't exist
    }
  }
});
