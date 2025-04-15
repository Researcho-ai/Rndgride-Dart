import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sign_in_compoent_widget.dart' show SignInCompoentWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignInCompoentModel extends FlutterFlowModel<SignInCompoentWidget> {
  ///  Local state fields for this component.

  String? phoneNumber = '+19512022757';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PhoneNumber2 widget.
  FocusNode? phoneNumber2FocusNode;
  TextEditingController? phoneNumber2TextController;
  final phoneNumber2Mask = MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)? phoneNumber2TextControllerValidator;
  // Stores action output result for [Backend Call - API (sendOtp)] action in Button widget.
  ApiCallResponse? apiResults4y;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneNumber2FocusNode?.dispose();
    phoneNumber2TextController?.dispose();
  }
}
