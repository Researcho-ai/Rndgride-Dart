import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDU1HeytakkMRJE51zjM_U3ImzeF7wi-Yk",
            authDomain: "texttrans-e7b12.firebaseapp.com",
            projectId: "texttrans-e7b12",
            storageBucket: "texttrans-e7b12.firebasestorage.app",
            messagingSenderId: "100175665781",
            appId: "1:100175665781:web:6a723babc454459270363c",
            measurementId: "G-LSY7MGW7MR"));
  } else {
    await Firebase.initializeApp();
  }
}
