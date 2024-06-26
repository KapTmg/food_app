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
    apiKey: 'AIzaSyCGc6RySrhaQYkoatEE-kkXkmJgRimkhuU',
    appId: '1:642863148250:web:7a95f72d0f3d106ebd49e3',
    messagingSenderId: '642863148250',
    projectId: 'minimal-food-app',
    authDomain: 'minimal-food-app.firebaseapp.com',
    storageBucket: 'minimal-food-app.appspot.com',
    measurementId: 'G-0DG9WJYQWB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdNU-H-JvU9jA-7PZMr214iOljQPHCbzk',
    appId: '1:642863148250:android:0d01f8b38eb67870bd49e3',
    messagingSenderId: '642863148250',
    projectId: 'minimal-food-app',
    storageBucket: 'minimal-food-app.appspot.com',
  );
}
