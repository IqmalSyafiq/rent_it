import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/models/app_user/app_user.dart';
import 'package:rent_it/models/report/report.dart';
import 'package:rent_it/resources/strings/top_level_strings/firebase/firestore_paths.dart';

final userReportsStreamProvider = StreamProvider.autoDispose.family<List<Report>, UserRole>((ref, role) async* {
  final firebaseUser = FirebaseAuth.instance.currentUser;

  if (firebaseUser == null) {
    yield []; // end execution here
    return;
  }

  final uid = firebaseUser.uid;
  var stream = FirebaseFirestore.instance.collection(FirestoreCollections.reports).where('reporter_id', isEqualTo: uid).snapshots();

  if (role == UserRole.owner) {
    stream = FirebaseFirestore.instance.collection(FirestoreCollections.reports).where('receiver_id', isEqualTo: uid).snapshots();
  }

  await for (final snapshot in stream) {
    if (snapshot.size > 0) {
      final reports = snapshot.docs.map((doc) => Report.fromFirestore(doc)).toList();
      yield reports;
    } else {
      yield [];
    }
  }
});

final reportStreamProvider = StreamProvider.autoDispose.family<Report?, String>((ref, reportId) async* {
  final firebaseUser = FirebaseAuth.instance.currentUser;

  if (firebaseUser == null) {
    yield null; // end execution here
    return;
  }

  final stream = FirebaseFirestore.instance.collection(FirestoreCollections.reports).doc(reportId).snapshots();

  await for (final snapshot in stream) {
    if (snapshot.exists) {
      final report = Report.fromFirestore(snapshot);
      yield report;
    } else {
      yield null;
    }
  }
});
