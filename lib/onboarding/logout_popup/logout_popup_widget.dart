import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'logout_popup_model.dart';
export 'logout_popup_model.dart';

class LogoutPopupWidget extends StatefulWidget {
  const LogoutPopupWidget({super.key});

  @override
  State<LogoutPopupWidget> createState() => _LogoutPopupWidgetState();
}

class _LogoutPopupWidgetState extends State<LogoutPopupWidget> {
  late LogoutPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoutPopupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(valueOrDefault<double>(
        MediaQuery.sizeOf(context).width < kBreakpointSmall ? 20.0 : 0.0,
        0.0,
      )),
      child: Container(
        width: 500.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 14.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(valueOrDefault<double>(
            () {
              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                return 20.0;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                return 30.0;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                return 40.0;
              } else {
                return 40.0;
              }
            }(),
            40.0,
          )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'hhq5pi42' /* Are you sure you want to logou... */,
                    ),
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          font: FlutterFlowTheme.of(context).titleMedium,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('LOGOUT_POPUP_COMP_buttonYes_ON_TAP');
                        logFirebaseEvent('buttonYes_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              content: Text('Logout successful!'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                        logFirebaseEvent('buttonYes_auth');
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        logFirebaseEvent('buttonYes_update_app_state');
                        FFAppState().deleteUserProfileData();
                        FFAppState().userProfileData = UserProfileDataStruct();

                        safeSetState(() {});
                        logFirebaseEvent('buttonYes_navigate_to');

                        context.pushNamedAuth(
                            HomeWidget.routeName, context.mounted);
                      },
                      text: FFLocalizations.of(context).getText(
                        'e14z67yv' /* Yes */,
                      ),
                      options: FFButtonOptions(
                        width: valueOrDefault<double>(
                          () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return 80.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return 100.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return 120.0;
                            } else {
                              return 120.0;
                            }
                          }(),
                          120.0,
                        ),
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: FlutterFlowTheme.of(context).titleSmall,
                                  letterSpacing: 0.0,
                                ),
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).border,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('LOGOUT_POPUP_COMP_buttonNo_ON_TAP');
                        logFirebaseEvent('buttonNo_close_dialog_drawer_etc');
                        Navigator.pop(context);
                      },
                      text: FFLocalizations.of(context).getText(
                        '1jw9mn2r' /* No */,
                      ),
                      options: FFButtonOptions(
                        width: valueOrDefault<double>(
                          () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return 80.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return 100.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return 120.0;
                            } else {
                              return 120.0;
                            }
                          }(),
                          120.0,
                        ),
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              font: FlutterFlowTheme.of(context).titleSmall,
                              color: FlutterFlowTheme.of(context).buttonText,
                              letterSpacing: 0.0,
                            ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
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
