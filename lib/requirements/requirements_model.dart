import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/components/user_requirement_copy/user_requirement_copy_widget.dart';
import 'requirements_widget.dart' show RequirementsWidget;
import 'package:flutter/material.dart';

class RequirementsModel extends FlutterFlowModel<RequirementsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UserRequirementCopy component.
  late UserRequirementCopyModel userRequirementCopyModel;

  @override
  void initState(BuildContext context) {
    userRequirementCopyModel =
        createModel(context, () => UserRequirementCopyModel());
  }

  @override
  void dispose() {
    userRequirementCopyModel.dispose();
  }
}
