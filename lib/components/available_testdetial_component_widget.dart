import '/auth/custom_auth/auth_util.dart';
import '/components/test_properties_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/onboarding/sign_in_compoent/sign_in_compoent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'available_testdetial_component_model.dart';
export 'available_testdetial_component_model.dart';

class AvailableTestdetialComponentWidget extends StatefulWidget {
  const AvailableTestdetialComponentWidget({
    super.key,
    this.fieldName,
    this.materialName,
    this.testName,
    this.methodName,
    bool? isSearchresult,
    this.testObject,
  }) : this.isSearchresult = isSearchresult ?? false;

  final String? fieldName;
  final String? materialName;
  final String? testName;
  final String? methodName;
  final bool isSearchresult;
  final dynamic testObject;

  @override
  State<AvailableTestdetialComponentWidget> createState() =>
      _AvailableTestdetialComponentWidgetState();
}

class _AvailableTestdetialComponentWidgetState
    extends State<AvailableTestdetialComponentWidget> {
  late AvailableTestdetialComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvailableTestdetialComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('AVAILABLE_TESTDETIAL_COMPONENT_Container');
          if (loggedIn) {
            if (widget.isSearchresult) {
              logFirebaseEvent('Container_alert_dialog');
              await showDialog(
                context: context,
                builder: (dialogContext) {
                  return Dialog(
                    elevation: 0,
                    insetPadding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    alignment: AlignmentDirectional(0.0, 0.0)
                        .resolve(Directionality.of(context)),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      child: TestPropertiesComponentWidget(
                        testPropertieJson: widget.testObject,
                        isSearchResult: true,
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            if (() {
              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                return true;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                return true;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                return false;
              } else {
                return false;
              }
            }()) {
              logFirebaseEvent('Container_alert_dialog');
              await showDialog(
                context: context,
                builder: (dialogContext) {
                  return Dialog(
                    elevation: 0,
                    insetPadding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    alignment: AlignmentDirectional(0.0, 0.0)
                        .resolve(Directionality.of(context)),
                    child: Container(
                      height: 400.0,
                      width: 500.0,
                      child: SignInCompoentWidget(
                        loginRequered: true,
                      ),
                    ),
                  );
                },
              );
            } else {
              logFirebaseEvent('Container_alert_dialog');
              await showDialog(
                context: context,
                builder: (dialogContext) {
                  return Dialog(
                    elevation: 0,
                    insetPadding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    alignment: AlignmentDirectional(0.0, 0.0)
                        .resolve(Directionality.of(context)),
                    child: SignInCompoentWidget(
                      loginRequered: true,
                    ),
                  );
                },
              );
            }
          }
        },
        child: Container(
          constraints: BoxConstraints(
            minWidth: 200.0,
            maxWidth: 400.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if ((widget.fieldName != null &&
                              widget.fieldName != '') &&
                          (widget.fieldName != 'null'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 6.0),
                          child: Text(
                            'Field : ${widget.fieldName}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: FlutterFlowTheme.of(context).bodyMedium,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      if ((widget.materialName != null &&
                              widget.materialName != '') &&
                          (widget.materialName != 'null'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 6.0),
                          child: Text(
                            'Material : ${widget.materialName}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: FlutterFlowTheme.of(context).bodyMedium,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      if ((widget.testName != null &&
                              widget.testName != '') &&
                          (widget.testName != '') &&
                          (widget.testName != 'null'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 6.0),
                          child: Text(
                            'Test : ${widget.testName}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: FlutterFlowTheme.of(context).bodyMedium,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      if ((widget.methodName != null &&
                              widget.methodName != '') &&
                          (widget.methodName != '') &&
                          (widget.testName != 'null'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 6.0),
                          child: Text(
                            'Method : ${widget.methodName}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: FlutterFlowTheme.of(context).bodyMedium,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (widget.isSearchresult)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SvgPicture.asset(
                      Theme.of(context).brightness == Brightness.dark
                          ? 'assets/images/Dark_Instrument_Button.svg'
                          : 'assets/images/Dark_Instrument_Button.svg',
                      width: 35.0,
                      height: 35.0,
                      fit: BoxFit.contain,
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
