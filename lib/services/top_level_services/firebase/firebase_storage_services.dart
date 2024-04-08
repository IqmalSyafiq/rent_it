import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';

Future<String?> uploadFile(File file, String targetPath) async {
  try {
    Reference storageReference = FirebaseStorage.instance.ref(targetPath);

    UploadTask uploadTask = storageReference.putFile(file);

    final TaskSnapshot downloadUrl = (await uploadTask);
    final String url = await downloadUrl.ref.getDownloadURL();

    return url;
  } catch (e) {
    // If any error occurs, return null
    Logger().e(e);
    return null;
  }
}
