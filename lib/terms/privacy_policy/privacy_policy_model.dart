import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bars/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/nav_bars/top_nav_bar/top_nav_bar_widget.dart';
import 'privacy_policy_widget.dart' show PrivacyPolicyWidget;
import 'package:flutter/material.dart';

class PrivacyPolicyModel extends FlutterFlowModel<PrivacyPolicyWidget> {
  ///  Local state fields for this page.

  dynamic termContent;

  String? header;

  String? updatedTime;

  ///  State fields for stateful widgets in this page.

  // Model for TopNavBar component.
  late TopNavBarModel topNavBarModel;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    topNavBarModel = createModel(context, () => TopNavBarModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    topNavBarModel.dispose();
    bottomNavBarModel.dispose();
  }
}
