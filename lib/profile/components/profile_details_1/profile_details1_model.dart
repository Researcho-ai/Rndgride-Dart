import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'profile_details1_widget.dart' show ProfileDetails1Widget;
import 'package:flutter/material.dart';

class ProfileDetails1Model extends FlutterFlowModel<ProfileDetails1Widget> {
  ///  Local state fields for this component.

  List<String> userTypeList = [];
  void addToUserTypeList(String item) => userTypeList.add(item);
  void removeFromUserTypeList(String item) => userTypeList.remove(item);
  void removeAtIndexFromUserTypeList(int index) => userTypeList.removeAt(index);
  void insertAtIndexInUserTypeList(int index, String item) =>
      userTypeList.insert(index, item);
  void updateUserTypeListAtIndex(int index, Function(String) updateFn) =>
      userTypeList[index] = updateFn(userTypeList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (get user ty)] action in ProfileDetails-1 widget.
  ApiCallResponse? apiResultas3;
  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  // State field(s) for UserTypeDrpodown widget.
  String? userTypeDrpodownValue;
  FormFieldController<String>? userTypeDrpodownValueController;
  // State field(s) for ResearchField widget.
  FocusNode? researchFieldFocusNode;
  TextEditingController? researchFieldTextController;
  String? Function(BuildContext, String?)? researchFieldTextControllerValidator;
  // State field(s) for Affiliation widget.
  FocusNode? affiliationFocusNode;
  TextEditingController? affiliationTextController;
  String? Function(BuildContext, String?)? affiliationTextControllerValidator;
  // Stores action output result for [Backend Call - API (Update User Profile At Auth)] action in Button widget.
  ApiCallResponse? updatedUserData;
  // Stores action output result for [Backend Call - API (update User  Profile step one)] action in Button widget.
  ApiCallResponse? apiResult3ms;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    researchFieldFocusNode?.dispose();
    researchFieldTextController?.dispose();

    affiliationFocusNode?.dispose();
    affiliationTextController?.dispose();
  }
}
