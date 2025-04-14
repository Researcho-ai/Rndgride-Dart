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

/// Extracts the original filename from a given file URL.
///
/// Returns the original filename extracted from the provided `fileurl`.
Future<String> originalgetfilename(String fileurl) async {
  // Regular expression to match and extract filename from URL
  RegExp regExp = new RegExp(r'.+(\/|%2F)(.+?)(?:\?.+|$)');

  // Perform regex matching on the input `fileurl`
  var matches = regExp.allMatches(fileurl);

  // Check if matches were found
  if (matches.isNotEmpty) {
    // Get the first match
    var match = matches.first;

    // Decode and extract the filename with extension
    var fileNameWithExtension = Uri.decodeFull(match.group(2)!);

    // Split the filename by '-' to separate the parts
    var parts = fileNameWithExtension.split('-');

    // Get the first part as the filename without extension
    var fileNameWithoutExtension = parts.first;

    // Return the filename without extension
    return fileNameWithoutExtension;
  }

  // Return the entire URL if the pattern doesn't match
  return Uri.decodeFull(fileurl);
}
