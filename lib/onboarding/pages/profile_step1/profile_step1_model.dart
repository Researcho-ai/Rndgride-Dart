import '/flutter_flow/flutter_flow_util.dart';
import '/profile/components/profile_details_1/profile_details1_widget.dart';
import '/index.dart';
import 'profile_step1_widget.dart' show ProfileStep1Widget;
import 'package:flutter/material.dart';

class ProfileStep1Model extends FlutterFlowModel<ProfileStep1Widget> {
  ///  Local state fields for this page.

  String type = '';

  String studentDocId =
      'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg';

  bool activeSearch = false;

  ///  State fields for stateful widgets in this page.

  // Model for ProfileDetails-1 component.
  late ProfileDetails1Model profileDetails1Model;

  @override
  void initState(BuildContext context) {
    profileDetails1Model = createModel(context, () => ProfileDetails1Model());
  }

  @override
  void dispose() {
    profileDetails1Model.dispose();
  }
}
