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

/// Searches for items based on a search term.
/// Searches for items based on a search term.
Future<List<String>> search(String searchTerm) async {
  if (searchTerm.isEmpty) {
    return [];
  }

  final searchWords = searchTerm.toLowerCase().split(' ');
  List<String> resultList = [];

  try {
    if (searchWords.contains('with')) {
      final index = searchWords.indexOf('with');

      if (searchWords.last == 'with') {
        return await combinationOfInstrumentWithAsLast(searchWords[index - 1]);
      } else {
        List<String> instrumentName = searchWords.sublist(0, index);
        List<String> analysisName = searchWords.sublist(index + 1);

        final instrumentResults =
            await searchOnInstrument(instrumentName, false);
        if (instrumentResults.isNotEmpty) {
          for (String instrumentTestName in instrumentResults) {
            resultList.addAll(await retrieveInstrumentCombinationsWithSearch(
                instrumentTestName, analysisName));
          }
        }
      }
    } else {
      if (searchWords.length == 1) {
        resultList.addAll(await searchOnInstrument(searchWords, false));
        resultList.addAll(await searchOnAnalysis(searchWords, false));
      } else {
        bool isInstrumentExist = await isInstrument(searchWords[0]);

        if (isInstrumentExist) {
          List<String> tempResults =
              await searchOnInstrument([searchWords.first], false);

          List<String> instrumentNameList2 =
              await filterResults(searchWords, tempResults);

          if (instrumentNameList2.length < searchWords.length) {
            // Handle case where additional terms are found after filtering
            // List<String> afterInstrument =
            //     findDifference(searchWords, instrumentNameList2);
            List<String> instrumentNameList =
                await searchOnInstrument(instrumentNameList2, false);

            resultList
                .addAll(await searchOnInstrument(instrumentNameList, false));
          } else {
            resultList.addAll(await searchOnInstrument(searchWords, false));
          }
        }
      }
    }
    return resultList;
  } catch (e, stackTrace) {
    print('Error searching items: $e\nStack trace:\n$stackTrace');
    return [];
  }
}

List<String> findDifference(
    List<String> originalList, List<String> subsetList) {
  Set<String> originalSet = originalList.toSet();
  Set<String> subsetSet = subsetList.toSet();
  Set<String> differenceSet = originalSet.difference(subsetSet);
  return differenceSet.toList();
}

Future<List<String>> filterResults(
    List<String> results, List<String> searchList) async {
  List<String> filteredResults = [];
  for (String result in results) {
    bool matches = await isListContain(result, searchList);
    if (!matches) {
      return filteredResults;
    }
    filteredResults.add(result);
  }
  return filteredResults;
}

Future<bool> isListContain(String searchWord, List<String> itemList) async {
  final lowerCaseSearchWord = searchWord.toLowerCase();
  for (final itemName in itemList) {
    if (itemName.toLowerCase().contains(lowerCaseSearchWord)) {
      return true;
    }
  }
  return false;
}

/// Case 1: Fetch instruments with the specified instrument test name and retrieve all analysis names within the instrument properties.
Future<List<String>> combinationOfInstrumentWithAsLast(
    String instrumentTestName) async {
  List<String> resultList = [];

  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collectionGroup('instruments_tests')
        .where('is_instrument_active', isEqualTo: true)
        .where('is_sophisticated', isEqualTo: false)
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
              String insName = instrumentData['instrument_test_name'];

              if (!resultList.contains(insName)) {
                resultList.add(insName);
              }
              // List<dynamic> instrumentPropertiesData =
              //     instrumentData['instrument_properties'] ?? [];

              // for (var instrumentPropertyData in instrumentPropertiesData) {
              //   try {
              //     // InstrumentPropertiesStruct instrumentProperty =
              //     //     InstrumentPropertiesStruct.fromMap(
              //     //         instrumentPropertyData as Map<String, dynamic>);
              //     resultList.add(
              //         '${instrumentData['instrument_test_name']}');
              //   } catch (e) {
              //     print('Error converting instrument property data: $e');
              //   }
              // }
            }
          }
        }
      } catch (e) {
        print('Error processing document: $e');
      }
    }
  } catch (e) {
    print('Error fetching instruments: $e');
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
    print('Error fetching available instruments: $e');
    return false;
  }
}

/// Retrieves and adds instrument combinations with search words to the result list.
Future<List<String>> retrieveInstrumentCombinationsWithSearch(
    String instrumentTestName, List<String> searchWords) async {
  List<String> resultList = [];
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collectionGroup('instruments_tests')
      .where('instrument_test_name', isEqualTo: instrumentTestName)
      .where('is_sophisticated', isEqualTo: false)
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

          if (areAllElementsPresent(
              searchWords, instrumentProperty.analysisName)) {
            resultList.add('${instrumentData['instrument_test_name']}');
          }
        }
      }
    }
  }
  return resultList;
}

/// Searches for instruments based on the search words.
Future<List<String>> searchOnInstrument(
    List<String> searchWords, bool allWords) async {
  List<String> instrumentList = [];

  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collectionGroup('instruments_tests')
      .where('is_instrument_active', isEqualTo: true)
      .where('is_sophisticated', isEqualTo: false)
      .get();

  for (QueryDocumentSnapshot doc in querySnapshot.docs) {
    Map<String, dynamic>? instrumentData = doc.data() as Map<String, dynamic>?;
    if (instrumentData != null) {
      String instrumentTestName = instrumentData['instrument_test_name'] ?? '';

      if (areAllElementsPresent(searchWords, instrumentTestName)) {
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
        .where('is_sophisticated', isEqualTo: false)
        .get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      String instrumentTestName = doc['instrument_test_name'] ?? '';
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
                if (!analysisList.contains(instrumentTestName)) {
                  analysisList.add(instrumentTestName);
                }
              } else {
                if (!analysisList.contains(instrumentTestName)) {
                  analysisList.add(instrumentTestName);
                }
              }
            }
          } catch (e) {
            print('Error converting instrument property data: $e');
          }
        }
      }
    }
  }
  return analysisList;
}

bool areAllElementsPresent(List<String> elements, String mainString) {
  for (String element in elements) {
    if (!mainString.toLowerCase().contains(element.toLowerCase())) {
      return false;
    }
  }
  return true;
}

Future<bool> isInstrument(String instrumentTestName) async {
  // List<String> resultList = [];

  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collectionGroup('instruments_tests')
        .where('is_instrument_active', isEqualTo: true)
        .where('is_sophisticated', isEqualTo: false)
        .get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      try {
        bool isInclude = await isIncludeInstrument(doc, '+9134727657326');
        if (isInclude) {
          Map<String, dynamic>? instrumentData =
              doc.data() as Map<String, dynamic>?;

          if (instrumentData != null &&
              instrumentData['instrument_test_name'] != null) {
            String insName = instrumentData['instrument_test_name'];

            if (insName
                .toLowerCase()
                .contains(instrumentTestName.toLowerCase())) {
              return true;
            }
          }
        }
      } catch (e) {
        print('Error processing document: $e');
      }
    }
  } catch (e) {
    print('Error fetching instruments: $e');
  }

  return false;
}
