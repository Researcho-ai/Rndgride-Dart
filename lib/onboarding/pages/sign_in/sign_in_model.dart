import '/flutter_flow/flutter_flow_util.dart';
import '/onboarding/sign_in_compoent/sign_in_compoent_widget.dart';
import 'sign_in_widget.dart' show SignInWidget;
import 'package:flutter/material.dart';

class SignInModel extends FlutterFlowModel<SignInWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SignInCompoent component.
  late SignInCompoentModel signInCompoentModel;

  @override
  void initState(BuildContext context) {
    signInCompoentModel = createModel(context, () => SignInCompoentModel());
  }

  @override
  void dispose() {
    signInCompoentModel.dispose();
  }
}
