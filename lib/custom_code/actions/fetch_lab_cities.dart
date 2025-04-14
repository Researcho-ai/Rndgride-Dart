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

/// Fetches city names from labs that meet specified conditions:
/// - is_testing_lab = false
/// - is_lab_visible = true
/// - institute's conditions: is_testing_institute = false, is_institute_visible = true, institute_status = true
/// Returns a list of city names from qualifying labs.
Future<List<String>> fetchLabCities() async {
  List<String> cityNames = [];

  try {
    // Fetch all labs where is_testing_lab = false and is_lab_visible = true
    QuerySnapshot labQuerySnapshot = await FirebaseFirestore.instance
        .collection('labs')
        .where('is_testing_lab', isEqualTo: false)
        .where('is_lab_visible', isEqualTo: true)
        .get();

    // Iterate through each lab document
    for (QueryDocumentSnapshot labDoc in labQuerySnapshot.docs) {
      // Fetch the institute_ref document
      DocumentReference instituteRef =
          labDoc['institute_ref'] as DocumentReference;
      DocumentSnapshot instituteDoc = await instituteRef.get();
      Map<String, dynamic>? instituteData =
          instituteDoc.data() as Map<String, dynamic>?;

      // Check institute conditions
      if (instituteData != null &&
          instituteData['is_testing_institute'] == false &&
          instituteData['is_institute_visible'] == true &&
          instituteData['institute_status'] == true) {
        // Fetch the lab_city_ref document to get the city name
        DocumentReference labCityRef =
            labDoc['lab_city_ref'] as DocumentReference;
        DocumentSnapshot labCityDoc = await labCityRef.get();
        Map<String, dynamic>? labCityData =
            labCityDoc.data() as Map<String, dynamic>?;

        // Check if lab_city_ref document contains city_name field
        if (labCityData != null && labCityData.containsKey('city_name')) {
          String cityName = labCityData['city_name'] as String;
          cityNames.add(cityName);
        }
      }
    }

    // Remove duplicate city names using Set
    cityNames = cityNames.toSet().toList();
  } catch (e) {
    print('Error fetching lab cities: $e');
    // Handle any errors that occur during the query
  }

  return cityNames; // Return the list of city names from qualifying labs
}
