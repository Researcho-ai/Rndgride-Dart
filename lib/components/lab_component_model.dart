import '/flutter_flow/flutter_flow_util.dart';
import '/resources/components/lab_type_tag/lab_type_tag_widget.dart';
import 'lab_component_widget.dart' show LabComponentWidget;
import 'package:flutter/material.dart';

class LabComponentModel extends FlutterFlowModel<LabComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for LabTypeTag component.
  late LabTypeTagModel labTypeTagModel;

  @override
  void initState(BuildContext context) {
    labTypeTagModel = createModel(context, () => LabTypeTagModel());
  }

  @override
  void dispose() {
    labTypeTagModel.dispose();
  }
}
