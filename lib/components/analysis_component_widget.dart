import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'analysis_component_model.dart';
export 'analysis_component_model.dart';

class AnalysisComponentWidget extends StatefulWidget {
  const AnalysisComponentWidget({
    super.key,
    this.analysisName,
    this.solvent,
    this.addAction,
    this.rmAction,
  });

  final String? analysisName;
  final String? solvent;
  final Future Function()? addAction;
  final Future Function()? rmAction;

  @override
  State<AnalysisComponentWidget> createState() =>
      _AnalysisComponentWidgetState();
}

class _AnalysisComponentWidgetState extends State<AnalysisComponentWidget> {
  late AnalysisComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnalysisComponentModel());

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
                  value: _model.checkboxValue ??= false,
                  onChanged: (newValue) async {
                    safeSetState(() => _model.checkboxValue = newValue!);
                    if (newValue!) {
                      logFirebaseEvent(
                          'ANALYSIS_COMPONENT_Checkbox_mpryiamy_ON_');
                      logFirebaseEvent('Checkbox_execute_callback');
                      await widget.addAction?.call();
                    } else {
                      logFirebaseEvent(
                          'ANALYSIS_COMPONENT_Checkbox_mpryiamy_ON_');
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if ((widget.analysisName != null &&
                                  widget.analysisName != '') &&
                              (widget.analysisName != ''))
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 6.0, 0.0, 6.0),
                                child: Text(
                                  'Analysis : ${widget.analysisName}',
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if ((widget.solvent != null &&
                                  widget.solvent != '') &&
                              (widget.solvent != ''))
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 6.0, 0.0, 6.0),
                                child: Text(
                                  'Solvent : ${widget.solvent}',
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
