import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'personal_profile_details_model.dart';
export 'personal_profile_details_model.dart';

class PersonalProfileDetailsWidget extends StatefulWidget {
  const PersonalProfileDetailsWidget({
    super.key,
    this.actionCall,
    bool? isProfilePge,
    bool? isNewUser,
    bool? isLogin,
  })  : this.isProfilePge = isProfilePge ?? false,
        this.isNewUser = isNewUser ?? false,
        this.isLogin = isLogin ?? false;

  final Future Function(String? name, String? userType)? actionCall;
  final bool isProfilePge;
  final bool isNewUser;
  final bool isLogin;

  @override
  State<PersonalProfileDetailsWidget> createState() =>
      _PersonalProfileDetailsWidgetState();
}

class _PersonalProfileDetailsWidgetState
    extends State<PersonalProfileDetailsWidget> {
  late PersonalProfileDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalProfileDetailsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PERSONAL_PROFILE_DETAILS_PersonalProfile');
      logFirebaseEvent('PersonalProfileDetails_backend_call');
      _model.apiResultas3 = await UsersGroup.getUserTyCall.call();

      if ((_model.apiResultas3?.succeeded ?? true)) {
        logFirebaseEvent('PersonalProfileDetails_update_component_');
        _model.userTypeList = UsersGroup.getUserTyCall
            .userTypeList(
              (_model.apiResultas3?.jsonBody ?? ''),
            )!
            .toList()
            .cast<String>();
        safeSetState(() {});
      }
    });

    _model.firstNameTextController ??=
        TextEditingController(text: FFAppState().userProfileData.displayName);
    _model.firstNameFocusNode ??= FocusNode();

    _model.researchFieldTextController ??= TextEditingController(
        text: FFAppState().userProfileData.userResearchField);
    _model.researchFieldFocusNode ??= FocusNode();

    _model.affiliationTextController ??= TextEditingController(
        text: FFAppState().userProfileData.userAffiliation);
    _model.affiliationFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  valueOrDefault<double>(
                    () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return 16.0;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return 24.0;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return 50.0;
                      } else {
                        return 50.0;
                      }
                    }(),
                    50.0,
                  ),
                  30.0,
                  valueOrDefault<double>(
                    () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return 16.0;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return 24.0;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return 50.0;
                      } else {
                        return 50.0;
                      }
                    }(),
                    50.0,
                  ),
                  0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (widget.isProfilePge)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.96, -0.96),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 40.0,
                              borderWidth: 1.0,
                              buttonSize: 48.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                FFIcons.kcross,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'PERSONAL_PROFILE_DETAILS_cross_ICN_ON_TA');
                                logFirebaseEvent(
                                    'IconButton_close_dialog_drawer_etc');
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Profile.png',
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            't0mn0axl' /* Personal details */,
                          ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                font:
                                    FlutterFlowTheme.of(context).headlineSmall,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.isLogin)
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'uu6ypjon' /* Complete profile for better ex... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                font: FlutterFlowTheme.of(context).bodyLarge,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ),
                  Form(
                    key: _model.formKey2,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.firstNameTextController,
                            focusNode: _model.firstNameFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                '4nzlh2t5' /* Name * */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
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
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: FlutterFlowTheme.of(context).bodyMedium,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            validator: _model.firstNameTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller:
                                _model.userTypeDrpodownValueController ??=
                                    FormFieldController<String>(
                              _model.userTypeDrpodownValue ??=
                                  FFAppState().userProfileData.userType,
                            ),
                            options: _model.userTypeList,
                            onChanged: (val) async {
                              safeSetState(
                                  () => _model.userTypeDrpodownValue = val);
                              logFirebaseEvent(
                                  'PERSONAL_PROFILE_DETAILS_UserTypeDrpodow');
                            },
                            height: 48.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: FlutterFlowTheme.of(context).bodyMedium,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'jixa1zdm' /* Select user type */,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 0.0,
                            borderColor: Colors.transparent,
                            borderWidth: 1.0,
                            borderRadius: 0.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            isOverButton: true,
                            isSearchable: false,
                            isMultiSelect: false,
                            labelText: '',
                            labelTextStyle: FlutterFlowTheme.of(context)
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
                  Form(
                    key: _model.formKey1,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!widget.isProfilePge)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.researchFieldTextController,
                              focusNode: _model.researchFieldFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'ak98s0sz' /* Research Field * */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).border,
                                    width: 0.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 0.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 0.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 0.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model
                                  .researchFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        if (!widget.isProfilePge)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.affiliationTextController,
                              focusNode: _model.affiliationFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'b1yrjlsm' /* Affiliation * */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).border,
                                    width: 0.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 0.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 0.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 0.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model
                                  .affiliationTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 50.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'PERSONAL_PROFILE_DETAILS_SAVE_BTN_ON_TAP');
                            var _shouldSetState = false;
                            if (widget.isProfilePge) {
                              logFirebaseEvent('Button_validate_form');
                              if (_model.formKey2.currentState == null ||
                                  !_model.formKey2.currentState!.validate()) {
                                return;
                              }
                            } else {
                              await Future.wait([
                                Future(() async {
                                  logFirebaseEvent('Button_validate_form');
                                  if (_model.formKey2.currentState == null ||
                                      !_model.formKey2.currentState!
                                          .validate()) {
                                    return;
                                  }
                                }),
                                Future(() async {
                                  logFirebaseEvent('Button_validate_form');
                                  if (_model.formKey1.currentState == null ||
                                      !_model.formKey1.currentState!
                                          .validate()) {
                                    return;
                                  }
                                }),
                              ]);
                            }

                            if (_model.userTypeDrpodownValue != null &&
                                _model.userTypeDrpodownValue != '') {
                              if (!widget.isProfilePge) {
                                logFirebaseEvent('Button_backend_call');
                                _model.updatedUserData = await UsersGroup
                                    .updateUserProfileAtAuthCall
                                    .call(
                                  userId: currentUserData?.uid,
                                  displayName:
                                      _model.firstNameTextController.text,
                                  userType: _model.userTypeDrpodownValue,
                                  userAffiliation:
                                      _model.affiliationTextController.text,
                                  userResearchField:
                                      _model.researchFieldTextController.text,
                                );

                                _shouldSetState = true;
                                if ((_model.updatedUserData?.succeeded ??
                                    true)) {
                                  logFirebaseEvent('Button_execute_callback');
                                  await widget.actionCall?.call(
                                    _model.firstNameTextController.text,
                                    _model.userTypeDrpodownValue,
                                  );
                                  logFirebaseEvent('Button_update_app_state');

                                  FFAppState().update(() {});
                                } else {
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              } else {
                                logFirebaseEvent('Button_backend_call');
                                _model.apiResult3ms = await UsersGroup
                                    .updateUserProfileStepOneCall
                                    .call(
                                  userID: currentUserData?.uid,
                                  displayName:
                                      _model.firstNameTextController.text,
                                  userType: _model.userTypeDrpodownValue,
                                );

                                _shouldSetState = true;
                                if ((_model.apiResult3ms?.succeeded ?? true)) {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: Text(
                                            'Details updated successfully'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  logFirebaseEvent('Button_execute_callback');
                                  await widget.actionCall?.call(
                                    _model.firstNameTextController.text,
                                    _model.userTypeDrpodownValue,
                                  );
                                  logFirebaseEvent('Button_update_app_state');

                                  FFAppState().update(() {});
                                } else {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: Text(getJsonField(
                                          (_model.apiResult3ms?.jsonBody ?? ''),
                                          r'''$.message''',
                                        ).toString()),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }
                            } else {
                              logFirebaseEvent('Button_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content: Text('Please select user type!'),
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
                              if (_shouldSetState) safeSetState(() {});
                              return;
                            }

                            if (_shouldSetState) safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '3cotx2h8' /* Save */,
                          ),
                          options: FFButtonOptions(
                            width: 160.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  font: FlutterFlowTheme.of(context).labelLarge,
                                  color:
                                      FlutterFlowTheme.of(context).buttonText,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
