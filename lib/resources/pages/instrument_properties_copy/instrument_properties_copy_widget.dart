import '/backend/api_requests/api_calls.dart';
import '/components/analysis_compo_widget.dart';
import '/components/common_dialog_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'instrument_properties_copy_model.dart';
export 'instrument_properties_copy_model.dart';

class InstrumentPropertiesCopyWidget extends StatefulWidget {
  const InstrumentPropertiesCopyWidget({
    super.key,
    bool? isShowAnalysis,
    bool? isShowSolvent,
    bool? isShowOtherDetail,
    this.instrumentPropertieJson,
    this.instrumenetRef,
  })  : this.isShowAnalysis = isShowAnalysis ?? false,
        this.isShowSolvent = isShowSolvent ?? false,
        this.isShowOtherDetail = isShowOtherDetail ?? false;

  final bool isShowAnalysis;
  final bool isShowSolvent;
  final bool isShowOtherDetail;
  final dynamic instrumentPropertieJson;
  final String? instrumenetRef;

  @override
  State<InstrumentPropertiesCopyWidget> createState() =>
      _InstrumentPropertiesCopyWidgetState();
}

class _InstrumentPropertiesCopyWidgetState
    extends State<InstrumentPropertiesCopyWidget> {
  late InstrumentPropertiesCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InstrumentPropertiesCopyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('INSTRUMENT_PROPERTIES_COPY_InstrumentPro');
      logFirebaseEvent('InstrumentPropertiesCopy_backend_call');
      _model.apiResultj0o =
          await InstrumentsTestsGroup.fetchInstrumentTestListCall.call(
        instrumentRef: getJsonField(
          widget.instrumentPropertieJson,
          r'''$._id''',
        ).toString().toString(),
      );

      if ((_model.apiResultj0o?.succeeded ?? true)) {
        logFirebaseEvent('InstrumentPropertiesCopy_update_componen');
        _model.availableInstrumentName =
            InstrumentsTestsGroup.fetchInstrumentTestListCall
                .instrumentTestList(
                  (_model.apiResultj0o?.jsonBody ?? ''),
                )!
                .toList()
                .cast<dynamic>();
        safeSetState(() {});
      }
    });

    _model.requirementTextFieldTextController ??= TextEditingController();
    _model.requirementTextFieldFocusNode ??= FocusNode();

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

    return Padding(
      padding: EdgeInsets.all(2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).border,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).border,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      valueOrDefault<double>(
                        () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 16.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 18.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 24.0;
                          } else {
                            return 24.0;
                          }
                        }(),
                        0.0,
                      ),
                      8.0,
                      valueOrDefault<double>(
                        () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 16.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 18.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 24.0;
                          } else {
                            return 24.0;
                          }
                        }(),
                        0.0,
                      ),
                      8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                          getJsonField(
                            widget.instrumentPropertieJson,
                            r'''$.instrument_name''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelLargeFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelLargeFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    valueOrDefault<double>(
                      () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return 14.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return 20.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return 25.0;
                        } else {
                          return 25.0;
                        }
                      }(),
                      0.0,
                    ),
                    10.0,
                    valueOrDefault<double>(
                      () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return 14.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return 20.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return 25.0;
                        } else {
                          return 25.0;
                        }
                      }(),
                      0.0,
                    ),
                    valueOrDefault<double>(
                      () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return 14.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return 20.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return 25.0;
                        } else {
                          return 25.0;
                        }
                      }(),
                      0.0,
                    )),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 650.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: SelectionArea(
                                  child: Text(
                                getJsonField(
                                  widget.instrumentPropertieJson,
                                  r'''$.instrument_description''',
                                ).toString(),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmallFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                    ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      if (_model.availableInstrumentName.isNotEmpty)
                        Opacity(
                          opacity: 0.3,
                          child: Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).line,
                          ),
                        ),
                      Builder(
                        builder: (context) {
                          final analyssiList =
                              _model.availableInstrumentName.toList();

                          return MasonryGridView.builder(
                            gridDelegate:
                                SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return 2;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return 3;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return 4;
                                } else {
                                  return 4;
                                }
                              }(),
                            ),
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            itemCount: analyssiList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, analyssiListIndex) {
                              final analyssiListItem =
                                  analyssiList[analyssiListIndex];
                              return AnalysisCompoWidget(
                                key: Key(
                                    'Key17p_${analyssiListIndex}_of_${analyssiList.length}'),
                                analysisName: getJsonField(
                                  analyssiListItem,
                                  r'''$.analysis_name''',
                                ).toString(),
                                solvent: getJsonField(
                                  analyssiListItem,
                                  r'''$.solvent_name''',
                                ).toString(),
                                addAction: () async {
                                  logFirebaseEvent(
                                      'INSTRUMENT_PROPERTIES_COPY_Container_17p');
                                  logFirebaseEvent(
                                      'AnalysisCompo_update_component_state');
                                  _model.addToSelectedTests(analyssiListItem);
                                  safeSetState(() {});
                                },
                                rmAction: () async {
                                  logFirebaseEvent(
                                      'INSTRUMENT_PROPERTIES_COPY_Container_17p');
                                  logFirebaseEvent(
                                      'AnalysisCompo_update_component_state');
                                  _model.removeFromSelectedTests(
                                      analyssiListItem);
                                  safeSetState(() {});
                                },
                              );
                            },
                          );
                        },
                      ),
                      Opacity(
                        opacity: 0.3,
                        child: Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).line,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: TextFormField(
                          controller: _model.requirementTextFieldTextController,
                          focusNode: _model.requirementTextFieldFocusNode,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: false,
                            labelText: FFLocalizations.of(context).getText(
                              'nh2jm05y' /* Number of samples */,
                            ),
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodySmallFamily,
                                  color: FlutterFlowTheme.of(context).border,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodySmallFamily),
                                ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).border,
                                width: 2.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
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
                                0.0, 16.0, 16.0, 16.0),
                          ),
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
                          validator: _model
                              .requirementTextFieldTextControllerValidator
                              .asValidator(context),
                          inputFormatters: [_model.requirementTextFieldMask],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.durationDrpodownValueController ??=
                              FormFieldController<String>(null),
                          options: [
                            FFLocalizations.of(context).getText(
                              '6tadkvwo' /* Today */,
                            ),
                            FFLocalizations.of(context).getText(
                              'nb4wwsgq' /* 2-6 days */,
                            ),
                            FFLocalizations.of(context).getText(
                              'zzfnbx1q' /* 7-14 days */,
                            ),
                            FFLocalizations.of(context).getText(
                              'u72e8qyx' /* 15-30 days */,
                            ),
                            FFLocalizations.of(context).getText(
                              'c79002cq' /* Later */,
                            )
                          ],
                          onChanged: (val) => safeSetState(
                              () => _model.durationDrpodownValue = val),
                          height: 48.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                              ),
                          hintText: FFLocalizations.of(context).getText(
                            '9cwnbadk' /* When do you need it? */,
                          ),
                          icon: Icon(
                            FFIcons.karrowDown,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          elevation: 0.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
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
                      Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 24.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'INSTRUMENT_PROPERTIES_COPY_SUBMIT_REQUES');
                              if (_model.availableInstrumentName.isNotEmpty) {
                                if (_model.selectedTests.isNotEmpty) {
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
                                        child: CommonDialogWidget(
                                          instrumentTestName: getJsonField(
                                            widget.instrumentPropertieJson,
                                            r'''$.instrument_name''',
                                          ).toString(),
                                          isBooking: true,
                                          bookingAction: () async {
                                            logFirebaseEvent('_backend_call');
                                            _model.apiResultt50Copy =
                                                await InqueryGroup
                                                    .createBookingCall
                                                    .call(
                                              userID: FFAppState()
                                                  .userProfileData
                                                  .uid,
                                              subType: 'Resource Booking',
                                              instrumentRef: getJsonField(
                                                widget.instrumentPropertieJson,
                                                r'''$._id''',
                                              ).toString(),
                                              testDetailsListJson:
                                                  _model.selectedTests,
                                              sampleQuantity: _model
                                                  .requirementTextFieldTextController
                                                  .text,
                                              neededIn:
                                                  _model.durationDrpodownValue,
                                            );

                                            if ((_model.apiResultt50Copy
                                                    ?.succeeded ??
                                                true)) {
                                              logFirebaseEvent('_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Thank You for Your Request'),
                                                    content: Text(
                                                        'Your request has been submitted successfully. We\'ll get back to you shortl'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              logFirebaseEvent('_navigate_to');

                                              context.pushNamed(
                                                  HomeWidget.routeName);
                                            }
                                          },
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content:
                                            Text('Please select the test!'),
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
                                }
                              }

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'wjikd30r' /* Submit Request */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelLargeFamily,
                                    color:
                                        FlutterFlowTheme.of(context).buttonText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelLargeFamily),
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
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
