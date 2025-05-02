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

Future<dynamic> createJsonObject(
  String? fieldName,
  String? materialName,
  String? testName,
  String? methodName,
) async {
  // Construct the JSON-like map object
  final Map<String, dynamic> result = {
    "field": {
      "field_name": fieldName,
    },
    "material": {
      "material_name": materialName,
    },
    "test": {
      "test_name": testName,
    },
    "method": {
      "method_name": methodName,
    },
  };

  // Return the result
  return result;
}
