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

// Function to encode an image file to a base64 string with data URI prefix
Future<String> encodeImageToBase64(FFUploadedFile image) async {
  try {
    // Retrieve the file bytes from the image object
    List<int>? fileBytes = image.bytes;

    // Check if fileBytes is not null
    if (fileBytes == null) {
      throw Exception('Image bytes are null.');
    }

    // Define the MIME type for the image
    // Update this as needed based on the actual image type
    String mimeType = 'image/png'; // Hardcoded MIME type

    // Encode the bytes as a base64 string
    String base64String = base64Encode(fileBytes);

    // Return the base64 string with the data URI prefix
    return 'data:$mimeType;base64,$base64String';
  } catch (e) {
    // Handle any errors that occur during the encoding process
    print('Error encoding image to base64: $e');
    throw Exception('Failed to encode image to base64');
  }
}
