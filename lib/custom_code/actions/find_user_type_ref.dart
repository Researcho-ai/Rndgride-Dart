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

import 'package:cloud_firestore/cloud_firestore.dart';

/// Finds the DocumentReference for a user type based on the user type string.
///
/// Parameters:
/// - [userType]: String representing the user type to find.
///
/// Returns:
/// - Future<DocumentReference>: DocumentReference for the user type found.
Future<DocumentReference> findUserTypeRef(String userType) async {
  try {
    final firestore = FirebaseFirestore.instance;

    // Query 'user_types' collection to find the user type
    QuerySnapshot querySnapshot = await firestore
        .collection('user_types')
        .where('user_type', isEqualTo: userType)
        .get();

    // Return the reference of the first document found (assuming user_type is unique)
    return querySnapshot.docs.first.reference;
  } catch (e) {
    // Handle any errors that occur during the process
    print('Error finding user type reference: $e');
    throw e; // Re-throw the error to be handled further up the call stack if needed
  }
}
