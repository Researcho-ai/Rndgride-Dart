import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/nav_bars/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/nav_bars/drawer/drawer_widget.dart';
import '/nav_bars/top_nav_bar/top_nav_bar_widget.dart';
import '/resources/components/data_not_found_c_omponent/data_not_found_c_omponent_widget.dart';
import 'lab_options_widget.dart' show LabOptionsWidget;
import 'package:flutter/material.dart';

class LabOptionsModel extends FlutterFlowModel<LabOptionsWidget> {
  ///  Local state fields for this page.

  bool analysisbool = false;

  bool solventbool = false;

  bool personVisit = false;

  bool durationResult = false;

  String? labStringOutput = 'Not Fetched By Action';

  bool cityBool = false;

  List<String> citiesNameList = [];
  void addToCitiesNameList(String item) => citiesNameList.add(item);
  void removeFromCitiesNameList(String item) => citiesNameList.remove(item);
  void removeAtIndexFromCitiesNameList(int index) =>
      citiesNameList.removeAt(index);
  void insertAtIndexInCitiesNameList(int index, String item) =>
      citiesNameList.insert(index, item);
  void updateCitiesNameListAtIndex(int index, Function(String) updateFn) =>
      citiesNameList[index] = updateFn(citiesNameList[index]);

  DocumentReference? cityRef;

  List<String> analysisNamesList = [];
  void addToAnalysisNamesList(String item) => analysisNamesList.add(item);
  void removeFromAnalysisNamesList(String item) =>
      analysisNamesList.remove(item);
  void removeAtIndexFromAnalysisNamesList(int index) =>
      analysisNamesList.removeAt(index);
  void insertAtIndexInAnalysisNamesList(int index, String item) =>
      analysisNamesList.insert(index, item);
  void updateAnalysisNamesListAtIndex(int index, Function(String) updateFn) =>
      analysisNamesList[index] = updateFn(analysisNamesList[index]);

  List<String> solventMethodList = [];
  void addToSolventMethodList(String item) => solventMethodList.add(item);
  void removeFromSolventMethodList(String item) =>
      solventMethodList.remove(item);
  void removeAtIndexFromSolventMethodList(int index) =>
      solventMethodList.removeAt(index);
  void insertAtIndexInSolventMethodList(int index, String item) =>
      solventMethodList.insert(index, item);
  void updateSolventMethodListAtIndex(int index, Function(String) updateFn) =>
      solventMethodList[index] = updateFn(solventMethodList[index]);

  String? analysisName;

  String? solventname;

  List<String> otherDetailList = [];
  void addToOtherDetailList(String item) => otherDetailList.add(item);
  void removeFromOtherDetailList(String item) => otherDetailList.remove(item);
  void removeAtIndexFromOtherDetailList(int index) =>
      otherDetailList.removeAt(index);
  void insertAtIndexInOtherDetailList(int index, String item) =>
      otherDetailList.insert(index, item);
  void updateOtherDetailListAtIndex(int index, Function(String) updateFn) =>
      otherDetailList[index] = updateFn(otherDetailList[index]);

  dynamic instrumenetPropertiesList;

  String? duration;

  bool? inperson;

  String? cityName;

  bool emptyResponce = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Fetch Lab Options)] action in LabOptions widget.
  ApiCallResponse? apiResulty2t;
  // Stores action output result for [Backend Call - API (Lab Option Page List)] action in LabOptions widget.
  ApiCallResponse? pageList;
  // Model for TopNavBar component.
  late TopNavBarModel topNavBarModel;
  // State field(s) for Analysis widget.
  String? analysisValue;
  FormFieldController<String>? analysisValueController;
  // Stores action output result for [Backend Call - API (Filter Lab Options)] action in Analysis widget.
  ApiCallResponse? apiResultfwx;
  // State field(s) for Solvent widget.
  String? solventValue;
  FormFieldController<String>? solventValueController;
  // Stores action output result for [Backend Call - API (Filter Lab Options)] action in Solvent widget.
  ApiCallResponse? apiResultSolvent;
  // State field(s) for citieszDropdown widget.
  String? citieszDropdownValue;
  FormFieldController<String>? citieszDropdownValueController;
  // Stores action output result for [Backend Call - API (Filter Lab Options)] action in citieszDropdown widget.
  ApiCallResponse? apiResultCities;
  // State field(s) for ResultDurationDropdown widget.
  String? resultDurationDropdownValue;
  FormFieldController<String>? resultDurationDropdownValueController;
  // Stores action output result for [Backend Call - API (Filter Lab Options)] action in ResultDurationDropdown widget.
  ApiCallResponse? apiResultSolventDuration;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (Filter Lab Options)] action in Switch widget.
  ApiCallResponse? apiResultVisitPersonal;
  // Stores action output result for [Backend Call - API (Filter Lab Options)] action in Switch widget.
  ApiCallResponse? apiResultVisitPersonalCopy;
  // Stores action output result for [Backend Call - API (Filter Lab Options)] action in Switch widget.
  ApiCallResponse? apiResultVisitPersonalCopy2;
  // Stores action output result for [Backend Call - API (Fetch Lab Options)] action in Button widget.
  ApiCallResponse? apiResulty2tResetButton;
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
