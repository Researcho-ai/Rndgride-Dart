import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_box_widget.dart' show SearchBoxWidget;
import 'package:flutter/material.dart';

class SearchBoxModel extends FlutterFlowModel<SearchBoxWidget> {
  ///  Local state fields for this component.

  int? searchCount = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for desktopSearch widget.
  FocusNode? desktopSearchFocusNode;
  TextEditingController? desktopSearchTextController;
  String? Function(BuildContext, String?)? desktopSearchTextControllerValidator;
  // Stores action output result for [Custom Action - searchString] action in desktopSearch widget.
  String? searchString;
  // Stores action output result for [Custom Action - search] action in desktopSearch widget.
  List<String>? searchR;
  // Stores action output result for [Custom Action - sortSearchHistoryByTime] action in desktopSearch widget.
  List<SearchHistoryStruct>? sortedSearchHistory2;
  // Stores action output result for [Custom Action - search] action in desktopSearch widget.
  List<String>? searchR2;
  // Stores action output result for [Custom Action - sortSearchHistoryByTime] action in desktopSearch widget.
  List<SearchHistoryStruct>? sortedSearchHistory;
  // Stores action output result for [Custom Action - search] action in Row widget.
  List<String>? searchResultListForSearchHistory;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    desktopSearchFocusNode?.dispose();
    desktopSearchTextController?.dispose();
  }
}
