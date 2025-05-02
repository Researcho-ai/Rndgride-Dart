import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'material_component_model.dart';
export 'material_component_model.dart';

class MaterialComponentWidget extends StatefulWidget {
  const MaterialComponentWidget({
    super.key,
    this.addAction,
    this.rmAction,
    this.materialName,
    this.level,
    bool? checkBoxValue,
  }) : this.checkBoxValue = checkBoxValue ?? false;

  final Future Function()? addAction;
  final Future Function()? rmAction;
  final String? materialName;
  final int? level;
  final bool checkBoxValue;

  @override
  State<MaterialComponentWidget> createState() =>
      _MaterialComponentWidgetState();
}

class _MaterialComponentWidgetState extends State<MaterialComponentWidget> {
  late MaterialComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MaterialComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Theme(
                data: ThemeData(
                  checkboxTheme: CheckboxThemeData(
                    shape: CircleBorder(),
                  ),
                  unselectedWidgetColor: FlutterFlowTheme.of(context).primary,
                ),
                child: Checkbox(
                  value: _model.checkboxValue ??= widget.checkBoxValue,
                  onChanged: (newValue) async {
                    safeSetState(() => _model.checkboxValue = newValue!);
                    if (newValue!) {
                      logFirebaseEvent(
                          'MATERIAL_COMPONENT_Checkbox_k13iccnq_ON_');
                      logFirebaseEvent('Checkbox_execute_callback');
                      await widget.addAction?.call();
                    } else {
                      logFirebaseEvent(
                          'MATERIAL_COMPONENT_Checkbox_k13iccnq_ON_');
                      logFirebaseEvent('Checkbox_execute_callback');
                      await widget.rmAction?.call();
                    }
                  },
                  side: BorderSide(
                    width: 2,
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  activeColor: FlutterFlowTheme.of(context).tertiary,
                  checkColor: FlutterFlowTheme.of(context).info,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if ((widget.materialName != null &&
                                    widget.materialName != '') &&
                                (widget.materialName != ''))
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 6.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.materialName,
                                      '-',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
