import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_page_component_widget.dart' show ProfilePageComponentWidget;
import 'package:flutter/material.dart';

class ProfilePageComponentModel
    extends FlutterFlowModel<ProfilePageComponentWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - encodeImageToBase64] action in IconButton widget.
  String? base4String;
  // Stores action output result for [Backend Call - API (uoploadImage)] action in IconButton widget.
  ApiCallResponse? imageUrl;
  // Stores action output result for [Backend Call - API (Update User Image)] action in IconButton widget.
  ApiCallResponse? apiResulto9p;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
