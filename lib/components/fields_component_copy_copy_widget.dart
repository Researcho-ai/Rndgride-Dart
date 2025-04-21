import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fields_component_copy_copy_model.dart';
export 'fields_component_copy_copy_model.dart';

class FieldsComponentCopyCopyWidget extends StatefulWidget {
  const FieldsComponentCopyCopyWidget({
    super.key,
    this.fieldname,
    this.solvent,
    this.addAction,
    this.rmAction,
    this.materialName,
    this.test,
    this.methods,
    this.level,
  });

  final String? fieldname;
  final String? solvent;
  final Future Function()? addAction;
  final Future Function()? rmAction;
  final String? materialName;
  final String? test;
  final String? methods;
  final int? level;

  @override
  State<FieldsComponentCopyCopyWidget> createState() =>
      _FieldsComponentCopyCopyWidgetState();
}

class _FieldsComponentCopyCopyWidgetState
    extends State<FieldsComponentCopyCopyWidget> {
  late FieldsComponentCopyCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FieldsComponentCopyCopyModel());

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
                          'FIELDS_COMPONENT_COPY_COPY_Checkbox_585a');
                      logFirebaseEvent('Checkbox_execute_callback');
                      await widget.addAction?.call();
                    } else {
                      logFirebaseEvent(
                          'FIELDS_COMPONENT_COPY_COPY_Checkbox_585a');
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
                          if ((widget.fieldname != null &&
                                  widget.fieldname != '') &&
                              (widget.fieldname != ''))
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 6.0, 0.0, 6.0),
                                child: Text(
                                  'Field : ${widget.fieldname}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
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
                                  'Materials : ${widget.materialName}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
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
                                  'Test : ${widget.test}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
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
                                  'Methods : ${widget.methods}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
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
