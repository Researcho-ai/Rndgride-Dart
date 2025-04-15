import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bars/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/nav_bars/drawer/drawer_widget.dart';
import '/nav_bars/top_nav_bar/top_nav_bar_widget.dart';
import '/profile/components/profile_page_component/profile_page_component_widget.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  String? displayName;

  String? phoneNumber;

  String? researchField;

  String? affiliaion;

  String? userType;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get User Data)] action in Profile widget.
  ApiCallResponse? apiResultpwu;
  // Model for Drawer component.
  late DrawerModel drawerModel;
  // Model for TopNavBar component.
  late TopNavBarModel topNavBarModel;
  // Model for profilePageComponent component.
  late ProfilePageComponentModel profilePageComponentModel;
  // Stores action output result for [Backend Call - API (Get User Data)] action in IconButton widget.
  ApiCallResponse? userDataFetched;
  // Stores action output result for [Backend Call - API (Get User Data)] action in IconButton widget.
  ApiCallResponse? userDataFetchedDialog;
  // Stores action output result for [Backend Call - API (Get User Data)] action in IconButton widget.
  ApiCallResponse? userDataFetchedDialog2;
  // Stores action output result for [Backend Call - API (Get User Data)] action in IconButton widget.
  ApiCallResponse? userDataFetchedButtomSheet2;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    drawerModel = createModel(context, () => DrawerModel());
    topNavBarModel = createModel(context, () => TopNavBarModel());
    profilePageComponentModel =
        createModel(context, () => ProfilePageComponentModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    drawerModel.dispose();
    topNavBarModel.dispose();
    profilePageComponentModel.dispose();
    bottomNavBarModel.dispose();
  }
}
