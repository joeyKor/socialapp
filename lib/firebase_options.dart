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
    apiKey: 'AIzaSyACiqWm2KM_tGyjfCAtTOYNKdw8n3W1zpE',
    appId: '1:428215831742:web:4833c1712cb3a55259a2ef',
    messagingSenderId: '428215831742',
    projectId: 'self-study-7a60b',
    authDomain: 'self-study-7a60b.firebaseapp.com',
    storageBucket: 'self-study-7a60b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlTGi7qpxpZqVLSf5xJ9IQyIdqYu9TGr8',
    appId: '1:428215831742:android:00e24878e0ccb5b659a2ef',
    messagingSenderId: '428215831742',
    projectId: 'self-study-7a60b',
    storageBucket: 'self-study-7a60b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZ_ck-ugehdJwgd68sccQnKL6T2FxJdlo',
    appId: '1:428215831742:ios:87656f47a7f2386759a2ef',
    messagingSenderId: '428215831742',
    projectId: 'self-study-7a60b',
    storageBucket: 'self-study-7a60b.appspot.com',
    iosClientId: '428215831742-861i1dhffc1vue37b8renbf09qbmctl2.apps.googleusercontent.com',
    iosBundleId: 'com.sedu.socialapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZ_ck-ugehdJwgd68sccQnKL6T2FxJdlo',
    appId: '1:428215831742:ios:1178d9fa787b974559a2ef',
    messagingSenderId: '428215831742',
    projectId: 'self-study-7a60b',
    storageBucket: 'self-study-7a60b.appspot.com',
    iosClientId: '428215831742-e7oln61f97vj73ij4s5n7765q8etbmcp.apps.googleusercontent.com',
    iosBundleId: 'com.sedu.socialapp.RunnerTests',
  );
}
