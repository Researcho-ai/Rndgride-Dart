import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'test_properties_component_widget.dart'
    show TestPropertiesComponentWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TestPropertiesComponentModel
    extends FlutterFlowModel<TestPropertiesComponentWidget> {
  ///  Local state fields for this component.

  List<dynamic> finalList = [];
  void addToFinalList(dynamic item) => finalList.add(item);
  void removeFromFinalList(dynamic item) => finalList.remove(item);
  void removeAtIndexFromFinalList(int index) => finalList.removeAt(index);
  void insertAtIndexInFinalList(int index, dynamic item) =>
      finalList.insert(index, item);
  void updateFinalListAtIndex(int index, Function(dynamic) updateFn) =>
      finalList[index] = updateFn(finalList[index]);

  int? level;

  bool materialShow = true;

  bool testMethodShow = false;

  String? selectedMaterial;

  String? selectedTest;

  List<dynamic> testMethodList = [];
  void addToTestMethodList(dynamic item) => testMethodList.add(item);
  void removeFromTestMethodList(dynamic item) => testMethodList.remove(item);
  void removeAtIndexFromTestMethodList(int index) =>
      testMethodList.removeAt(index);
  void insertAtIndexInTestMethodList(int index, dynamic item) =>
      testMethodList.insert(index, item);
  void updateTestMethodListAtIndex(int index, Function(dynamic) updateFn) =>
      testMethodList[index] = updateFn(testMethodList[index]);

  String? selectedMethod;

  List<dynamic> selectedtestList = [];
  void addToSelectedtestList(dynamic item) => selectedtestList.add(item);
  void removeFromSelectedtestList(dynamic item) =>
      selectedtestList.remove(item);
  void removeAtIndexFromSelectedtestList(int index) =>
      selectedtestList.removeAt(index);
  void insertAtIndexInSelectedtestList(int index, dynamic item) =>
      selectedtestList.insert(index, item);
  void updateSelectedtestListAtIndex(int index, Function(dynamic) updateFn) =>
      selectedtestList[index] = updateFn(selectedtestList[index]);

  int? selectesMaterialIndex;

  List<int> selectedTestIndexs = [];
  void addToSelectedTestIndexs(int item) => selectedTestIndexs.add(item);
  void removeFromSelectedTestIndexs(int item) =>
      selectedTestIndexs.remove(item);
  void removeAtIndexFromSelectedTestIndexs(int index) =>
      selectedTestIndexs.removeAt(index);
  void insertAtIndexInSelectedTestIndexs(int index, int item) =>
      selectedTestIndexs.insert(index, item);
  void updateSelectedTestIndexsAtIndex(int index, Function(int) updateFn) =>
      selectedTestIndexs[index] = updateFn(selectedTestIndexs[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Get Availabe Test Propeties)] action in testPropertiesComponent widget.
  ApiCallResponse? apiResultj0o;
  // Stores action output result for [Custom Action - filterAvailableTests] action in materialComponent widget.
  List<dynamic>? testMethods;
  // State field(s) for RequirementTextField widget.
  FocusNode? requirementTextFieldFocusNode;
  TextEditingController? requirementTextFieldTextController;
  final requirementTextFieldMask = MaskTextInputFormatter(mask: '####');
  String? Function(BuildContext, String?)?
      requirementTextFieldTextControllerValidator;
  // State field(s) for DurationDrpodown widget.
  String? durationDrpodownValue;
  FormFieldController<String>? durationDrpodownValueController;
  // Stores action output result for [Backend Call - API (createBooking)] action in Button widget.
  ApiCallResponse? apiResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    requirementTextFieldFocusNode?.dispose();
    requirementTextFieldTextController?.dispose();
  }
}
