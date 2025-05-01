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

Future<List<bool>> checkAvailability(List<dynamic> jsonList) async {
  // Initialize availability flags
  bool fieldsAvailable = false;
  bool materialAvailable = false;
  bool testAvailable = false;
  bool methodAvailable = false;

  // Iterate through the list to check availability of each field, material, test, and method
  for (var raw in jsonList) {
    final entry = raw as Map<String, dynamic>;

    final field = entry['field'];
    final material = entry['material'];
    final test = entry['test'];
    final method = entry['method'];

    if (field != null &&
        field['field_name'] != null &&
        field['field_name'].isNotEmpty) {
      fieldsAvailable = true;
    }

    if (material != null) {
      materialAvailable = true;
    }

    if (test != null) {
      testAvailable = true;
    }

    if (method != null) {
      methodAvailable = true;
    }
  }

  // Return list in order: [field, material, test, method]
  return [
    fieldsAvailable,
    materialAvailable,
    testAvailable,
    methodAvailable,
  ];
}
