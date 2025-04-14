import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/components/theme_mode/theme_mode_widget.dart';
import 'drawer_widget.dart' show DrawerWidget;
import 'package:flutter/material.dart';

class DrawerModel extends FlutterFlowModel<DrawerWidget> {
  ///  State fields for stateful widgets in this component.

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
