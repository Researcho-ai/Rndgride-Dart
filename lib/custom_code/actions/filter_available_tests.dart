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

// filterAvailableTests.dart

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

  // Step 1: initial filtering based on provided criteria
  final initial = jsonList.where((raw) {
    final entry = raw as Map<String, dynamic>;

    final fieldName =
        (entry['field']?['field_name'] as String? ?? '').toLowerCase();
    final materialName =
        (entry['material']?['material_name'] as String? ?? '').toLowerCase();
    final testName =
        (entry['test']?['test_name'] as String? ?? '').toLowerCase();
    final methodName =
        (entry['method']?['method_name'] as String? ?? '').toLowerCase();

    if (filterField.isNotEmpty && filterField != fieldName) return false;
    if (filterMaterial.isNotEmpty && filterMaterial != materialName)
      return false;
    if (filterTest.isNotEmpty && filterTest != testName) return false;
    if (filterMethod.isNotEmpty && filterMethod != methodName) return false;
    return true;
  }).toList();

  // Step 2: drop any entry where both test and method are null
  final pruned = initial.where((raw) {
    final entry = raw as Map<String, dynamic>;
    return entry['test'] != null || entry['method'] != null;
  }).toList();

  // If everything was pruned (all entries had test & method null), returns []
  return pruned;
}
