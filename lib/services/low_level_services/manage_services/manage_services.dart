// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rent_it/models/house/house.dart';
import 'package:rent_it/models/tenancy_document/tenancy_document.dart';
import 'package:rent_it/services/top_level_services/firebase/firestore_database_services.dart';
import 'package:rent_it/services/top_level_services/firebase/firestore_services.dart';
import 'package:rent_it/shared/app_snackbar.dart';

Future<void> addHouse(List<TextEditingController> houseControllers) async {
  final house = House(
    id: getRandString(22),
    ownerId: FirebaseAuth.instance.currentUser?.uid ?? '',
    addressLineOne: houseControllers[0].text,
    addressLineTwo: houseControllers[1].text,
    postCode: int.parse(houseControllers[2].text),
    city: houseControllers[3].text,
    state: houseControllers[4].text,
    numRooms: int.parse(houseControllers[5].text),
    bathrooms: int.parse(houseControllers[6].text),
    monthlyRent: double.parse(houseControllers[7].text),
    description: houseControllers[8].text,
  );

  try {
    await setHouse(house);
  } catch (error) {
    Logger().e(error);
  }
}

Future<bool> addTenancyDocument(String tenancyId, String documentType, String documentName, String documentUrl) async {
  final doc = TenancyDocument(
    id: getRandString(22),
    tenancyId: tenancyId,
    documentType: documentType,
    documentName: documentName,
    uploadDate: DateTime.now().millisecondsSinceEpoch,
    documentUrl: documentUrl,
  );

  try {
    await setTenancyDocument(doc);
    return true;
  } catch (e) {
    Logger().e(e);
    return false;
  }
}

Future<void> removeTenant(House house, String tenantId, String tenancyId) async {
  final tenants = List<String>.from(house.tenantsId ?? []);
  tenants.remove(tenantId);
  final value = {
    'tenants_id': tenants,
  };

  try {
    await updateHouse(house.id, value);
    await deleteTenancy(tenancyId);
  } catch (error) {
    Logger().e(error);
  }
}

Future<void> downloadDocument(BuildContext context, String url, String documentName) async {
  try {
    // Get the downloads directory.
    final directory = await getDownloadsDirectory();

    // Build the path for the file.
    final filePath = '${directory?.path}/$documentName.pdf';

    // Create a Dio instance and download the file.
    final dio = Dio();
    await dio.download(url, filePath);

    final snackbar = appSnackBar(context, message: 'File saved to device.');
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  } catch (e) {
    Logger().e('Download error: $e');
  }
}

Future<void> deleteDocument(BuildContext context, String id) async {
  try {
    await deleteTenancyDocument(id).then((value) {
      final snackbar = appSnackBar(context, message: 'Document deleted successfully', error: true);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    });
  } catch (e) {
    Logger().e(e);
  }
}
