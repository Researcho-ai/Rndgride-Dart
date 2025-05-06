import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/components/theme_mode/theme_mode_widget.dart';
import '/nav_bars/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/nav_bars/drawer/drawer_widget.dart';
import '/nav_bars/top_nav_bar/top_nav_bar_widget.dart';
import '/profile/components/profile_page_component/profile_page_component_widget.dart';
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
  ApiCallResponse? userDataFetchedButtomSheet22;
  // Model for TopNavBar component.
  late TopNavBarModel topNavBarModel;
  // Model for profilePageComponent component.
  late ProfilePageComponentModel profilePageComponentModel;
  // Model for ThemeMode component.
  late ThemeModeModel themeModeModel;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;
  // Model for Drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    topNavBarModel = createModel(context, () => TopNavBarModel());
    profilePageComponentModel =
        createModel(context, () => ProfilePageComponentModel());
    themeModeModel = createModel(context, () => ThemeModeModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    topNavBarModel.dispose();
    profilePageComponentModel.dispose();
    themeModeModel.dispose();
    bottomNavBarModel.dispose();
    drawerModel.dispose();
  }
}
