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

List<String> getdocName(List<String> docurl) {
  /// This function extracts and returns the document names from a list of document URLs.
  /// It uses a regular expression to find the document name in each URL and decodes it.

  // Initialize an empty list to store document names
  List<String> docNames = [];

  // Define a regular expression to capture the document name from the URL
  RegExp regExp = new RegExp(r'.+(\/|%2F)(.+)\?.+');

  // Iterate over each URL in the input list
  for (String url in docurl) {
    // Find all matches of the regular expression in the URL
    var matches = regExp.allMatches(url);
    // Get the first match
    var match = matches.elementAt(0);
    // Decode the captured group (document name) from the match
    String filename = Uri.decodeFull(match.group(2)!);
    // Add the decoded document name to the list
    docNames.add(filename);
  }

  // Return the list of document names
  return docNames;
}

String getfileNamebyUrl(String url) {
  /// This function extracts and returns the file name from a given URL.
  /// It uses a regular expression to find the file name in the URL and decodes it.

  // Define a regular expression to capture the file name from the URL
  RegExp regExp = new RegExp(r'.+(\/|%2F)(.+)\?.+');
  // This Regex won't work if you remove ?alt...token

  // Find all matches of the regular expression in the URL
  var matches = regExp.allMatches(url);
  // Get the first match
  var match = matches.elementAt(0);
  // Decode the captured group (file name) from the match
  return Uri.decodeFull(match.group(2)!);
}

String miliSecoundTosecound(int milisecounds) {
  /// This function converts milliseconds to seconds and returns the result as a string.

  // Convert milliseconds to seconds by dividing by 1000
  double seconds = milisecounds / 1000;
  // Convert the seconds to a string, rounded to the nearest whole number
  return seconds.toStringAsFixed(0);
}

String concantinationOfString(List<String>? listOfString) {
  /// This function takes a list of strings and concatenates them into a single string,
  /// where each original string is separated by a newline character.
  /// If the input list is null or empty, it returns a single hyphen ('-').

  if (listOfString == null || listOfString.isEmpty) {
    return '-';
  }
  return listOfString.reduce((value, element) => '$value\n$element');
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

String getStringBeforeComma(String input) {
  /// This function extracts and returns the substring that appears before the first comma in the input string.
  /// If there is no comma in the input string, it returns the original string.

  // Check if the input string contains a comma
  if (input.contains(',')) {
    // Split the input string at the comma and take the first part
    // The trim() function removes any leading or trailing whitespace
    return input.split(',')[0].trim();
  } else {
    // If there is no comma, return the original input string
    return input;
  }
}

List<String> getStringBeforePipe(String input) {
  // Split the string by both ',' and '|'
  List<String> output = input.split(RegExp(r'[,\|]'));

  // Trim whitespace from each element in the list
  output = output.map((s) => s.trim()).toList();

  return output;
}

String getRandomInstrumentImage() {
  // Define the array of URLs
  List<String> urls = [
    'https://firebasestorage.googleapis.com/v0/b/codots-apps.appspot.com/o/InstrumentButtonImages%2Fshape1.svg?alt=media&token=f7a1be99-7eb2-41a4-85ff-5ccf6d07324f',
    'https://firebasestorage.googleapis.com/v0/b/codots-apps.appspot.com/o/InstrumentButtonImages%2Fshape2.svg?alt=media&token=82de762d-5ebc-4d18-a350-6abe0cb04052',
    'https://firebasestorage.googleapis.com/v0/b/codots-apps.appspot.com/o/InstrumentButtonImages%2Fshape3.svg?alt=media&token=a71eb68c-9d53-4b93-a35c-f5622aa2cae5',
    'https://firebasestorage.googleapis.com/v0/b/codots-apps.appspot.com/o/InstrumentButtonImages%2Fshape4.svg?alt=media&token=ed2fdbcc-ab07-46fe-930a-4410573b7e5b',
  ];

  // Create a random number generator
  // Random random = Random();
  var r = math.Random();

  // Pick a random index from the array
  int randomIndex = r.nextInt(urls.length);

  // Return the URL at the random index
  return urls[randomIndex];
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

List<String> removeDuplicates(String jsonString) {
  // Parse JSON string into a List
  List<dynamic> jsonData;
  try {
    jsonData = jsonDecode(jsonString);
  } catch (e) {
    print('Error decoding JSON: $e');
    return [];
  }

  // Convert the List<dynamic> to List<String>
  List<String> locations = jsonData.map((item) => item.toString()).toList();

  // Use a Set to remove duplicates
  Set<String> uniqueLocations = locations.toSet();

  // Convert the Set back to a List and return
  return uniqueLocations.toList();
}

bool isUserLikedTool(
  List<String> likesCountArray,
  String userID,
) {
  return likesCountArray.contains(userID);
}

List<String> removeDuplicatesFromList(List<String> stringList) {
  // Use a Set to remove duplicates
  final Set<String> uniqueSet = Set<String>.from(stringList);

  // Convert the Set back to a List and return it
  return uniqueSet.toList();
}
