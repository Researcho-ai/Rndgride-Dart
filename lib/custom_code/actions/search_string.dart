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

/// Searches for items based on a search term and returns debug information.
Future<String> searchString(String searchTerm) async {
  if (searchTerm.isEmpty) {
    return "Search term is empty";
  }

  final searchWords = searchTerm.toLowerCase().split(' ');
  final resultList = <String>[];

  try {
    if (searchWords.contains('with')) {
      // Handle searches containing "with"
      final index = searchWords.indexOf('with');

      if (searchWords.last == 'with') {
        // Case 1: Search for the term before "with" in instrumentName
        final result =
            await combinationOfInstrumentWithAsLast(searchWords[index - 1]);
        return "Debug: Case 1 result: ${result.join(', ')}";
      } else {
        // Case 2: Handle searches with "with" in between
        final instrumentName = searchWords.sublist(0, index).join(' ');
        final analysisName = searchWords.sublist(index + 1).join(' ');

        final instrumentResults =
            await searchOnInstrument([instrumentName], false);
        if (instrumentResults.isNotEmpty) {
          for (String instrumentTestName in instrumentResults) {
            await retrieveInstrumentCombinationsWithSearch(
                instrumentTestName, resultList, [analysisName]);
          }
        }
      }
    } else {
      // Case 3: Handle single-word searches without "with"
      resultList.addAll(await searchOnInstrument(searchWords, true));
      resultList.addAll(await searchOnAnalysis(searchWords, true));
    }
    return "Debug: Final result: ${resultList.join(', ')}";
  } catch (e, stackTrace) {
    return "Error searching items: $e\nStack trace:\n$stackTrace";
  }
}

/// Case 1: Fetch instruments with the specified instrument test name and retrieve all analysis names within the instrument properties.
Future<List<String>> combinationOfInstrumentWithAsLast(
    String instrumentTestName) async {
  List<String> resultList = [];

  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collectionGroup('instruments_tests')
        .where('is_instrument_active', isEqualTo: true)
        .get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      try {
        bool isInclude = await isIncludeInstrument(doc, '+9134727657326');
        if (isInclude) {
          Map<String, dynamic>? instrumentData =
              doc.data() as Map<String, dynamic>?;

          if (instrumentData != null &&
              instrumentData['instrument_test_name'] != null) {
            if (instrumentData['instrument_test_name']
                .toString()
                .toLowerCase()
                .contains(instrumentTestName.toLowerCase())) {
              List<dynamic> instrumentPropertiesData =
                  instrumentData['instrument_properties'] ?? [];

              for (var instrumentPropertyData in instrumentPropertiesData) {
                try {
                  InstrumentPropertiesStruct instrumentProperty =
                      InstrumentPropertiesStruct.fromMap(
                          instrumentPropertyData as Map<String, dynamic>);
                  resultList.add(
                      '${instrumentData['instrument_test_name']} with ${instrumentProperty.analysisName}');
                } catch (e) {
                  return ["Error converting instrument property data: $e"];
                }
              }
            }
          }
        }
      } catch (e) {
        return ["Error processing document: $e"];
      }
    }
  } catch (e) {
    return ["Error fetching instruments: $e"];
  }

  return resultList;
}

/// Checks if an instrument should be included based on certain conditions.
Future<bool> isIncludeInstrument(
    QueryDocumentSnapshot docSnap, String phoneNumber) async {
  try {
    DocumentSnapshot parentDoc = await docSnap.reference.parent.parent!.get();
    Map<String, dynamic>? parentData =
        parentDoc.data() as Map<String, dynamic>?;

    if (parentData != null) {
      bool isProfileActive = parentData['lab_profile_status'] ?? false;
      bool isLabVisible = parentData['is_lab_visible'] ?? true;
      bool testingLab = parentData['is_testing_lab'] ?? false;

      if (testingLab && phoneNumber != '+919512022757') return false;

      DocumentReference? instituteRef =
          parentData['institute_ref'] as DocumentReference?;
      if (instituteRef != null) {
        DocumentSnapshot instituteDoc = await instituteRef.get();
        Map<String, dynamic>? instituteData =
            instituteDoc.data() as Map<String, dynamic>?;

        if (instituteData != null) {
          bool instituteStatus = instituteData['institute_status'] ?? false;
          bool isInstituteVisible =
              instituteData['is_institute_visible'] ?? true;
          bool isTestingInstitute =
              instituteData['is_testing_institute'] ?? false;

          if (isTestingInstitute && phoneNumber != '+919512022757')
            return false;

          if (isProfileActive &&
              isLabVisible &&
              instituteStatus &&
              isInstituteVisible) {
            return true;
          }
        }
      }
    }
    return false;
  } catch (e) {
    return false;
  }
}

/// Retrieves and adds instrument combinations with search words to the result list.
Future<void> retrieveInstrumentCombinationsWithSearch(String instrumentTestName,
    List<String> resultList, List<String> searchWords) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collectionGroup('instruments_tests')
      .where('instrument_test_name', isEqualTo: instrumentTestName)
      .get();

  for (QueryDocumentSnapshot doc in querySnapshot.docs) {
    bool isInclude = await isIncludeInstrument(doc, '+9134727657326');
    if (isInclude) {
      Map<String, dynamic>? instrumentData =
          doc.data() as Map<String, dynamic>?;

      if (instrumentData != null) {
        List<dynamic> instrumentPropertiesData =
            instrumentData['instrument_properties'] ?? [];

        for (var instrumentPropertyData in instrumentPropertiesData) {
          InstrumentPropertiesStruct instrumentProperty =
              InstrumentPropertiesStruct.fromMap(
                  instrumentPropertyData as Map<String, dynamic>);
          for (String searchWord in searchWords) {
            if (instrumentProperty.analysisName
                .toLowerCase()
                .contains(searchWord.toLowerCase())) {
              resultList.add(
                  '${instrumentData['instrument_test_name']} with ${instrumentProperty.analysisName}');
            }
          }
        }
      }
    }
  }
}

/// Searches for instruments based on the search words.
Future<List<String>> searchOnInstrument(
    List<String> searchWords, bool allWords) async {
  List<String> instrumentList = [];

  for (String searchWord in searchWords) {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collectionGroup('instruments_tests')
        .where('is_instrument_active', isEqualTo: true)
        .get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic>? instrumentData =
          doc.data() as Map<String, dynamic>?;
      if (instrumentData != null) {
        String instrumentName = instrumentData['instrument_name'] ?? '';
        String instrumentTestName =
            instrumentData['instrument_test_name'] ?? '';

        if (instrumentName.toLowerCase().contains(searchWord.toLowerCase()) ||
            instrumentTestName
                .toLowerCase()
                .contains(searchWord.toLowerCase())) {
          if (allWords) {
            instrumentList.add(instrumentTestName);
          } else {
            if (!instrumentList.contains(instrumentTestName)) {
              instrumentList.add(instrumentTestName);
            }
          }
        }
      }
    }
  }
  return instrumentList;
}

/// Searches for analyses based on the search words within instrument properties.
Future<List<String>> searchOnAnalysis(
    List<String> searchWords, bool allWords) async {
  List<String> analysisList = [];

  for (String searchWord in searchWords) {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collectionGroup('instruments_tests')
        .where('is_instrument_active', isEqualTo: true)
        .get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic>? instrumentData =
          doc.data() as Map<String, dynamic>?;
      if (instrumentData != null) {
        List<dynamic> instrumentPropertiesData =
            instrumentData['instrument_properties'] ?? [];

        for (var instrumentPropertyData in instrumentPropertiesData) {
          try {
            InstrumentPropertiesStruct instrumentProperty =
                InstrumentPropertiesStruct.fromMap(
                    instrumentPropertyData as Map<String, dynamic>);
            if (instrumentProperty.analysisName
                .toLowerCase()
                .contains(searchWord.toLowerCase())) {
              if (allWords) {
                analysisList.add(instrumentProperty.analysisName);
              } else {
                if (!analysisList.contains(instrumentProperty.analysisName)) {
                  analysisList.add(instrumentProperty.analysisName);
                }
              }
            }
          } catch (e) {
            return ["Error converting instrument property data: $e"];
          }
        }
      }
    }
  }
  return analysisList;
}

// End custom action code
// DO NOT REMOVE OR MODIFY THE CODE BELOW!
