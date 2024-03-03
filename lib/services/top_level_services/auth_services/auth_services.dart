import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:rent_it/controllers/auth_controllers/auth_view_controllers.dart';
import 'package:rent_it/models/app_user/app_user.dart';
import 'package:rent_it/resources/strings/top_level_strings/firebase/firestore_paths.dart';
import 'package:rent_it/services/top_level_services/firebase/firestore_services.dart';
import 'package:rent_it/shared/app_snackbar.dart';

class AuthSevices {
  AuthSevices({required this.context, required this.ref});
  final BuildContext context;
  final WidgetRef ref;

  Future<void> signIn({required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      showAuthErrorSnackBar('Please fill in all fields');
    }
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUser({required String email, required String password, required String userName}) async {
    if (email.isEmpty || password.isEmpty || userName.isEmpty) {
      showAuthErrorSnackBar('Please fill in all fields');
    }

    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) async {
      final userRole = ref.read(selectedRoleNotifierProvider.notifier).role;
      final user = AppUser(id: value.user!.uid, userName: userName, email: email, role: userRole);
      await createUserFirestoreObject(user);
    });
  }

  Future<void> createUserFirestoreObject(AppUser user) async {
    try {
      FirestoreService.instance.setData(path: FirestorePath.user(user.id), data: user.toJson(), merge: true);
    } catch (e) {
      Logger().e('Error creating user: $e');
    }
  }

  void showAuthErrorSnackBar(String message) {
    final snackBar = appSnackBar(context, message: message, error: true);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> signInWithGoogle(UserRole? role) async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    if (gUser == null) {
      return;
    }

    final GoogleSignInAuthentication gAuth = await gUser.authentication;
    final credential = GoogleAuthProvider.credential(accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    try {
      final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
      final bool newUser = authResult.additionalUserInfo?.isNewUser ?? true;

      if (newUser) {
        final user = AppUser(id: authResult.user!.uid, userName: authResult.user?.displayName ?? '', email: authResult.user?.email ?? '', role: role);
        await createUserFirestoreObject(user);
      }
    } catch (e) {
      showAuthErrorSnackBar("Error signing in with Google: $e");
    }
  }
}
