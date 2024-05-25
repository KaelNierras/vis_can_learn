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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBSr7nvODE0SNhu418MpWhWKi0ej50fSsU',
    appId: '1:310619288944:web:05e8fea9434a71fd430bb5',
    messagingSenderId: '310619288944',
    projectId: 'viscanlearn',
    authDomain: 'viscanlearn.firebaseapp.com',
    storageBucket: 'viscanlearn.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-3-jOIzZB11fUe046BOl4K39CXw9pNGM',
    appId: '1:310619288944:android:8be30a1dd0d96e99430bb5',
    messagingSenderId: '310619288944',
    projectId: 'viscanlearn',
    storageBucket: 'viscanlearn.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMIhO2RwzHjYc0FFAl3bN6NzlUE5mSKmE',
    appId: '1:310619288944:ios:416480ef4241d1a1430bb5',
    messagingSenderId: '310619288944',
    projectId: 'viscanlearn',
    storageBucket: 'viscanlearn.appspot.com',
    iosClientId: '310619288944-9r2vsv89m8mlihpba17b244gj0tl91hg.apps.googleusercontent.com',
    iosBundleId: 'com.example.visCanLearn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBMIhO2RwzHjYc0FFAl3bN6NzlUE5mSKmE',
    appId: '1:310619288944:ios:416480ef4241d1a1430bb5',
    messagingSenderId: '310619288944',
    projectId: 'viscanlearn',
    storageBucket: 'viscanlearn.appspot.com',
    iosClientId: '310619288944-9r2vsv89m8mlihpba17b244gj0tl91hg.apps.googleusercontent.com',
    iosBundleId: 'com.example.visCanLearn',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBSr7nvODE0SNhu418MpWhWKi0ej50fSsU',
    appId: '1:310619288944:web:ef4aee0d6880f1ec430bb5',
    messagingSenderId: '310619288944',
    projectId: 'viscanlearn',
    authDomain: 'viscanlearn.firebaseapp.com',
    storageBucket: 'viscanlearn.appspot.com',
  );

}