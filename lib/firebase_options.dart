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
    apiKey: 'AIzaSyBh12lFiLuGTTde-SCYQ5AgF46xyE6X7w0',
    appId: '1:567769383837:web:ee8f1635a52b4c725ce574',
    messagingSenderId: '567769383837',
    projectId: 'moapp-project-267c2',
    authDomain: 'moapp-project-267c2.firebaseapp.com',
    storageBucket: 'moapp-project-267c2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1amhiXhxy51w6TMe24lGa1nEA3OZhsSA',
    appId: '1:567769383837:android:a281aba9f256eb1a5ce574',
    messagingSenderId: '567769383837',
    projectId: 'moapp-project-267c2',
    storageBucket: 'moapp-project-267c2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwrd1OyQPpz0saIW08_CxA4ZTa-gMHtGM',
    appId: '1:567769383837:ios:43c9f3f066b8defb5ce574',
    messagingSenderId: '567769383837',
    projectId: 'moapp-project-267c2',
    storageBucket: 'moapp-project-267c2.appspot.com',
    iosClientId: '567769383837-n7kk7fdlric565du89kmdfj6aa5j6me6.apps.googleusercontent.com',
    iosBundleId: 'com.example.moappProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwrd1OyQPpz0saIW08_CxA4ZTa-gMHtGM',
    appId: '1:567769383837:ios:5addbb0655daa94a5ce574',
    messagingSenderId: '567769383837',
    projectId: 'moapp-project-267c2',
    storageBucket: 'moapp-project-267c2.appspot.com',
    iosClientId: '567769383837-60vo4fmqlc06bn58f7dkoja1d8evp4at.apps.googleusercontent.com',
    iosBundleId: 'com.example.moappProject.RunnerTests',
  );
}
