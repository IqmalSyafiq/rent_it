import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<FirebaseOptions> loadFirebaseOptions(String envFile) async {
  await dotenv.load(fileName: envFile);

  return FirebaseOptions(
    apiKey: dotenv.env['API_KEY']!,
    appId: dotenv.env['APP_ID']!,
    messagingSenderId: dotenv.env['MESSAGING_SENDER_ID']!,
    projectId: dotenv.env['PROJECT_ID']!,
    authDomain: dotenv.env['AUTH_DOMAIN'],
    storageBucket: dotenv.env['STORAGE_BUCKET'],
    iosBundleId: dotenv.env['IOS_BUNDLE'],
  );
}

Future<FirebaseOptions?> getFirebaseOptions() async {
  if (kIsWeb) {
    return loadFirebaseOptions("environments/.env.web");
  } else {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return loadFirebaseOptions("environments/.env.android");
      case TargetPlatform.iOS:
        return loadFirebaseOptions("environments/.env.ios");
      case TargetPlatform.macOS:
        return loadFirebaseOptions("environments/.env.macos");
      case TargetPlatform.windows:
        throw UnsupportedError('FirebaseOptions have not been configured for windows');
      case TargetPlatform.linux:
        throw UnsupportedError('FirebaseOptions have not been configured for linux');
      default:
        throw UnsupportedError('FirebaseOptions are not supported for this platform.');
    }
  }
}
