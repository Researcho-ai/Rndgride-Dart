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
// import 'package:cloud_firestore/cloud_firestore.dart';

/// Fetches and filters a list of instrument properties based on specific criteria.
///
/// Parameters:
/// - [instrumentTestRef]: DocumentReference for instrument tests.
/// - [analysisName]: String indicating analysis name for filtering.
/// - [solventMethodName]: String indicating solvent method name for filtering.
///
/// Returns:
/// - Future<List<InstrumentPropertiesStruct>>: List of filtered InstrumentPropertiesStruct.
Future<List<InstrumentPropertiesStruct>> availableTestAnalysisReferencesList(
  DocumentReference? instrumentTestRef,
) async {
  try {
    List<InstrumentPropertiesStruct> matchingDocuments = [];

    // Ensure all required parameters are provided

    // Fetch the instrument test document
    DocumentSnapshot documentSnapshot = await instrumentTestRef!.get();
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

        String analysisName = instrumentProperty.analysisName;
        List<String> analysisNameList = analysisName.split(',');

        for (String a in analysisNameList) {
          InstrumentPropertiesStruct newInstrumentProperty =
              InstrumentPropertiesStruct(
            academicPrice: instrumentProperty.academicPrice,
            internalPrice: instrumentProperty.internalPrice,
            industrialPrice: instrumentProperty.industrialPrice,
            application: instrumentProperty.application,
            otherDetails: instrumentProperty.otherDetails,
            analysisName: a.trim(), // Trim whitespace if any
            solventMethodName: instrumentProperty.solventMethodName,
            sampleQuantity: instrumentProperty.sampleQuantity,
            instrumentRef: instrumentProperty.instrumentRef,
          );

          matchingDocuments.add(newInstrumentProperty);
        }
      } catch (e) {
        print('Error converting instrument data: $e');
      }
    }

    // Return the list of filtered instrument properties
    return matchingDocuments;
  } catch (e) {
    // Log the error
    print('Error fetching available instruments: $e');
    return []; // Return an empty list on error
  }
}
