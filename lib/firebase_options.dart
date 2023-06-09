// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return android;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
      apiKey: "AIzaSyBzVCHPoYTlW4e5FaijNOTDwGkeNc0bY7U",
      authDomain: "grocery-app-dfb04.firebaseapp.com",
      databaseURL: "https://grocery-app-dfb04-default-rtdb.asia-southeast1.firebasedatabase.app",
      projectId: "grocery-app-dfb04",
      storageBucket: "grocery-app-dfb04.appspot.com",
      messagingSenderId: "183747419803",
      appId: "1:183747419803:web:d5e9bceeb2285bc0b2b03e",
      measurementId: "G-DXJDYRBQKR"
  );

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: 'AIzaSyBzVCHPoYTlW4e5FaijNOTDwGkeNc0bY7U',
      appId: '1:183747419803:android:47e6ec90d3aa8492b2b03e',
      messagingSenderId: '183747419803',
      projectId: 'grocery-app-dfb04',
      storageBucket:'gs://grocery-app-dfb04.appspot.com'
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: '',
    appId: '',
    messagingSenderId: '',
    projectId: '',
    databaseURL: '',
    storageBucket: '',
    androidClientId: '',
    iosClientId: '',
    iosBundleId: '',
  );
}
