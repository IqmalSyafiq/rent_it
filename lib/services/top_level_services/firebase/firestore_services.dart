library firestore_service;

import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

String getRandString(int len) {
  final random = Random.secure();
  final values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.set(data, SetOptions(merge: merge));
  }

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.update(data);
  }

  Future<void> deleteData({required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.delete();
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(DocumentSnapshot<Map<String, Object?>>) builder,
    Query<Map<String, dynamic>>? Function(Query<Map<String, dynamic>> query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query<Map<String, dynamic>> query = FirebaseFirestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final snapshots = query.snapshots();

    return snapshots.map((snapshot) {
      final result = snapshot.docs.map((snapshot) => builder(snapshot)).where((value) => value != null).toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<T> documentStream<T>({
    required String path,
    required T Function(DocumentSnapshot<Map<String, Object?>>) builder,
  }) {
    final reference = FirebaseFirestore.instance.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot));
  }

  Future getDataSnaphot<T>({
    required String path,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    final snapshot = await reference.get();
    return snapshot;
  }

  Future<T?> getData<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);

    return reference.get().then((value) {
      final snapshots = value;
      return builder(snapshots.data(), value.id);
    });
  }
}
