import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bars/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/nav_bars/drawer/drawer_widget.dart';
import '/nav_bars/top_nav_bar/top_nav_bar_widget.dart';
import '/resources/components/data_not_found_c_omponent/data_not_found_c_omponent_widget.dart';
import '/resources/components/instruments_details/instruments_details_widget.dart';
import 'lab_instruments_widget.dart' show LabInstrumentsWidget;
import 'package:flutter/material.dart';

class LabInstrumentsModel extends FlutterFlowModel<LabInstrumentsWidget> {
  ///  Local state fields for this page.

  bool activeSearch = false;

  int count = 9;

  bool alreadySearched = false;

  bool searchResultEmpty = false;

  dynamic lbInstrumentList;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (labResources)] action in LabInstruments widget.
  ApiCallResponse? apiResult2vs;
  // Model for TopNavBar component.
  late TopNavBarModel topNavBarModel;
  // Models for InstrumentsDetails dynamic component.
  late FlutterFlowDynamicModels<InstrumentsDetailsModel>
      instrumentsDetailsModels;
  // Model for DataNotFoundCOmponent component.
  late DataNotFoundCOmponentModel dataNotFoundCOmponentModel;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;
  // Model for Drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    topNavBarModel = createModel(context, () => TopNavBarModel());
    instrumentsDetailsModels =
        FlutterFlowDynamicModels(() => InstrumentsDetailsModel());
    dataNotFoundCOmponentModel =
        createModel(context, () => DataNotFoundCOmponentModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    topNavBarModel.dispose();
    instrumentsDetailsModels.dispose();
    dataNotFoundCOmponentModel.dispose();
    bottomNavBarModel.dispose();
    drawerModel.dispose();
  }
}
