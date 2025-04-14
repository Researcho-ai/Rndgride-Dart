import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA9ltqdGYXvc3EiJLMPcDfu-tF7N8t7CTc",
            authDomain: "codots-apps.firebaseapp.com",
            projectId: "codots-apps",
            storageBucket: "codots-apps.appspot.com",
            messagingSenderId: "357335650510",
            appId: "1:357335650510:web:ee1cedfc66b60cf039409f",
            measurementId: "G-BGFX5PG253"));
  } else {
    await Firebase.initializeApp();
  }
}
