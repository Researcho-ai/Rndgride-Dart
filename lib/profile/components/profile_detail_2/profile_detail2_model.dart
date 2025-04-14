import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_detail2_widget.dart' show ProfileDetail2Widget;
import 'package:flutter/material.dart';

class ProfileDetail2Model extends FlutterFlowModel<ProfileDetail2Widget> {
  ///  Local state fields for this component.

  String imagePath = '';

  bool edit = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ResearchField widget.
  FocusNode? researchFieldFocusNode;
  TextEditingController? researchFieldTextController;
  String? Function(BuildContext, String?)? researchFieldTextControllerValidator;
  String? _researchFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yfl30lic' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for RequeredResoursec widget.
  FocusNode? requeredResoursecFocusNode;
  TextEditingController? requeredResoursecTextController;
  String? Function(BuildContext, String?)?
      requeredResoursecTextControllerValidator;
  // State field(s) for Affiliation widget.
  FocusNode? affiliationFocusNode;
  TextEditingController? affiliationTextController;
  String? Function(BuildContext, String?)? affiliationTextControllerValidator;
  String? _affiliationTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'y9cykq0z' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Update User Profile Two)] action in Save widget.
  ApiCallResponse? userDataUpdated;

  @override
  void initState(BuildContext context) {
    researchFieldTextControllerValidator =
        _researchFieldTextControllerValidator;
    affiliationTextControllerValidator = _affiliationTextControllerValidator;
  }

  @override
  void dispose() {
    researchFieldFocusNode?.dispose();
    researchFieldTextController?.dispose();

    requeredResoursecFocusNode?.dispose();
    requeredResoursecTextController?.dispose();

    affiliationFocusNode?.dispose();
    affiliationTextController?.dispose();
  }
}
