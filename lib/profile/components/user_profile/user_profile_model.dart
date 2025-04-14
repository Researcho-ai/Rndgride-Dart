import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/components/theme_mode/theme_mode_widget.dart';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:flutter/material.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Model for ThemeMode component.
  late ThemeModeModel themeModeModel;

  @override
  void initState(BuildContext context) {
    themeModeModel = createModel(context, () => ThemeModeModel());
  }

  @override
  void dispose() {
    themeModeModel.dispose();
  }
}
