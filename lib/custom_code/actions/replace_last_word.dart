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

String replaceLastWord(String originalPrompt, String replacementWord) {
  // Trim leading/trailing whitespace
  final trimmed = originalPrompt.trim();

  // If empty input, return just the replacement word
  if (trimmed.isEmpty) return replacementWord;

  // Split prompt into words
  final words = trimmed.split(RegExp(r'\s+'));

  // Replace the last word
  words[words.length - 1] = replacementWord;

  // Rejoin the words into a new string
  return words.join(' ');
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
