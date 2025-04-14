// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future<String> sendOtp(String phoneNumber) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseAuthPlatform platformAuth = FirebaseAuthPlatform.instance;

  try {
    final RecaptchaVerifier recaptchaVerifier = RecaptchaVerifier(
        container: '#recaptcha-container', // For web, or null for mobile
        size: RecaptchaVerifierSize.compact,
        theme: RecaptchaVerifierTheme.dark,
        auth: platformAuth);

    final ConfirmationResult confirmationResult =
        await _auth.signInWithPhoneNumber(
      phoneNumber,
      recaptchaVerifier,
    );

    // Save or handle the confirmationResult for later verification
    String verificationId = confirmationResult.verificationId;
    return verificationId;
  } catch (e) {
    print('Error during signInWithPhoneNumber: $e');
    return '$e';
  }
}
