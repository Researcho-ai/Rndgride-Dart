import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'sign_in_compoent_model.dart';
export 'sign_in_compoent_model.dart';

class SignInCompoentWidget extends StatefulWidget {
  const SignInCompoentWidget({
    super.key,
    bool? loginRequered,
  }) : this.loginRequered = loginRequered ?? false;

  final bool loginRequered;

  @override
  State<SignInCompoentWidget> createState() => _SignInCompoentWidgetState();
}

class _SignInCompoentWidgetState extends State<SignInCompoentWidget> {
  late SignInCompoentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignInCompoentModel());

    _model.phoneNumber2TextController ??= TextEditingController();
    _model.phoneNumber2FocusNode ??= FocusNode();

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(valueOrDefault<double>(
            () {
              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                return 0.0;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                return valueOrDefault<double>(
                  MediaQuery.sizeOf(context).width < kBreakpointLarge
                      ? (widget.loginRequered ? 20.0 : 0.0)
                      : 0.0,
                  0.0,
                );
              } else {
                return 20.0;
              }
            }(),
            0.0,
          )),
          bottomRight: Radius.circular(valueOrDefault<double>(
            () {
              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                return 0.0;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                return valueOrDefault<double>(
                  MediaQuery.sizeOf(context).width < kBreakpointLarge
                      ? (widget.loginRequered ? 20.0 : 0.0)
                      : 0.0,
                  0.0,
                );
              } else {
                return 20.0;
              }
            }(),
            0.0,
          )),
          topLeft: Radius.circular(valueOrDefault<double>(
            widget.loginRequered ? 20.0 : 0.0,
            0.0,
          )),
          topRight: Radius.circular(valueOrDefault<double>(
            widget.loginRequered ? 20.0 : 0.0,
            0.0,
          )),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SvgPicture.asset(
                          'assets/images/Sign_in_4.svg',
                          width: 300.0,
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '5cdmc60c' /* Welcome to RNDgrid.com */,
                      ),
                      style: FlutterFlowTheme.of(context)
                          .headlineSmall
                          .override(
                            font: FlutterFlowTheme.of(context).headlineSmall,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '2w3gbwby' /* Let's get started by entering ... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: FlutterFlowTheme.of(context).bodyLarge,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 24.0),
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: TextFormField(
                        controller: _model.phoneNumber2TextController,
                        focusNode: _model.phoneNumber2FocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            'nhnv08z0' /* Phone Number * */,
                          ),
                          labelStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: FlutterFlowTheme.of(context).bodyMedium,
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                font: FlutterFlowTheme.of(context).bodySmall,
                                color: FlutterFlowTheme.of(context).border,
                                letterSpacing: 0.0,
                              ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).border,
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: FlutterFlowTheme.of(context).bodyLarge,
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                        validator: _model.phoneNumber2TextControllerValidator
                            .asValidator(context),
                        inputFormatters: [_model.phoneNumber2Mask],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'SIGN_IN_COMPOENT_COMP_SUBMIT_BTN_ON_TAP');
                        logFirebaseEvent('Button_backend_call');
                        _model.apiResults4y =
                            await AuthenticatonGroup.sendOtpCall.call(
                          phoneNumber:
                              '+91${_model.phoneNumber2TextController.text}',
                        );

                        if ((_model.apiResults4y?.succeeded ?? true)) {
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed(
                            VerifyOtpWidget.routeName,
                            queryParameters: {
                              'session': serializeParam(
                                AuthenticatonGroup.sendOtpCall.session(
                                  (_model.apiResults4y?.jsonBody ?? ''),
                                ),
                                ParamType.String,
                              ),
                              'number': serializeParam(
                                '+91${_model.phoneNumber2TextController.text}',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          logFirebaseEvent('Button_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title:
                                    Text('There is an error in sending Otp!'),
                                content: Text(
                                    (_model.apiResults4y?.exceptionMessage ??
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
                        }

                        safeSetState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'kr3vj80q' /* Submit */,
                      ),
                      options: FFButtonOptions(
                        width: 120.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .labelLarge
                            .override(
                              font: FlutterFlowTheme.of(context).labelLarge,
                              color: FlutterFlowTheme.of(context).buttonText,
                              letterSpacing: 0.0,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
