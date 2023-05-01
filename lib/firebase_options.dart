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
    apiKey: 'AIzaSyC1UaryjamoirqQ6OR0i6SHOld_7xUpc20',
    appId: '1:592355113428:web:584d0058c244cdd52f3e41',
    messagingSenderId: '592355113428',
    projectId: 'quizlee-692a1',
    authDomain: 'quizlee-692a1.firebaseapp.com',
    storageBucket: 'quizlee-692a1.appspot.com',
    measurementId: 'G-7RX6MMS8HM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBe0K2V4eyQ1hvM9u023PudJsnQhgtADjE',
    appId: '1:592355113428:android:a7c0e6725479160f2f3e41',
    messagingSenderId: '592355113428',
    projectId: 'quizlee-692a1',
    storageBucket: 'quizlee-692a1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAXNhCrPT0IyaGrhviQ--8hV6Ckk7Zyitc',
    appId: '1:592355113428:ios:f35478605c71606e2f3e41',
    messagingSenderId: '592355113428',
    projectId: 'quizlee-692a1',
    storageBucket: 'quizlee-692a1.appspot.com',
    iosClientId: '592355113428-ren13hc6pujpotl3h2h5u7gsjc6bgm36.apps.googleusercontent.com',
    iosBundleId: 'app.kiishidart.quizlee',
  );
}
