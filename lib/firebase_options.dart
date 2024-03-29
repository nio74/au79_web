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
        return macos;
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
    apiKey: 'AIzaSyC4rNUMf6aXDzwgwaW_S3Nh93z_tYdn1wI',
    appId: '1:122206798164:web:913b7627a3c3064f7288c1',
    messagingSenderId: '122206798164',
    projectId: 'au79web',
    authDomain: 'au79web.firebaseapp.com',
    storageBucket: 'au79web.appspot.com',
    measurementId: 'G-SM21S8496E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCh3AFkQhhAcBUyZ6MA8Sht8aRYoAmFhz4',
    appId: '1:122206798164:android:05548c455a083c947288c1',
    messagingSenderId: '122206798164',
    projectId: 'au79web',
    storageBucket: 'au79web.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHhEwzGzLbYLmDIiQQHAJcnnx2Uqm4qaA',
    appId: '1:122206798164:ios:3a901ee0c32717d87288c1',
    messagingSenderId: '122206798164',
    projectId: 'au79web',
    storageBucket: 'au79web.appspot.com',
    iosClientId: '122206798164-2ptqrsh98jb17pti7dm3l0or9c9nl3qh.apps.googleusercontent.com',
    iosBundleId: 'com.example.au79Web',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAHhEwzGzLbYLmDIiQQHAJcnnx2Uqm4qaA',
    appId: '1:122206798164:ios:3a901ee0c32717d87288c1',
    messagingSenderId: '122206798164',
    projectId: 'au79web',
    storageBucket: 'au79web.appspot.com',
    iosClientId: '122206798164-2ptqrsh98jb17pti7dm3l0or9c9nl3qh.apps.googleusercontent.com',
    iosBundleId: 'com.example.au79Web',
  );
}
