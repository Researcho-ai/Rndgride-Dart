import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'user_requirement_copy_widget.dart' show UserRequirementCopyWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UserRequirementCopyModel
    extends FlutterFlowModel<UserRequirementCopyWidget> {
  ///  Local state fields for this component.

  String? userTypename;

  String? emptyString;

  List<String> userTypes = [];
  void addToUserTypes(String item) => userTypes.add(item);
  void removeFromUserTypes(String item) => userTypes.remove(item);
  void removeAtIndexFromUserTypes(int index) => userTypes.removeAt(index);
  void insertAtIndexInUserTypes(int index, String item) =>
      userTypes.insert(index, item);
  void updateUserTypesAtIndex(int index, Function(String) updateFn) =>
      userTypes[index] = updateFn(userTypes[index]);

  ///  State fields for stateful widgets in this component.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (get user ty)] action in UserRequirementCopy widget.
  ApiCallResponse? userTypeRef;
  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  String? _nameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'o4u07e0n' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for PhoneTextField widget.
  FocusNode? phoneTextFieldFocusNode;
  TextEditingController? phoneTextFieldTextController;
  final phoneTextFieldMask = MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)?
      phoneTextFieldTextControllerValidator;
  String? _phoneTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qnsgx86k' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for UserTypeDrpodown widget.
  String? userTypeDrpodownValue;
  FormFieldController<String>? userTypeDrpodownValueController;
  // State field(s) for SectorOrField widget.
  FocusNode? sectorOrFieldFocusNode;
  TextEditingController? sectorOrFieldTextController;
  String? Function(BuildContext, String?)? sectorOrFieldTextControllerValidator;
  String? _sectorOrFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        't70be1ga' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Affiliance widget.
  FocusNode? affilianceFocusNode;
  TextEditingController? affilianceTextController;
  String? Function(BuildContext, String?)? affilianceTextControllerValidator;
  String? _affilianceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ixrraa12' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for RequireFacilities widget.
  FocusNode? requireFacilitiesFocusNode;
  TextEditingController? requireFacilitiesTextController;
  String? Function(BuildContext, String?)?
      requireFacilitiesTextControllerValidator;
  String? _requireFacilitiesTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ppn0v83b' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for RequirementTextField widget.
  FocusNode? requirementTextFieldFocusNode;
  TextEditingController? requirementTextFieldTextController;
  String? Function(BuildContext, String?)?
      requirementTextFieldTextControllerValidator;
  String? _requirementTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'k4syjwfx' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DurationDrpodown widget.
  String? durationDrpodownValue;
  FormFieldController<String>? durationDrpodownValueController;
  // Stores action output result for [Backend Call - API (createInquery)] action in SubmitButton widget.
  ApiCallResponse? createdUserRequest;
  // Stores action output result for [Backend Call - API (createInquery)] action in SubmitButton widget.
  ApiCallResponse? createdUserRequestCopy;

  @override
  void initState(BuildContext context) {
    nameTextFieldTextControllerValidator =
        _nameTextFieldTextControllerValidator;
    phoneTextFieldTextControllerValidator =
        _phoneTextFieldTextControllerValidator;
    sectorOrFieldTextControllerValidator =
        _sectorOrFieldTextControllerValidator;
    affilianceTextControllerValidator = _affilianceTextControllerValidator;
    requireFacilitiesTextControllerValidator =
        _requireFacilitiesTextControllerValidator;
    requirementTextFieldTextControllerValidator =
        _requirementTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    phoneTextFieldFocusNode?.dispose();
    phoneTextFieldTextController?.dispose();

    sectorOrFieldFocusNode?.dispose();
    sectorOrFieldTextController?.dispose();

    affilianceFocusNode?.dispose();
    affilianceTextController?.dispose();

    requireFacilitiesFocusNode?.dispose();
    requireFacilitiesTextController?.dispose();

    requirementTextFieldFocusNode?.dispose();
    requirementTextFieldTextController?.dispose();
  }
}
