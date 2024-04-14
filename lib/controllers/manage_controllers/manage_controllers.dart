import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/models/app_user/app_user.dart';
import 'package:rent_it/models/house/house.dart';
import 'package:rent_it/models/tenancy/tenancy.dart';
import 'package:rent_it/models/tenancy_document/tenancy_document.dart';
import 'package:rent_it/resources/strings/top_level_strings/firebase/firestore_paths.dart';

final housesStreamProvider = StreamProvider.autoDispose.family<List<House>, UserRole?>((ref, role) async* {
  final firebaseUser = FirebaseAuth.instance.currentUser;

  if (firebaseUser == null || role == null) {
    yield []; // end execution here
    return;
  }

  final uid = firebaseUser.uid;
  var stream = FirebaseFirestore.instance.collection(FirestoreCollections.houses).where('tenants_id', arrayContains: uid).snapshots();

  if (role == UserRole.owner) {
    stream = FirebaseFirestore.instance.collection(FirestoreCollections.houses).where('owner_id', isEqualTo: uid).snapshots();
  }

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

final tenantsStreamProvider = StreamProvider.autoDispose.family<List<Tenancy>, String>((ref, houseId) async* {
  final firebaseUser = FirebaseAuth.instance.currentUser;

  if (firebaseUser == null) {
    yield []; // end execution here
    return;
  }

  var stream = FirebaseFirestore.instance.collection(FirestoreCollections.tenancy).where('house_id', isEqualTo: houseId).snapshots();

  await for (final snapshot in stream) {
    if (snapshot.size > 0) {
      final tenants = snapshot.docs.map((doc) => Tenancy.fromFirestore(doc)).toList();
      yield tenants;
    } else {
      yield [];
    }
  }
});

final tenancyStreamProvider = StreamProvider.autoDispose.family<Tenancy?, String>((ref, param) async* {
  final firebaseUser = FirebaseAuth.instance.currentUser;

  if (firebaseUser == null) {
    yield null; // end execution here
    return;
  }

  final tenantId = param.split('.')[0];
  final houseId = param.split('.')[1];

  final stream = FirebaseFirestore.instance.collection(FirestoreCollections.tenancy).where('tenant_id', isEqualTo: tenantId).where('house_id', isEqualTo: houseId).snapshots();

  await for (final snapshot in stream) {
    if (snapshot.docs.isNotEmpty) {
      final tenancy = Tenancy.fromFirestore(snapshot.docs.first);
      yield tenancy;
    } else {
      yield null;
    }
  }
});

final tenancyDocumentsStreamProvider = StreamProvider.autoDispose.family<List<TenancyDocument>, String?>((ref, tenancyId) async* {
  final firebaseUser = FirebaseAuth.instance.currentUser;

  if (firebaseUser == null) {
    yield []; // end execution here
    return;
  }

  var stream = FirebaseFirestore.instance.collection(FirestoreCollections.tenancyDocuments).where('tenancy_id', isEqualTo: tenancyId).snapshots();

  await for (final snapshot in stream) {
    if (snapshot.size > 0) {
      final docs = snapshot.docs.map((doc) => TenancyDocument.fromFirestore(doc)).toList();
      yield docs;
    } else {
      yield [];
    }
  }
});
