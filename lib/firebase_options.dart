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
    apiKey: 'AIzaSyA9uJ2DrNfWIpMGRMYQszitqYB5hjVoLnc',
    appId: '1:546699654366:web:d3e4aacd2209595a8d3e4f',
    messagingSenderId: '546699654366',
    projectId: 'first-app-fa72c',
    authDomain: 'first-app-fa72c.firebaseapp.com',
    storageBucket: 'first-app-fa72c.appspot.com',
    measurementId: 'G-43XHQN1G64',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPI-AxHDB4xnHQYyXo4PDlaG4-HQCoaqU',
    appId: '1:546699654366:android:3d53d71bda34be758d3e4f',
    messagingSenderId: '546699654366',
    projectId: 'first-app-fa72c',
    storageBucket: 'first-app-fa72c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOXMBnjP48owbyoZDnSQ_IYK3hjBajW_g',
    appId: '1:546699654366:ios:41b533747d374d578d3e4f',
    messagingSenderId: '546699654366',
    projectId: 'first-app-fa72c',
    storageBucket: 'first-app-fa72c.appspot.com',
    iosBundleId: 'com.example.firstApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCOXMBnjP48owbyoZDnSQ_IYK3hjBajW_g',
    appId: '1:546699654366:ios:2349a7f1a48d93928d3e4f',
    messagingSenderId: '546699654366',
    projectId: 'first-app-fa72c',
    storageBucket: 'first-app-fa72c.appspot.com',
    iosBundleId: 'com.example.firstApp.RunnerTests',
  );
}