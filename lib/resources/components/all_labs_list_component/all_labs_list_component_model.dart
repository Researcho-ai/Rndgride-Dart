import '/flutter_flow/flutter_flow_util.dart';
import '/resources/components/lab_card/lab_card_widget.dart';
import 'all_labs_list_component_widget.dart' show AllLabsListComponentWidget;
import 'package:flutter/material.dart';

class AllLabsListComponentModel
    extends FlutterFlowModel<AllLabsListComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for LabCard dynamic component.
  late FlutterFlowDynamicModels<LabCardModel> labCardModels;

  @override
  void initState(BuildContext context) {
    labCardModels = FlutterFlowDynamicModels(() => LabCardModel());
  }

  @override
  void dispose() {
    labCardModels.dispose();
  }
}
