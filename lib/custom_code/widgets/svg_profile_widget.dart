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

class SvgProfileWidget extends StatelessWidget {
  const SvgProfileWidget({
    Key? key,
    this.size,
    this.width,
    this.height,
    required this.svgUrl,
  }) : super(key: key);

  final double? size; // Controls the diameter of the circle
  final double? width;
  final double? height;
  final String svgUrl;

  @override
  Widget build(BuildContext context) {
    // If size is provided, use it for both width and height to create a circle
    final double effectiveSize = size ?? 0.0;
    final double effectiveWidth =
        effectiveSize > 0 ? effectiveSize : (width ?? double.infinity);
    final double effectiveHeight =
        effectiveSize > 0 ? effectiveSize : (height ?? double.infinity);

    return Container(
      width: effectiveWidth,
      height: effectiveHeight,
      child: ClipOval(
        child: SvgPicture.network(
          svgUrl,
          fit: BoxFit.contain,
          width: effectiveWidth,
          height: effectiveHeight,
        ),
      ),
    );
  }
}
