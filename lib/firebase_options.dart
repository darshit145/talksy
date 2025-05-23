// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAog_LvdLzk9hL2do6xb-h2eKoJAFdD9O8',
    appId: '1:484253441756:web:f6a957a6520fa9ddb31e19',
    messagingSenderId: '484253441756',
    projectId: 'talksy-d8e7f',
    authDomain: 'talksy-d8e7f.firebaseapp.com',
    storageBucket: 'talksy-d8e7f.firebasestorage.app',
    measurementId: 'G-K060RYBS0P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFaBih8-hAcZnRN1VEsNuh11PzXBNAK_A',
    appId: '1:484253441756:android:8477685c7e294d50b31e19',
    messagingSenderId: '484253441756',
    projectId: 'talksy-d8e7f',
    storageBucket: 'talksy-d8e7f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHZpxlmwJkrtkAFzPoxkDsrgNfevUJeeQ',
    appId: '1:484253441756:ios:7a1276b91c2dd128b31e19',
    messagingSenderId: '484253441756',
    projectId: 'talksy-d8e7f',
    storageBucket: 'talksy-d8e7f.firebasestorage.app',
    iosBundleId: 'com.example.talksy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCHZpxlmwJkrtkAFzPoxkDsrgNfevUJeeQ',
    appId: '1:484253441756:ios:7a1276b91c2dd128b31e19',
    messagingSenderId: '484253441756',
    projectId: 'talksy-d8e7f',
    storageBucket: 'talksy-d8e7f.firebasestorage.app',
    iosBundleId: 'com.example.talksy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAog_LvdLzk9hL2do6xb-h2eKoJAFdD9O8',
    appId: '1:484253441756:web:22298f26f1b3388ab31e19',
    messagingSenderId: '484253441756',
    projectId: 'talksy-d8e7f',
    authDomain: 'talksy-d8e7f.firebaseapp.com',
    storageBucket: 'talksy-d8e7f.firebasestorage.app',
    measurementId: 'G-R1CP2P1B5J',
  );
}
