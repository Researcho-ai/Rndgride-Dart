import '/flutter_flow/flutter_flow_util.dart';
import '/resources/components/tag_component/tag_component_widget.dart';
import 'resource_booking_widget.dart' show ResourceBookingWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ResourceBookingModel extends FlutterFlowModel<ResourceBookingWidget> {
  ///  Local state fields for this component.

  int? sampleQuantity;

  bool isEdit = false;

  double? basePrice;

  double? plateformFee;

  double? totalFee;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for tagComponent component.
  late TagComponentModel tagComponentModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  final firstNameMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;

  @override
  void initState(BuildContext context) {
    tagComponentModel = createModel(context, () => TagComponentModel());
  }

  @override
  void dispose() {
    tagComponentModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();
  }
}
