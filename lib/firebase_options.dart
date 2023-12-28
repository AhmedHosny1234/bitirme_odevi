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
    apiKey: 'AIzaSyCHqAd9WdFrdaB4AhAXPvs3oBPM6hPK1qw',
    appId: '1:677305705351:web:32cb87267aea47935c6922',
    messagingSenderId: '677305705351',
    projectId: 'bitirme-a5066',
    authDomain: 'bitirme-a5066.firebaseapp.com',
    storageBucket: 'bitirme-a5066.appspot.com',
    measurementId: 'G-33TMLPWSE0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBi0Jfs4V9gIM5ntF9aSphjsoyWitsKDSg',
    appId: '1:677305705351:android:f4a709eeb16f23e25c6922',
    messagingSenderId: '677305705351',
    projectId: 'bitirme-a5066',
    storageBucket: 'bitirme-a5066.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTMZpXp_lDreT6CIUTML7v5-TOUMckRGc',
    appId: '1:677305705351:ios:bc0440e78e000b1b5c6922',
    messagingSenderId: '677305705351',
    projectId: 'bitirme-a5066',
    storageBucket: 'bitirme-a5066.appspot.com',
    iosBundleId: 'com.example.untitled',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTMZpXp_lDreT6CIUTML7v5-TOUMckRGc',
    appId: '1:677305705351:ios:702de2b83779c5d25c6922',
    messagingSenderId: '677305705351',
    projectId: 'bitirme-a5066',
    storageBucket: 'bitirme-a5066.appspot.com',
    iosBundleId: 'com.example.untitled.RunnerTests',
  );
}
