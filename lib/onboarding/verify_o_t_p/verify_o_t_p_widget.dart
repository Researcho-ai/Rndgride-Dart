import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/components/profile_details_1/profile_details1_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'verify_o_t_p_model.dart';
export 'verify_o_t_p_model.dart';

class VerifyOTPWidget extends StatefulWidget {
  const VerifyOTPWidget({
    super.key,
    this.phoneNumber,
    this.session,
  });

  final String? phoneNumber;
  final String? session;

  @override
  State<VerifyOTPWidget> createState() => _VerifyOTPWidgetState();
}

class _VerifyOTPWidgetState extends State<VerifyOTPWidget> {
  late VerifyOTPModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyOTPModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VERIFY_O_T_P_VerifyOTP_ON_INIT_STATE');
      logFirebaseEvent('VerifyOTP_timer');
      _model.timerController.onStartTimer();
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.pinCodeFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 600.0,
          maxHeight: 500.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).border,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      0.0,
                      0.0,
                      valueOrDefault<double>(
                        () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return true;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return true;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return false;
                                  } else {
                                    return false;
                                  }
                                }() &&
                                (isWeb
                                    ? MediaQuery.viewInsetsOf(context).bottom >
                                        0
                                    : _isKeyboardVisible)
                            ? 14.0
                            : 16.0,
                        0.0,
                      )),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/OTP.png',
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      0.0,
                      0.0,
                      valueOrDefault<double>(
                        () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return true;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return true;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return false;
                                  } else {
                                    return false;
                                  }
                                }() &&
                                (isWeb
                                    ? MediaQuery.viewInsetsOf(context).bottom >
                                        0
                                    : _isKeyboardVisible)
                            ? 8.0
                            : 12.0,
                        0.0,
                      )),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '4t6kpu9m' /* OTP Verification */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          font: FlutterFlowTheme.of(context).headlineSmall,
                          letterSpacing: 1.0,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    0.0,
                    0.0,
                    valueOrDefault<double>(
                      () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return true;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return true;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return false;
                                } else {
                                  return false;
                                }
                              }() &&
                              (isWeb
                                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                                  : _isKeyboardVisible)
                          ? 18.0
                          : 32.0,
                      0.0,
                    )),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'hfal5oe8' /* Please enter the code send to ... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: FlutterFlowTheme.of(context).bodyLarge,
                              letterSpacing: 1.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              PinCodeTextField(
                autoDisposeControllers: false,
                appContext: context,
                length: 6,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: FlutterFlowTheme.of(context).titleSmall,
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                enableActiveFill: false,
                autoFocus: true,
                focusNode: _model.pinCodeFocusNode,
                enablePinAutofill: true,
                errorTextSpace: 1.0,
                showCursor: true,
                cursorColor: FlutterFlowTheme.of(context).primary,
                obscureText: false,
                hintCharacter: '-',
                keyboardType: TextInputType.visiblePassword,
                pinTheme: PinTheme(
                  fieldHeight: 48.0,
                  fieldWidth: 48.0,
                  borderWidth: 2.0,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4.0),
                    bottomRight: Radius.circular(4.0),
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                  shape: PinCodeFieldShape.underline,
                  activeColor: FlutterFlowTheme.of(context).primary,
                  inactiveColor: FlutterFlowTheme.of(context).border,
                  selectedColor: FlutterFlowTheme.of(context).primaryText,
                ),
                controller: _model.pinCodeController,
                onChanged: (_) {},
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:
                    _model.pinCodeControllerValidator.asValidator(context),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (_model.timerMilliseconds == 00)
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'VERIFY_O_T_P_COMP_Text_s8rly6pw_ON_TAP');
                            if (_model.timerMilliseconds == 00) {
                              logFirebaseEvent('Text_timer');
                              _model.timerController.timer
                                  .setPresetTime(mSec: 60000, add: false);
                              _model.timerController.onResetTimer();

                              logFirebaseEvent('Text_timer');
                              _model.timerController.onStartTimer();
                            } else {
                              logFirebaseEvent('Text_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text(
                                        'Please wait ${functions.miliSecoundTosecound(_model.timerMilliseconds)} Secound !'),
                                    content: Text('Then Resend  Otp'),
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
                            }
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ghvtuuiy' /* Resend */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  font: FlutterFlowTheme.of(context).bodySmall,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      if (_model.timerMilliseconds != 00)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 6.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '2n0m8phc' /* Resend OTP in */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            FlutterFlowTimer(
                              initialTime: _model.timerInitialTimeMs,
                              getDisplayTime: (value) =>
                                  StopWatchTimer.getDisplayTime(
                                value,
                                hours: false,
                                milliSecond: false,
                              ),
                              controller: _model.timerController,
                              updateStateInterval: Duration(milliseconds: 1000),
                              onChanged: (value, displayTime, shouldUpdate) {
                                _model.timerMilliseconds = value;
                                _model.timerValue = displayTime;
                                if (shouldUpdate) safeSetState(() {});
                              },
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Builder(
                  builder: (context) => Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        valueOrDefault<double>(
                          () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return true;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return true;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return false;
                                    } else {
                                      return false;
                                    }
                                  }() &&
                                  (isWeb
                                      ? MediaQuery.viewInsetsOf(context)
                                              .bottom >
                                          0
                                      : _isKeyboardVisible)
                              ? 18.0
                              : 24.0,
                          0.0,
                        ),
                        0.0,
                        0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'VERIFY_O_T_P_COMP_CONTINUE_BTN_ON_TAP');
                        if (_model.pinCodeController!.text != '') {
                          logFirebaseEvent('Button_backend_call');
                          _model.apiResulte19 =
                              await AuthenticatonGroup.verifyOtpCall.call(
                            phoneNumber: widget.phoneNumber,
                            otp: _model.pinCodeController!.text,
                            session: widget.session,
                          );

                          if ((_model.apiResulte19?.succeeded ?? true)) {
                            logFirebaseEvent('Button_auth');
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signIn(
                              authenticationToken:
                                  AuthenticatonGroup.verifyOtpCall.jWTtoken(
                                (_model.apiResulte19?.jsonBody ?? ''),
                              ),
                              refreshToken:
                                  AuthenticatonGroup.verifyOtpCall.refreshToken(
                                (_model.apiResulte19?.jsonBody ?? ''),
                              ),
                              authUid: AuthenticatonGroup.verifyOtpCall.uid(
                                (_model.apiResulte19?.jsonBody ?? ''),
                              ),
                              userData: UserProfileDataStruct(
                                uid: AuthenticatonGroup.verifyOtpCall.uid(
                                  (_model.apiResulte19?.jsonBody ?? ''),
                                ),
                                displayName: AuthenticatonGroup.verifyOtpCall
                                    .displayName(
                                  (_model.apiResulte19?.jsonBody ?? ''),
                                ),
                                userAffiliation: AuthenticatonGroup
                                    .verifyOtpCall
                                    .affiliation(
                                  (_model.apiResulte19?.jsonBody ?? ''),
                                ),
                                userResearchField: AuthenticatonGroup
                                    .verifyOtpCall
                                    .researchField(
                                  (_model.apiResulte19?.jsonBody ?? ''),
                                ),
                                userType:
                                    AuthenticatonGroup.verifyOtpCall.usertype(
                                  (_model.apiResulte19?.jsonBody ?? ''),
                                ),
                                phoneNumber: AuthenticatonGroup.verifyOtpCall
                                    .phoneNumber(
                                  (_model.apiResulte19?.jsonBody ?? ''),
                                ),
                              ),
                            );
                            logFirebaseEvent('Button_update_app_state');
                            FFAppState().userProfileData =
                                UserProfileDataStruct(
                              uid: AuthenticatonGroup.verifyOtpCall.uid(
                                (_model.apiResulte19?.jsonBody ?? ''),
                              ),
                              displayName:
                                  AuthenticatonGroup.verifyOtpCall.displayName(
                                (_model.apiResulte19?.jsonBody ?? ''),
                              ),
                              userAffiliation:
                                  AuthenticatonGroup.verifyOtpCall.affiliation(
                                (_model.apiResulte19?.jsonBody ?? ''),
                              ),
                              userResearchField: AuthenticatonGroup
                                  .verifyOtpCall
                                  .researchField(
                                (_model.apiResulte19?.jsonBody ?? ''),
                              ),
                              userType:
                                  AuthenticatonGroup.verifyOtpCall.usertype(
                                (_model.apiResulte19?.jsonBody ?? ''),
                              ),
                              phoneNumber:
                                  AuthenticatonGroup.verifyOtpCall.phoneNumber(
                                (_model.apiResulte19?.jsonBody ?? ''),
                              ),
                            );
                            safeSetState(() {});
                            if (loggedIn) {
                              if (!AuthenticatonGroup.verifyOtpCall.isNewUser(
                                (_model.apiResulte19?.jsonBody ?? ''),
                              )!) {
                                logFirebaseEvent('Button_navigate_to');

                                context.goNamedAuth(
                                    HomeWidget.routeName, context.mounted);
                              } else {
                                if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall
                                    ? true
                                    : false) {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.9,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          child: ProfileDetails1Widget(
                                            pageName: 'profilePage',
                                            isProfilePge: false,
                                            isNewUser: AuthenticatonGroup
                                                .verifyOtpCall
                                                .isNewUser(
                                              (_model.apiResulte19?.jsonBody ??
                                                  ''),
                                            ),
                                            phoneNumber: widget.phoneNumber,
                                            actionCall: () async {
                                              logFirebaseEvent('_navigate_to');

                                              context.pushNamed(
                                                  HomeWidget.routeName);
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.7,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.45,
                                          child: ProfileDetails1Widget(
                                            pageName: 'profilePage',
                                            isProfilePge: false,
                                            isNewUser: AuthenticatonGroup
                                                .verifyOtpCall
                                                .isNewUser(
                                              (_model.apiResulte19?.jsonBody ??
                                                  ''),
                                            ),
                                            phoneNumber: widget.phoneNumber,
                                            actionCall: () async {
                                              logFirebaseEvent('_navigate_to');

                                              context.pushNamed(
                                                  HomeWidget.routeName);
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              }
                            } else {
                              logFirebaseEvent('Button_navigate_back');
                              context.safePop();
                            }
                          } else {
                            logFirebaseEvent('Button_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Please retry!'),
                                  content: Text(
                                      (_model.apiResulte19?.exceptionMessage ??
                                          '')),
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
                            logFirebaseEvent('Button_navigate_back');
                            context.safePop();
                          }
                        } else {
                          logFirebaseEvent('Button_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: Text(
                                    'Please enter otp first for verification!'),
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
                        }

                        safeSetState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'tqgnkdrd' /* Continue */,
                      ),
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 0.1,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              font: FlutterFlowTheme.of(context).titleMedium,
                              color: FlutterFlowTheme.of(context).buttonText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
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
