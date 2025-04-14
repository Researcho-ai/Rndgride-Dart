import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/resources/components/instrument_test_detail_component/instrument_test_detail_component_widget.dart';
import '/resources/components/lab_type_tag/lab_type_tag_widget.dart';
import 'lab_options_c_widget.dart' show LabOptionsCWidget;
import 'package:flutter/material.dart';

class LabOptionsCModel extends FlutterFlowModel<LabOptionsCWidget> {
  ///  Local state fields for this component.

  TestAnalysisFieldAvaibilityStruct? testAnalysisAvailibily;
  void updateTestAnalysisAvailibilyStruct(
      Function(TestAnalysisFieldAvaibilityStruct) updateFn) {
    updateFn(testAnalysisAvailibily ??= TestAnalysisFieldAvaibilityStruct());
  }

  List<InstrumentPropertiesStruct> instrumetnProperties = [];
  void addToInstrumetnProperties(InstrumentPropertiesStruct item) =>
      instrumetnProperties.add(item);
  void removeFromInstrumetnProperties(InstrumentPropertiesStruct item) =>
      instrumetnProperties.remove(item);
  void removeAtIndexFromInstrumetnProperties(int index) =>
      instrumetnProperties.removeAt(index);
  void insertAtIndexInInstrumetnProperties(
          int index, InstrumentPropertiesStruct item) =>
      instrumetnProperties.insert(index, item);
  void updateInstrumetnPropertiesAtIndex(
          int index, Function(InstrumentPropertiesStruct) updateFn) =>
      instrumetnProperties[index] = updateFn(instrumetnProperties[index]);

  dynamic instrumentJson;

  bool analysisBool = false;

  bool solventBool = false;

  bool academicBool = false;

  bool industrilBool = false;

  bool otherBool = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getInstrumentProperties)] action in LabOptionsC widget.
  ApiCallResponse? apiResultcbv;
  // Model for LabTypeTag component.
  late LabTypeTagModel labTypeTagModel;
  // Models for instrument_test_detail_component dynamic component.
  late FlutterFlowDynamicModels<InstrumentTestDetailComponentModel>
      instrumentTestDetailComponentModels;

  @override
  void initState(BuildContext context) {
    labTypeTagModel = createModel(context, () => LabTypeTagModel());
    instrumentTestDetailComponentModels =
        FlutterFlowDynamicModels(() => InstrumentTestDetailComponentModel());
  }

  @override
  void dispose() {
    labTypeTagModel.dispose();
    instrumentTestDetailComponentModels.dispose();
  }
}
