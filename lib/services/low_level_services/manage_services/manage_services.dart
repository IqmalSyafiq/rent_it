import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:rent_it/models/house/house.dart';
import 'package:rent_it/services/top_level_services/firebase/firestore_database_services.dart';
import 'package:rent_it/services/top_level_services/firebase/firestore_services.dart';

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
