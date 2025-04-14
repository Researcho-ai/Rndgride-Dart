import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bars/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/nav_bars/drawer/drawer_widget.dart';
import '/nav_bars/top_nav_bar/top_nav_bar_widget.dart';
import '/resources/components/data_not_found_c_omponent/data_not_found_c_omponent_widget.dart';
import 'labs_widget.dart' show LabsWidget;
import 'package:flutter/material.dart';

class LabsModel extends FlutterFlowModel<LabsWidget> {
  ///  Local state fields for this page.

  dynamic labsListFromAPI;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Labs)] action in Labs widget.
  ApiCallResponse? labsFromAPI;
  // Model for TopNavBar component.
  late TopNavBarModel topNavBarModel;
  // Model for DataNotFoundCOmponent component.
  late DataNotFoundCOmponentModel dataNotFoundCOmponentModel;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;
  // Model for Drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    topNavBarModel = createModel(context, () => TopNavBarModel());
    dataNotFoundCOmponentModel =
        createModel(context, () => DataNotFoundCOmponentModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    topNavBarModel.dispose();
    dataNotFoundCOmponentModel.dispose();
    bottomNavBarModel.dispose();
    drawerModel.dispose();
  }
}
