import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bars/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/nav_bars/drawer/drawer_widget.dart';
import '/nav_bars/top_nav_bar/top_nav_bar_widget.dart';
import '/resources/components/data_not_found_c_omponent/data_not_found_c_omponent_widget.dart';
import 'tests_widget.dart' show TestsWidget;
import 'package:flutter/material.dart';

class TestsModel extends FlutterFlowModel<TestsWidget> {
  ///  Local state fields for this page.

  bool activeSearch = false;

  String? emptyString;

  List<dynamic> testinstrumentsListFromAPI = [];
  void addToTestinstrumentsListFromAPI(dynamic item) =>
      testinstrumentsListFromAPI.add(item);
  void removeFromTestinstrumentsListFromAPI(dynamic item) =>
      testinstrumentsListFromAPI.remove(item);
  void removeAtIndexFromTestinstrumentsListFromAPI(int index) =>
      testinstrumentsListFromAPI.removeAt(index);
  void insertAtIndexInTestinstrumentsListFromAPI(int index, dynamic item) =>
      testinstrumentsListFromAPI.insert(index, item);
  void updateTestinstrumentsListFromAPIAtIndex(
          int index, Function(dynamic) updateFn) =>
      testinstrumentsListFromAPI[index] =
          updateFn(testinstrumentsListFromAPI[index]);

  List<dynamic> resultTestFromAPI = [];
  void addToResultTestFromAPI(dynamic item) => resultTestFromAPI.add(item);
  void removeFromResultTestFromAPI(dynamic item) =>
      resultTestFromAPI.remove(item);
  void removeAtIndexFromResultTestFromAPI(int index) =>
      resultTestFromAPI.removeAt(index);
  void insertAtIndexInResultTestFromAPI(int index, dynamic item) =>
      resultTestFromAPI.insert(index, item);
  void updateResultTestFromAPIAtIndex(int index, Function(dynamic) updateFn) =>
      resultTestFromAPI[index] = updateFn(resultTestFromAPI[index]);

  int testLength = 0;

  dynamic emptyJson;

  int? searchTestCount;

  List<String> suggetions = [];
  void addToSuggetions(String item) => suggetions.add(item);
  void removeFromSuggetions(String item) => suggetions.remove(item);
  void removeAtIndexFromSuggetions(int index) => suggetions.removeAt(index);
  void insertAtIndexInSuggetions(int index, String item) =>
      suggetions.insert(index, item);
  void updateSuggetionsAtIndex(int index, Function(String) updateFn) =>
      suggetions[index] = updateFn(suggetions[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Categories)] action in Tests widget.
  ApiCallResponse? testFromAPI;
  // Model for TopNavBar component.
  late TopNavBarModel topNavBarModel;
  // State field(s) for searchI widget.
  FocusNode? searchIFocusNode;
  TextEditingController? searchITextController;
  String? Function(BuildContext, String?)? searchITextControllerValidator;
  // Stores action output result for [Backend Call - API (Search Test)] action in searchI widget.
  ApiCallResponse? instrumentSearch;
  // Stores action output result for [Backend Call - API (Test Suggestion)] action in searchI widget.
  ApiCallResponse? apiResultqu1;
  // Stores action output result for [Custom Action - replaceLastWord] action in Row widget.
  String? replacedWord;
  // Stores action output result for [Backend Call - API (Get Categories)] action in AddButton widget.
  ApiCallResponse? extraTests;
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
    searchIFocusNode?.dispose();
    searchITextController?.dispose();

    dataNotFoundCOmponentModel.dispose();
    bottomNavBarModel.dispose();
    drawerModel.dispose();
  }
}
