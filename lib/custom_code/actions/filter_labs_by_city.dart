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

/// Filters labs by city and optional testing lab inclusion.
///
/// Parameters:
/// - [cityRef]: DocumentReference to the city for filtering labs.
/// - [includeTesting]: Boolean flag indicating whether to include testing labs.
///
/// Returns:
/// - Future<List<DocumentReference>>: A list of filtered DocumentReferences to labs.
Future<List<DocumentReference>> filterLabsByCity(
    DocumentReference cityRef, bool includeTesting) async {
  List<DocumentReference> labRefs = [];

  try {
    // Query all labs where 'lab_city_ref' matches the provided cityRef
    QuerySnapshot labsSnapshot = await FirebaseFirestore.instance
        .collection('labs')
        .where('lab_city_ref', isEqualTo: cityRef)
        .get();

    // Iterate through each document in the labsSnapshot
    for (QueryDocumentSnapshot labDoc in labsSnapshot.docs) {
      var labData = labDoc.data() as Map<String, dynamic>;

      // If includeTesting is true, add all labs to labRefs
      if (includeTesting) {
        labRefs.add(labDoc.reference);
      } else {
        // Otherwise, apply additional conditions for non-testing labs
        if (labData['is_testing_lab'] == false &&
            labData['is_lab_visible'] == true) {
          // Fetch the 'institute_ref' from labData
          DocumentReference instituteRef =
              labData['institute_ref'] as DocumentReference;
          // Get the institute document snapshot
          DocumentSnapshot instituteSnapshot = await instituteRef.get();
          var instituteData = instituteSnapshot.data() as Map<String, dynamic>;

          // Check additional conditions for the institute
          if (instituteData['is_testing_institute'] == false &&
              instituteData['is_institute_visible'] == true &&
              instituteData['institute_status'] == true) {
            // If all conditions are met, add lab reference to labRefs
            labRefs.add(labDoc.reference);
          }
        }
      }
    }
  } catch (e) {
    // Handle any errors that occur during the query
    print('Error fetching labs by city: $e');
  }

  // Return the list of filtered lab references
  return labRefs;
}
