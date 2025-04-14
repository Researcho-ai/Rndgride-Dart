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

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

Future<String> convertImageToBase64(String imagePath) async {
  ByteData bytes = await rootBundle.load(imagePath);
  Uint8List buffer = bytes.buffer.asUint8List();
  String base64Image = base64Encode(buffer);
  return base64Image;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
