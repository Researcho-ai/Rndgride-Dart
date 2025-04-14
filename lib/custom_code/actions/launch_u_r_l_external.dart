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

import 'package:url_launcher/url_launcher.dart';

Future<void> launchURLExternal(String url) async {
  // Check if the URL already has a scheme (http://, https://, etc.)
  // if (!url.startsWith('http://') && !url.startsWith('https://')) {
  // If not, add https:// to the beginning of the URL
  //   url = 'https://' + url;
  //}

  // Check if 'www' is present in the URL
  // if (!url.contains('www.')) {
  // If not, add www. to the URL
  // url = url.replaceFirst('https://', 'https://www.');
  // }

  // Launch the URL in a new tab of the browser
  await launch(url, forceSafariVC: false, forceWebView: false);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
