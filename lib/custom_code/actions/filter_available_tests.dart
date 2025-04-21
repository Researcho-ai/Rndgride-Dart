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

Future<List<dynamic>> filterAvailableTests(
  String? selectedField,
  String? selectedMaterial,
  String? selectedTest,
  String? selectedMethod,
  List<dynamic> jsonList,
) async {
  // Normalize & trim inputs; empty = “no filter”
  final filterField = selectedField?.trim().toLowerCase() ?? '';
  final filterMaterial = selectedMaterial?.trim().toLowerCase() ?? '';
  final filterTest = selectedTest?.trim().toLowerCase() ?? '';
  final filterMethod = selectedMethod?.trim().toLowerCase() ?? '';

  return jsonList.where((raw) {
    final entry = raw as Map<String, dynamic>;

    final fieldName =
        (entry['field']?['field_name'] as String? ?? '').toLowerCase();
    final materialName =
        (entry['material']?['material_name'] as String? ?? '').toLowerCase();
    final testName =
        (entry['test']?['test_name'] as String? ?? '').toLowerCase();
    final methodName =
        (entry['method']?['method_name'] as String? ?? '').toLowerCase();

    // Start assuming it matches…
    bool matches = true;

    // …but if a filter is set, require it to match
    if (filterField.isNotEmpty && filterField != fieldName) matches = false;
    if (filterMaterial.isNotEmpty && filterMaterial != materialName)
      matches = false;
    if (filterTest.isNotEmpty && filterTest != testName) matches = false;
    if (filterMethod.isNotEmpty && filterMethod != methodName) matches = false;

    return matches;
  }).toList();
}
