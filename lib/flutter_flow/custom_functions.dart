import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

String miliSecoundTosecound(int milisecounds) {
  /// This function converts milliseconds to seconds and returns the result as a string.

  // Convert milliseconds to seconds by dividing by 1000
  double seconds = milisecounds / 1000;
  // Convert the seconds to a string, rounded to the nearest whole number
  return seconds.toStringAsFixed(0);
}

String formatPhoneNumber(String phoneNumber) {
  /// This function formats an Indian phone number by inserting spaces for better readability.
  /// It expects the phone number to start with the country code '+91' and ensures proper formatting.
  ///

  // Check if the phone number starts with +91 and has at least 10 digits after +91
  if (phoneNumber.startsWith('+91') && phoneNumber.length > 3) {
    // Extract the parts of the phone number
    String countryCode = phoneNumber.substring(0, 3); // +91
    String remainingNumber = phoneNumber.substring(3); // 1234567890

    // Ensure the remaining number is at least 7 characters long
    if (remainingNumber.length >= 7) {
      String firstPart = remainingNumber.substring(0, 5); // 12345
      String secondPart = remainingNumber.substring(5); // 67890

      // Concatenate the parts with spaces
      return '$countryCode $firstPart $secondPart';
    }
  }
  // If the phone number does not match the expected format, return it unchanged
  return phoneNumber;
}

bool isEven(int number) {
  return number % 2 == 0;
}

int extractIntBeforeSlash(String input) {
  try {
    int slashIndex = input.indexOf('/');
    String relevantPart;

    // Determine which part of the string to process
    if (slashIndex != -1) {
      // Process only the part before the slash
      relevantPart = input.substring(0, slashIndex);
    } else {
      // Process the entire string
      relevantPart = input;
    }

    // Remove all non-numeric characters except digits
    String numericString = relevantPart.replaceAll(RegExp(r'[^0-9]'), '');

    // Parse the clean numeric string to an integer
    return int.parse(numericString);
  } catch (e) {
    // Handle any parsing errors
    print("Error parsing integer from string: $e");
  }
  // Return 0 or any other default value if parsing fails
  return 0;
}
