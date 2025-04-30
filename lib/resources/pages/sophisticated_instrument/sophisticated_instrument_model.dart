import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bars/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/nav_bars/drawer/drawer_widget.dart';
import '/nav_bars/top_nav_bar/top_nav_bar_widget.dart';
import '/resources/components/data_not_found_c_omponent/data_not_found_c_omponent_widget.dart';
import '/resources/components/sophisticated_instrument_component/sophisticated_instrument_component_widget.dart';
import 'sophisticated_instrument_widget.dart'
    show SophisticatedInstrumentWidget;
import 'package:flutter/material.dart';

class SophisticatedInstrumentModel
    extends FlutterFlowModel<SophisticatedInstrumentWidget> {
  ///  Local state fields for this page.

  dynamic sophisticatedInstruments;

  bool shoSophisticated = false;

  int? count = 0;

  bool activeSearch = false;

  int? searchResultCount = 0;

  List<dynamic> searchResult = [];
  void addToSearchResult(dynamic item) => searchResult.add(item);
  void removeFromSearchResult(dynamic item) => searchResult.remove(item);
  void removeAtIndexFromSearchResult(int index) => searchResult.removeAt(index);
  void insertAtIndexInSearchResult(int index, dynamic item) =>
      searchResult.insert(index, item);
  void updateSearchResultAtIndex(int index, Function(dynamic) updateFn) =>
      searchResult[index] = updateFn(searchResult[index]);

  List<String> sugetions = [];
  void addToSugetions(String item) => sugetions.add(item);
  void removeFromSugetions(String item) => sugetions.remove(item);
  void removeAtIndexFromSugetions(int index) => sugetions.removeAt(index);
  void insertAtIndexInSugetions(int index, String item) =>
      sugetions.insert(index, item);
  void updateSugetionsAtIndex(int index, Function(String) updateFn) =>
      sugetions[index] = updateFn(sugetions[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Sophisticated Instruments Tests)] action in SophisticatedInstrument widget.
  ApiCallResponse? sophisticatedInstrumentDesktop;
  // Model for TopNavBar component.
  late TopNavBarModel topNavBarModel;
  // State field(s) for searchI widget.
  FocusNode? searchIFocusNode;
  TextEditingController? searchITextController;
  String? Function(BuildContext, String?)? searchITextControllerValidator;
  // Stores action output result for [Backend Call - API (Search Instrument  Test)] action in searchI widget.
  ApiCallResponse? instrumentSearch;
  // Stores action output result for [Backend Call - API (Instrument suggestions)] action in searchI widget.
  ApiCallResponse? apiResult81w;
  // Stores action output result for [Custom Action - replaceLastWord] action in Row widget.
  String? replacedWord;
  // Models for SophisticatedInstrumentComponent dynamic component.
  late FlutterFlowDynamicModels<SophisticatedInstrumentComponentModel>
      sophisticatedInstrumentComponentModels1;
  // Stores action output result for [Backend Call - API (Get Sophisticated Instruments Tests)] action in AddButton widget.
  ApiCallResponse? sophisticatedInstrumentExtra;
  // Models for SophisticatedInstrumentComponent dynamic component.
  late FlutterFlowDynamicModels<SophisticatedInstrumentComponentModel>
      sophisticatedInstrumentComponentModels2;
  // Model for DataNotFoundCOmponent component.
  late DataNotFoundCOmponentModel dataNotFoundCOmponentModel;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;
  // Model for Drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    topNavBarModel = createModel(context, () => TopNavBarModel());
    sophisticatedInstrumentComponentModels1 =
        FlutterFlowDynamicModels(() => SophisticatedInstrumentComponentModel());
    sophisticatedInstrumentComponentModels2 =
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

    sophisticatedInstrumentComponentModels1.dispose();
    sophisticatedInstrumentComponentModels2.dispose();
    dataNotFoundCOmponentModel.dispose();
    bottomNavBarModel.dispose();
    drawerModel.dispose();
  }
}
