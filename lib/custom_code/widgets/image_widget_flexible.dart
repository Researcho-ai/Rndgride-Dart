// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_svg/flutter_svg.dart'; // Import for SVG rendering

class ImageWidgetFlexible extends StatelessWidget {
  const ImageWidgetFlexible({
    Key? key,
    this.width,
    this.height,
    required this.imageUrl,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String imageUrl;

  bool _isSvg(String url) {
    return url.toLowerCase().endsWith('.svg');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      child: _isSvg(imageUrl)
          ? SvgPicture.network(
              imageUrl,
              fit: BoxFit.contain,
            )
          : Image.network(
              imageUrl,
              fit: BoxFit.contain,
            ),
    );
  }
}
