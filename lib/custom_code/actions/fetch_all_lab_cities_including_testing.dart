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

/// Fetches all unique city names from the 'labs' collection in Firestore.
/// Returns a list of unique city names found in the lab documents.
Future<List<String>> fetchAllLabCitiesIncludingTesting() async {
  List<String> cityNames = [];

  try {
    // Fetch all labs from Firestore
    QuerySnapshot labQuerySnapshot =
        await FirebaseFirestore.instance.collection('labs').get();

    // Iterate through each lab document
    for (QueryDocumentSnapshot labDoc in labQuerySnapshot.docs) {
      // Get the reference to lab_city_ref document
      DocumentReference labCityRef =
          labDoc['lab_city_ref'] as DocumentReference;

      // Fetch the lab_city_ref document to get the city name
      DocumentSnapshot labCityDoc = await labCityRef.get();
      Map<String, dynamic>? labCityData =
          labCityDoc.data() as Map<String, dynamic>?;

      // Check if lab_city_ref document contains city_name field
      if (labCityData != null && labCityData.containsKey('city_name')) {
        String cityName = labCityData['city_name'] as String;
        cityNames.add(cityName); // Add city name to the list
      }
    }

    // Remove duplicate city names using Set
    cityNames = cityNames.toSet().toList();
  } catch (e) {
    print('Error fetching all lab cities: $e');
  }

  return cityNames; // Return the list of unique city names
}
