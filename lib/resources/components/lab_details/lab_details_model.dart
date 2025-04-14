import '/flutter_flow/flutter_flow_util.dart';
import '/resources/components/tag_component/tag_component_widget.dart';
import 'lab_details_widget.dart' show LabDetailsWidget;
import 'package:flutter/material.dart';

class LabDetailsModel extends FlutterFlowModel<LabDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for tagComponent component.
  late TagComponentModel tagComponentModel1;
  // Model for tagComponent component.
  late TagComponentModel tagComponentModel2;

  @override
  void initState(BuildContext context) {
    tagComponentModel1 = createModel(context, () => TagComponentModel());
    tagComponentModel2 = createModel(context, () => TagComponentModel());
  }

  @override
  void dispose() {
    tagComponentModel1.dispose();
    tagComponentModel2.dispose();
  }
}
