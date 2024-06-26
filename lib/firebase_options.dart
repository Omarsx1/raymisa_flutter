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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDTViT-9dQbHlLmH6y-DpepaGke52kfwXs',
    appId: '1:995459662678:web:7b741e0960a0da713fccf7',
    messagingSenderId: '995459662678',
    projectId: 'raymisa-52493',
    authDomain: 'raymisa-52493.firebaseapp.com',
    storageBucket: 'raymisa-52493.appspot.com',
    measurementId: 'G-BX02L1Z5X2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzfkJv_u3cXC246_V6JJJiRzQinLnbEqM',
    appId: '1:995459662678:android:e9e82f50361260423fccf7',
    messagingSenderId: '995459662678',
    projectId: 'raymisa-52493',
    storageBucket: 'raymisa-52493.appspot.com',
  );
}
