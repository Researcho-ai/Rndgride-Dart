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

/// Retrieves unique institute references from 'labs' collection in Firestore.
///
/// Returns:
/// - Future<List<DocumentReference>>: A list of unique DocumentReference objects.
Future<List<DocumentReference>> getInstitusRef() async {
  try {
    // Query Firestore to get all documents from 'labs' collection
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("labs")
        .where('is_testing_lab',
            isEqualTo: false) // Filter labs that are not testing labs
        .where('lab_profile_status',
            isEqualTo: true) // Filter labs with profile status true
        .get();

    // Use a Set to ensure uniqueness of DocumentReferences
    Set<DocumentReference> uniqueReferences = {};

    // Iterate through each document in the snapshot
    snapshot.docs.forEach((doc) {
      // Extract the data from the document
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

      // Check if the document contains 'institute_ref' field
      if (data != null && data.containsKey("institute_ref")) {
        // Retrieve the DocumentReference for 'institute_ref'
        DocumentReference? ref = data["institute_ref"] as DocumentReference?;

        // Add the reference to the Set (automatically handles uniqueness)
        if (ref != null) {
          uniqueReferences.add(ref);
        }
      }
    });

    // Convert the Set to a List and return
    return uniqueReferences.toList();
  } catch (e) {
    // Handle any errors that occur during the query
    print('Error fetching institute references: $e');
    return []; // Return an empty list on error
  }
}
