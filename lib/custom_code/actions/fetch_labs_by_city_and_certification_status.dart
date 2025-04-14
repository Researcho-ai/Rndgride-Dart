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

/// Fetches labs based on the given city reference and certification status.
///
/// If [includeTesting] is true, includes labs without additional conditions.
/// If false, filters labs based on non-testing lab conditions and institute criteria.
/// Returns a list of DocumentReference to qualifying labs, or null if no labs found or on error.
Future<List<DocumentReference>?> fetchLabsByCityAndCertificationStatus(
    bool includeTesting, DocumentReference labCityRef) async {
  List<DocumentReference> labRefs = [];

  try {
    // Query labs collection based on lab_city_ref
    QuerySnapshot labsSnapshot = await FirebaseFirestore.instance
        .collection('labs')
        .where('lab_city_ref', isEqualTo: labCityRef)
        .get();

    // Iterate through each lab document in the snapshot
    for (QueryDocumentSnapshot labDoc in labsSnapshot.docs) {
      var labData = labDoc.data() as Map<String, dynamic>;

      // Check if lab_certificate_document exists and is not null
      if (labData.containsKey('lab_certificate_document') &&
          labData['lab_certificate_document'] != null) {
        // If includeTesting is true, add all labs to the list
        if (includeTesting) {
          labRefs.add(labDoc.reference);
        } else {
          // Otherwise, apply additional conditions for non-testing labs
          if (labData['is_testing_lab'] == false &&
              labData['is_lab_visible'] == true) {
            // Fetch institute data for additional checks
            DocumentReference instituteRef =
                labData['institute_ref'] as DocumentReference;
            DocumentSnapshot instituteSnapshot = await instituteRef.get();
            var instituteData =
                instituteSnapshot.data() as Map<String, dynamic>;

            // Check institute conditions
            if (instituteData['is_testing_institute'] == false &&
                instituteData['is_institute_visible'] == true &&
                instituteData['institute_status'] == true) {
              labRefs.add(labDoc.reference);
            }
          }
        }
      }
    }
  } catch (e) {
    // Handle any errors that occur during the query
    print('Error fetching labs: $e');
    return null; // Return null on error
  }

  // Check if labRefs is empty
  if (labRefs.isEmpty) {
    return null; // Return null if no labs found
  }

  return labRefs; // Return the list of qualifying lab references
}

// Example Usage:
// DocumentReference cityRef = FirebaseFirestore.instance.collection('cities').doc('city1');
// Future<List<DocumentReference>?> labs = fetchLabsByCityAndCertificationStatus(true, cityRef);
// if (labs != null) {
//   labs.then((labRefs) {
//     if (labRefs != null && labRefs.isNotEmpty) {
//       labRefs.forEach((labRef) {
//         // Perform actions with each lab reference
//         // Example: labRef.update({'is_active': true});
//       });
//     } else {
//       // Handle case where no labs were found
//     }
//   });
// } else {
//   // Handle error case where fetchLabsByCityAndCertificationStatus returned null
// }
