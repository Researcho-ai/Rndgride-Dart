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

/// Retrieves the count of unseen notifications for a given user reference.
///
/// Returns the count of notifications where 'creater_ref' matches `userRef`
/// and 'Seen_unseen' is true.
Future<int> notificationCounte(DocumentReference userRef) async {
  // Initialize Firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // Initialize count variable to store the notification count
    int count = 0;

    // Construct the Firestore query to fetch notifications
    QuerySnapshot querySnapshot = await firestore
        .collection('notification')
        .where('creater_ref', isEqualTo: userRef)
        .where('Seen_unseen', isEqualTo: true)
        .get();

    // Get the number of documents returned by the query
    count = querySnapshot.docs.length;

    // Return the count of notifications
    return count;
  } catch (e) {
    // Print and log any errors that occur during the process
    print('Error fetching notification count: $e');
    return 0; // Return 0 in case of errors
  }
}
