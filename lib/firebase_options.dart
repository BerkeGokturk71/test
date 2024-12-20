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
    apiKey: 'AIzaSyDu6-riHrVP63G6d_9c_fUrNuakoyyAnXU',
    appId: '1:92706832209:web:bca60dc1370d693c431d70',
    messagingSenderId: '92706832209',
    projectId: 'tester-9c3ed',
    authDomain: 'tester-9c3ed.firebaseapp.com',
    storageBucket: 'tester-9c3ed.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNMf67FkXfbRm6M9bomq4mhXsffLxwsEE',
    appId: '1:92706832209:android:276674b3a788ac4c431d70',
    messagingSenderId: '92706832209',
    projectId: 'tester-9c3ed',
    storageBucket: 'tester-9c3ed.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJnTEViZQOfny6MzJrdNuJFfWCGFnuXVk',
    appId: '1:92706832209:ios:16014dc23cd73b5d431d70',
    messagingSenderId: '92706832209',
    projectId: 'tester-9c3ed',
    storageBucket: 'tester-9c3ed.firebasestorage.app',
    iosClientId: '92706832209-ggkg9gp909jqfvt4tha81us895coqk26.apps.googleusercontent.com',
    iosBundleId: 'com.example.tester',
  );
}
