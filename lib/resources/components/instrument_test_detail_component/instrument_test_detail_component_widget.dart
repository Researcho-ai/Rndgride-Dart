import '/auth/custom_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'instrument_test_detail_component_model.dart';
export 'instrument_test_detail_component_model.dart';

class InstrumentTestDetailComponentWidget extends StatefulWidget {
  const InstrumentTestDetailComponentWidget({
    super.key,
    this.analysis,
    this.solvent,
    this.acedemic,
    this.industrial,
    this.other,
    bool? analysisBool,
    bool? solventBool,
    bool? acedemicBool,
    bool? industrialBool,
    bool? otherBool,
  })  : this.analysisBool = analysisBool ?? false,
        this.solventBool = solventBool ?? false,
        this.acedemicBool = acedemicBool ?? false,
        this.industrialBool = industrialBool ?? false,
        this.otherBool = otherBool ?? false;

  final String? analysis;
  final String? solvent;
  final String? acedemic;
  final String? industrial;
  final String? other;
  final bool analysisBool;
  final bool solventBool;
  final bool acedemicBool;
  final bool industrialBool;
  final bool otherBool;

  @override
  State<InstrumentTestDetailComponentWidget> createState() =>
      _InstrumentTestDetailComponentWidgetState();
}

class _InstrumentTestDetailComponentWidgetState
    extends State<InstrumentTestDetailComponentWidget> {
  late InstrumentTestDetailComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InstrumentTestDetailComponentModel());

    _model.textController1 ??= TextEditingController(text: widget.analysis);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(text: widget.solvent);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController(text: widget.acedemic);
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController(text: widget.industrial);
    _model.textFieldFocusNode4 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: () {
        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
          return (MediaQuery.sizeOf(context).width * 0.72);
        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
          return (MediaQuery.sizeOf(context).width * 0.45);
        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
          return (MediaQuery.sizeOf(context).width * 0.215);
        } else {
          return (MediaQuery.sizeOf(context).width * 0.215);
        }
      }(),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).border,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(valueOrDefault<double>(
          () {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return 8.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return 8.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return 10.0;
            } else {
              return 10.0;
            }
          }(),
          0.0,
        )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.analysis != null && widget.analysis != '')
                    Expanded(
                      child: TextFormField(
                        controller: _model.textController1,
                        focusNode: _model.textFieldFocusNode1,
                        autofocus: true,
                        readOnly: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            'vcy2lhjj' /* Analysis */,
                          ),
                          labelStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                font: FlutterFlowTheme.of(context).bodyLarge,
                                letterSpacing: 0.0,
                              ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                font: FlutterFlowTheme.of(context).labelMedium,
                                letterSpacing: 0.0,
                              ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
                        ),
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              font: FlutterFlowTheme.of(context).titleSmall,
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                        validator: _model.textController1Validator
                            .asValidator(context),
                      ),
                    ),
                  if (widget.analysisBool &&
                      (widget.analysis == null || widget.analysis == ''))
                    Flexible(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '2ajiv7yv' /* - */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: FlutterFlowTheme.of(context).bodyLarge,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.solvent != null && widget.solvent != '')
                    Expanded(
                      child: TextFormField(
                        controller: _model.textController2,
                        focusNode: _model.textFieldFocusNode2,
                        autofocus: true,
                        readOnly: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            '7r05yj0e' /* Solvent/Method */,
                          ),
                          labelStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                font: FlutterFlowTheme.of(context).bodyLarge,
                                letterSpacing: 0.0,
                              ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                font: FlutterFlowTheme.of(context).labelMedium,
                                letterSpacing: 0.0,
                              ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
                        ),
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              font: FlutterFlowTheme.of(context).titleSmall,
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                        validator: _model.textController2Validator
                            .asValidator(context),
                      ),
                    ),
                  if (widget.solventBool &&
                      (widget.solvent == null || widget.solvent == ''))
                    Flexible(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          's1pdapm5' /* - */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: FlutterFlowTheme.of(context).bodyLarge,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                ],
              ),
            ),
            if (loggedIn)
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.acedemicBool &&
                      widget.industrialBool &&
                      (widget.industrial == null ||
                          widget.industrial == '') &&
                      (widget.acedemic == null || widget.acedemic == ''))
                    Text(
                      FFLocalizations.of(context).getText(
                        'un3pv25x' /* Upon Request */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: FlutterFlowTheme.of(context).bodyLarge,
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.acedemic != null && widget.acedemic != '')
                          Expanded(
                            child: TextFormField(
                              controller: _model.textController3,
                              focusNode: _model.textFieldFocusNode3,
                              autofocus: true,
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'kos9lpru' /* Academic Price */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                      letterSpacing: 0.0,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 0.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).titleSmall,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model.textController3Validator
                                  .asValidator(context),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.industrial != null &&
                            widget.industrial != '')
                          Expanded(
                            child: TextFormField(
                              controller: _model.textController4,
                              focusNode: _model.textFieldFocusNode4,
                              autofocus: true,
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  '10yxe1ox' /* Industrial Price */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                      letterSpacing: 0.0,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 0.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).titleSmall,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model.textController4Validator
                                  .asValidator(context),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            if (!loggedIn)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.info_outlined,
                      color: FlutterFlowTheme.of(context).error,
                      size: 24.0,
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '3nu8tiji' /* Please login first to check pr... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: FlutterFlowTheme.of(context).bodyMedium,
                                color: FlutterFlowTheme.of(context).error,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (widget.otherBool)
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).line,
              ),
            if (widget.other != null && widget.other != '')
              Text(
                widget.other!,
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      font: FlutterFlowTheme.of(context).bodySmall,
                      letterSpacing: 0.0,
                    ),
              ),
            if (widget.otherBool &&
                (widget.other == null || widget.other == ''))
              Text(
                FFLocalizations.of(context).getText(
                  'zs00z61r' /* - */,
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      font: FlutterFlowTheme.of(context).bodySmall,
                      letterSpacing: 0.0,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
