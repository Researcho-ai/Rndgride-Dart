import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'instrument_properties_copy_widget.dart'
    show InstrumentPropertiesCopyWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InstrumentPropertiesCopyModel
    extends FlutterFlowModel<InstrumentPropertiesCopyWidget> {
  ///  Local state fields for this component.

  List<dynamic> availableInstrumentName = [];
  void addToAvailableInstrumentName(dynamic item) =>
      availableInstrumentName.add(item);
  void removeFromAvailableInstrumentName(dynamic item) =>
      availableInstrumentName.remove(item);
  void removeAtIndexFromAvailableInstrumentName(int index) =>
      availableInstrumentName.removeAt(index);
  void insertAtIndexInAvailableInstrumentName(int index, dynamic item) =>
      availableInstrumentName.insert(index, item);
  void updateAvailableInstrumentNameAtIndex(
          int index, Function(dynamic) updateFn) =>
      availableInstrumentName[index] = updateFn(availableInstrumentName[index]);

  List<dynamic> selectedTests = [];
  void addToSelectedTests(dynamic item) => selectedTests.add(item);
  void removeFromSelectedTests(dynamic item) => selectedTests.remove(item);
  void removeAtIndexFromSelectedTests(int index) =>
      selectedTests.removeAt(index);
  void insertAtIndexInSelectedTests(int index, dynamic item) =>
      selectedTests.insert(index, item);
  void updateSelectedTestsAtIndex(int index, Function(dynamic) updateFn) =>
      selectedTests[index] = updateFn(selectedTests[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Fetch Instrument Test List)] action in InstrumentPropertiesCopy widget.
  ApiCallResponse? apiResultj0o;
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
  ApiCallResponse? apiResultt50Copy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    requirementTextFieldFocusNode?.dispose();
    requirementTextFieldTextController?.dispose();
  }
}
