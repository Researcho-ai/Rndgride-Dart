import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bars/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/nav_bars/drawer/drawer_widget.dart';
import '/nav_bars/top_nav_bar/top_nav_bar_widget.dart';
import '/resources/components/data_not_found_c_omponent/data_not_found_c_omponent_widget.dart';
import '/resources/components/instruments_details/instruments_details_widget.dart';
import '/resources/components/sophisticated_instrument_component/sophisticated_instrument_component_widget.dart';
import 'instruments_widget.dart' show InstrumentsWidget;
import 'package:flutter/material.dart';

class InstrumentsModel extends FlutterFlowModel<InstrumentsWidget> {
  ///  Local state fields for this page.

  bool activeSearch = false;

  String? emptyString;

  dynamic instrumentsListFromAPI;

  List<dynamic> resultInstrumentsFromAPI = [];
  void addToResultInstrumentsFromAPI(dynamic item) =>
      resultInstrumentsFromAPI.add(item);
  void removeFromResultInstrumentsFromAPI(dynamic item) =>
      resultInstrumentsFromAPI.remove(item);
  void removeAtIndexFromResultInstrumentsFromAPI(int index) =>
      resultInstrumentsFromAPI.removeAt(index);
  void insertAtIndexInResultInstrumentsFromAPI(int index, dynamic item) =>
      resultInstrumentsFromAPI.insert(index, item);
  void updateResultInstrumentsFromAPIAtIndex(
          int index, Function(dynamic) updateFn) =>
      resultInstrumentsFromAPI[index] =
          updateFn(resultInstrumentsFromAPI[index]);

  int instrumentLength = 0;

  dynamic emptyJson;

  int? searchInstrumentCount;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Instruments Tests)] action in Instruments widget.
  ApiCallResponse? instrumentsFromAPI;
  // Model for TopNavBar component.
  late TopNavBarModel topNavBarModel;
  // State field(s) for searchI widget.
  FocusNode? searchIFocusNode;
  TextEditingController? searchITextController;
  String? Function(BuildContext, String?)? searchITextControllerValidator;
  // Stores action output result for [Backend Call - API (Search Instrument  Test)] action in searchI widget.
  ApiCallResponse? instrumentSearch;
  // Models for InstrumentsDetails dynamic component.
  late FlutterFlowDynamicModels<InstrumentsDetailsModel>
      instrumentsDetailsModels1;
  // Stores action output result for [Backend Call - API (Get Instruments Tests)] action in AddButton widget.
  ApiCallResponse? extraInstrumentz;
  // Models for InstrumentsDetails dynamic component.
  late FlutterFlowDynamicModels<InstrumentsDetailsModel>
      instrumentsDetailsModels2;
  // Models for SophisticatedInstrumentComponent dynamic component.
  late FlutterFlowDynamicModels<SophisticatedInstrumentComponentModel>
      sophisticatedInstrumentComponentModels;
  // Model for DataNotFoundCOmponent component.
  late DataNotFoundCOmponentModel dataNotFoundCOmponentModel;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;
  // Model for Drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    topNavBarModel = createModel(context, () => TopNavBarModel());
    instrumentsDetailsModels1 =
        FlutterFlowDynamicModels(() => InstrumentsDetailsModel());
    instrumentsDetailsModels2 =
        FlutterFlowDynamicModels(() => InstrumentsDetailsModel());
    sophisticatedInstrumentComponentModels =
        FlutterFlowDynamicModels(() => SophisticatedInstrumentComponentModel());
    dataNotFoundCOmponentModel =
        createModel(context, () => DataNotFoundCOmponentModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    topNavBarModel.dispose();
    searchIFocusNode?.dispose();
    searchITextController?.dispose();

    instrumentsDetailsModels1.dispose();
    instrumentsDetailsModels2.dispose();
    sophisticatedInstrumentComponentModels.dispose();
    dataNotFoundCOmponentModel.dispose();
    bottomNavBarModel.dispose();
    drawerModel.dispose();
  }
}
