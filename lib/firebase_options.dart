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
    apiKey: 'AIzaSyD7jJnF05G6z26_lGL4Z8Vn2u3sSK8w9aw',
    appId: '1:225674586010:web:9f7b90b9196e3106e93c23',
    messagingSenderId: '225674586010',
    projectId: 'chop-now-71981',
    authDomain: 'chop-now-71981.firebaseapp.com',
    storageBucket: 'chop-now-71981.appspot.com',
    measurementId: 'G-PGBWP1NG16',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBVdaG22KFHUmEVXl2eOnmEHjbgley_XA',
    appId: '1:225674586010:android:55e389a33729105ae93c23',
    messagingSenderId: '225674586010',
    projectId: 'chop-now-71981',
    storageBucket: 'chop-now-71981.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDJ0iU2IuEUiUek4LWaiJKxkdK-f2XEtU',
    appId: '1:225674586010:ios:e2e967d857057407e93c23',
    messagingSenderId: '225674586010',
    projectId: 'chop-now-71981',
    storageBucket: 'chop-now-71981.appspot.com',
    iosClientId: '225674586010-pt91sorgkis2gqc2m0js4n70v0hm1epj.apps.googleusercontent.com',
    iosBundleId: 'io.webflow.nobsafrica.chopnow',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDDJ0iU2IuEUiUek4LWaiJKxkdK-f2XEtU',
    appId: '1:225674586010:ios:e2e967d857057407e93c23',
    messagingSenderId: '225674586010',
    projectId: 'chop-now-71981',
    storageBucket: 'chop-now-71981.appspot.com',
    iosClientId: '225674586010-pt91sorgkis2gqc2m0js4n70v0hm1epj.apps.googleusercontent.com',
    iosBundleId: 'io.webflow.nobsafrica.chopnow',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD7jJnF05G6z26_lGL4Z8Vn2u3sSK8w9aw',
    appId: '1:225674586010:web:1fac8691c36ba008e93c23',
    messagingSenderId: '225674586010',
    projectId: 'chop-now-71981',
    authDomain: 'chop-now-71981.firebaseapp.com',
    storageBucket: 'chop-now-71981.appspot.com',
    measurementId: 'G-TSQRCRNMC0',
  );

}