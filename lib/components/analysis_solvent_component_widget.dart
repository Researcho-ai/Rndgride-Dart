import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'analysis_solvent_component_model.dart';
export 'analysis_solvent_component_model.dart';

class AnalysisSolventComponentWidget extends StatefulWidget {
  const AnalysisSolventComponentWidget({
    super.key,
    this.data,
    this.selectAction,
    this.unSelectedAction,
  });

  final dynamic data;
  final Future Function()? selectAction;
  final Future Function()? unSelectedAction;

  @override
  State<AnalysisSolventComponentWidget> createState() =>
      _AnalysisSolventComponentWidgetState();
}

class _AnalysisSolventComponentWidgetState
    extends State<AnalysisSolventComponentWidget> {
  late AnalysisSolventComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnalysisSolventComponentModel());

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
      elevation: _model.checkboxValue! ? 0.0 : 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: _model.checkboxValue!
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).line,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
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
                          'ANALYSIS_SOLVENT_COMPONENT_Checkbox_y41u');
                      logFirebaseEvent('Checkbox_execute_callback');
                      await widget.selectAction?.call();
                    } else {
                      logFirebaseEvent(
                          'ANALYSIS_SOLVENT_COMPONENT_Checkbox_y41u');
                      logFirebaseEvent('Checkbox_execute_callback');
                      await widget.unSelectedAction?.call();
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (getJsonField(
                          widget.data,
                          r'''$.analysis_name''',
                        ) !=
                        null)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                        child: Text(
                          'Analysis : ${getJsonField(
                            widget.data,
                            r'''$.analysis_name''',
                          ).toString()}',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    if (getJsonField(
                          widget.data,
                          r'''$.solvent_name''',
                        ) !=
                        null)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                        child: Text(
                          'Solvent : ${getJsonField(
                            widget.data,
                            r'''$.solvent_name''',
                          ).toString()}',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
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
    );
  }
}
