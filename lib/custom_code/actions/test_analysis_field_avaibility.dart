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

/// Checks the availability of various fields related to test analysis in a
/// Firestore collection.
///
/// Parameters:
/// - [availableInstrumentsMaterialsRef]: Reference to the document in the
///   'available_instruments_materials' collection.
///
/// Returns:
/// - A [Future<TestAnalysisFieldAvaibilityStruct>] containing flags indicating
///   the presence or absence of various fields related to test analysis.
import 'package:cloud_firestore/cloud_firestore.dart';

/// Checks the availability of various fields related to test analysis in a
/// Firestore collection.
///
/// Parameters:
/// - [instrumentTestRef]: Reference to the document in Firestore.
///
/// Returns:
/// - A [Future<TestAnalysisFieldAvaibilityStruct>] containing flags indicating
///   the presence or absence of various fields related to test analysis.
Future<TestAnalysisFieldAvaibilityStruct> testAnalysisFieldAvaibility(
    DocumentReference instrumentTestRef) async {
  // Initialize the availability structure with default values
  TestAnalysisFieldAvaibilityStruct availability =
      TestAnalysisFieldAvaibilityStruct(
    analysisPresent: false,
    solventPresent: false,
    testPresent: false,
    testMethodPresent: false,
    otherDetailPresent: false,
    subMaterialPresent: false,
    testRangePresent: false,
    sampleQuantityPresent: false,
  );

  try {
    // Fetch the instrument test document
    DocumentSnapshot documentSnapshot = await instrumentTestRef.get();
    if (!documentSnapshot.exists) {
      throw StateError('Document does not exist');
    }

    // Retrieve instrument_properties field from the document
    List<dynamic> instrumentPropertiesData =
        documentSnapshot['instrument_properties'] ?? [];

    // Convert the instrument properties data to InstrumentPropertiesStruct
    for (var instrumentData in instrumentPropertiesData) {
      try {
        InstrumentPropertiesStruct instrumentProperty =
            InstrumentPropertiesStruct.fromMap(
                instrumentData as Map<String, dynamic>);

        // Check if analysisName is present and not empty
        if (instrumentProperty.analysisName.isNotEmpty) {
          availability.analysisPresent = true;
        }

        // Check if solventMethodName is present and not empty
        if (instrumentProperty.solventMethodName.isNotEmpty) {
          availability.solventPresent = true;
        }

        // Check if otherDetails is present and not empty
        if (instrumentProperty.otherDetails.isNotEmpty) {
          availability.otherDetailPresent = true;
        }
      } catch (e) {
        print('Error converting instrument data: $e');
      }
    }

    // Return the completed availability structure
    return availability;
  } catch (error) {
    // Handle any errors that occur during the process
    print("Error: $error");
    return availability; // Return the availability structure with default values
  }
}
