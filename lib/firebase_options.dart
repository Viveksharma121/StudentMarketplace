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
    apiKey: 'AIzaSyDGCHRgRRhcRuFD2zJExezrm8RVcuEVRu4',
    appId: '1:42092857898:web:f4354cdaeac52b2ff7d153',
    messagingSenderId: '42092857898',
    projectId: 'student-marketplace-66768',
    authDomain: 'student-marketplace-66768.firebaseapp.com',
    storageBucket: 'student-marketplace-66768.appspot.com',
    measurementId: 'G-FKP87HXF8W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcTq50HP2caynxkY1tDATVP_dcE-JKF0g',
    appId: '1:42092857898:android:81ed9352fc4fa75bf7d153',
    messagingSenderId: '42092857898',
    projectId: 'student-marketplace-66768',
    storageBucket: 'student-marketplace-66768.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAP7n5y-mtuXIHWQVVcHv_W1P4k7LvK2v8',
    appId: '1:42092857898:ios:7b7bfcdfdd008da5f7d153',
    messagingSenderId: '42092857898',
    projectId: 'student-marketplace-66768',
    storageBucket: 'student-marketplace-66768.appspot.com',
    iosClientId: '42092857898-teanruteq6mj1ek88hmnlm418o282tdh.apps.googleusercontent.com',
    iosBundleId: 'com.example.classico',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAP7n5y-mtuXIHWQVVcHv_W1P4k7LvK2v8',
    appId: '1:42092857898:ios:74c485daafdc2e53f7d153',
    messagingSenderId: '42092857898',
    projectId: 'student-marketplace-66768',
    storageBucket: 'student-marketplace-66768.appspot.com',
    iosClientId: '42092857898-ude7uoo8hg75vbblgi689e6a5u6q2bqv.apps.googleusercontent.com',
    iosBundleId: 'com.example.classico.RunnerTests',
  );
}
