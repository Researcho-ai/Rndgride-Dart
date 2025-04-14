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

Future<List<SearchHistoryStruct>> sortSearchHistoryByTime(
    List<SearchHistoryStruct> items) async {
  try {
    // Filter out objects with an empty search_term
    items = items.where((item) => item.searchTerm.isNotEmpty).toList();

    // Sort the list by the 'time' field in descending order
    items.sort((a, b) {
      // Handle cases where time might be null
      if (a.time == null && b.time == null) {
        return 0; // Both are null, consider them equal
      } else if (a.time == null) {
        return 1; // null values are considered smaller
      } else if (b.time == null) {
        return -1;
      } else {
        return b.time!.compareTo(a.time!); // Compare non-null values
      }
    });
  } catch (e) {
    print('Error sorting search history by time: $e');
  }

  return items;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
