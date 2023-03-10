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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6-DDYpW0ChHrjSOajeDnWZKZxOZZ23Bc',
    appId: '1:657995348763:android:44fe99bd4addf51b0831be',
    messagingSenderId: '657995348763',
    projectId: 'reddit-d176f',
    storageBucket: 'reddit-d176f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0K9j_cbGEKRCqg2Q6KvtLg9LQvJ7JZsI',
    appId: '1:657995348763:ios:7d25699984fd92e00831be',
    messagingSenderId: '657995348763',
    projectId: 'reddit-d176f',
    storageBucket: 'reddit-d176f.appspot.com',
    androidClientId: '657995348763-cplpt503orfpsd2hi17l1meput4m8eii.apps.googleusercontent.com',
    iosClientId: '657995348763-27blsbv09r4htfppa67ptej39vpblf4i.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatOpenaiGetx',
  );
}
