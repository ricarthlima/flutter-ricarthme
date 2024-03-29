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
    apiKey: 'AIzaSyBh_LkERUx4VXkdTowCjkyMG6_QUaLzdDM',
    appId: '1:87849177170:web:b4a5b6ccc2701f25aa8f8b',
    messagingSenderId: '87849177170',
    projectId: 'flutter-ricarthme',
    authDomain: 'flutter-ricarthme.firebaseapp.com',
    storageBucket: 'flutter-ricarthme.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQsvLCzO_C_CZwMTjcrBbx10_V0ep-g70',
    appId: '1:87849177170:android:a0cb4288221ebf9caa8f8b',
    messagingSenderId: '87849177170',
    projectId: 'flutter-ricarthme',
    storageBucket: 'flutter-ricarthme.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCbILXrM3OsQ5tO_Tieb1jmKs9D12js7I',
    appId: '1:87849177170:ios:54a9985192b9c971aa8f8b',
    messagingSenderId: '87849177170',
    projectId: 'flutter-ricarthme',
    storageBucket: 'flutter-ricarthme.appspot.com',
    iosClientId: '87849177170-luplb28j9lrasnpb3vlmmcuj7mvlsb53.apps.googleusercontent.com',
    iosBundleId: 'com.example.ricarthFlutter',
  );
}
