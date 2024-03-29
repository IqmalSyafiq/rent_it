import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/models/house/house.dart';
import 'package:rent_it/resources/strings/top_level_strings/firebase/firestore_paths.dart';

final userHouseStreamProvider = StreamProvider.autoDispose<List<House>>((ref) async* {
  final firebaseUser = FirebaseAuth.instance.currentUser;

  if (firebaseUser == null) {
    yield []; // end execution here
    return;
  }

  final uid = firebaseUser.uid;
  final stream = FirebaseFirestore.instance.collection(FirestoreCollections.houses).where('tenants_id', arrayContains: uid).snapshots();

  await for (final snapshot in stream) {
    if (snapshot.size > 0) {
      final houses = snapshot.docs.map((doc) => House.fromFirestore(doc)).toList();
      yield houses;
    } else {
      yield [];
    }
  }
});

final houseStreamProvider = StreamProvider.autoDispose.family<House?, String>((ref, houseId) async* {
  final firebaseUser = FirebaseAuth.instance.currentUser;

  if (firebaseUser == null) {
    yield null; // end execution here
    return;
  }

  final stream = FirebaseFirestore.instance.collection(FirestoreCollections.houses).doc(houseId).snapshots();

  await for (final snapshot in stream) {
    if (snapshot.exists) {
      final house = House.fromFirestore(snapshot);
      yield house;
    } else {
      yield null;
    }
  }
});
