import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/nav_bars/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/nav_bars/drawer/drawer_widget.dart';
import '/nav_bars/top_nav_bar/top_nav_bar_widget.dart';
import '/resources/components/data_not_found_c_omponent/data_not_found_c_omponent_widget.dart';
import '/resources/components/instrument_properties/instrument_properties_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lab_options_model.dart';
export 'lab_options_model.dart';

class LabOptionsWidget extends StatefulWidget {
  const LabOptionsWidget({
    super.key,
    this.instrumentTestName,
    this.id,
  });

  final String? instrumentTestName;
  final String? id;

  static String routeName = 'LabOptions';
  static String routePath = 'lab-options';

  @override
  State<LabOptionsWidget> createState() => _LabOptionsWidgetState();
}

class _LabOptionsWidgetState extends State<LabOptionsWidget> {
  late LabOptionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LabOptionsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LabOptions'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LAB_OPTIONS_LabOptions_ON_INIT_STATE');
      await Future.wait([
        Future(() async {
          logFirebaseEvent('LabOptions_backend_call');
          _model.apiResulty2t = await LabsGroup.fetchLabOptionsCall.call(
            instrumentTestListRef: widget.id,
          );

          if ((_model.apiResulty2t?.succeeded ?? true)) {
            logFirebaseEvent('LabOptions_update_page_state');
            _model.instrumenetPropertiesList =
                LabsGroup.fetchLabOptionsCall.instrumentList(
              (_model.apiResulty2t?.jsonBody ?? ''),
            );
            safeSetState(() {});
          }
        }),
        Future(() async {
          logFirebaseEvent('LabOptions_backend_call');
          _model.pageList = await LabsGroup.labOptionPageListCall.call(
            instrumentTestListRef: widget.id,
          );

          if ((_model.pageList?.succeeded ?? true)) {
            logFirebaseEvent('LabOptions_update_page_state');
            _model.analysisNamesList = LabsGroup.labOptionPageListCall
                .analysisList(
                  (_model.pageList?.jsonBody ?? ''),
                )!
                .toList()
                .cast<String>();
            _model.solventMethodList = LabsGroup.labOptionPageListCall
                .soventList(
                  (_model.pageList?.jsonBody ?? ''),
                )!
                .toList()
                .cast<String>();
            _model.citiesNameList = LabsGroup.labOptionPageListCall
                .citiesList(
                  (_model.pageList?.jsonBody ?? ''),
                )!
                .toList()
                .cast<String>();
            safeSetState(() {});
          }
        }),
      ]);
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.switchValue = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Labs',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            endDrawer: Drawer(
              elevation: 16.0,
              child: wrapWithModel(
                model: _model.drawerModel,
                updateCallback: () => safeSetState(() {}),
                child: DrawerWidget(),
              ),
            ),
            appBar: responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor: Color(0xFF4568DC),
                    automaticallyImplyLeading: false,
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'LAB_OPTIONS_arrow_back_rounded_ICN_ON_TA');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'k1i3imvi' /* Choose Lab */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).buttonText,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    actions: [],
                    centerTitle: false,
                    elevation: 0.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                ))
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            60.0, 0.0, 60.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.topNavBarModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: TopNavBarWidget(
                                            instrument: false,
                                            about: false,
                                            contactus: false,
                                            tests: false,
                                            labs: false,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                Container(
                                  width: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return (MediaQuery.sizeOf(context).width *
                                          0.9);
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return (MediaQuery.sizeOf(context).width *
                                          0.9);
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return (MediaQuery.sizeOf(context).width *
                                          0.7);
                                    } else {
                                      return (MediaQuery.sizeOf(context).width *
                                          0.7);
                                    }
                                  }(),
                                  decoration: BoxDecoration(),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 50.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                icon: Icon(
                                                  FFIcons.karrowLeft,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'LAB_OPTIONS_PAGE_arrowLeft_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_navigate_back');
                                                  context.safePop();
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              0.0,
                                                              valueOrDefault<
                                                                  double>(
                                                                () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 10.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 12.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 16.0;
                                                                  } else {
                                                                    return 16.0;
                                                                  }
                                                                }(),
                                                                16.0,
                                                              ),
                                                              0.0,
                                                              valueOrDefault<
                                                                  double>(
                                                                () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 10.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 12.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 16.0;
                                                                  } else {
                                                                    return 16.0;
                                                                  }
                                                                }(),
                                                                16.0,
                                                              )),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  12.0,
                                                                  16.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Flexible(
                                                            child:
                                                                SelectionArea(
                                                                    child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                widget
                                                                    .instrumentTestName,
                                                                'default',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
                                                                  ),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 24.0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (_model.analysisNamesList
                                                      .isNotEmpty)
                                                    Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        minHeight:
                                                            valueOrDefault<
                                                                double>(
                                                          () {
                                                            if (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                kBreakpointSmall) {
                                                              return 45.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointMedium) {
                                                              return 45.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointLarge) {
                                                              return 50.0;
                                                            } else {
                                                              return 50.0;
                                                            }
                                                          }(),
                                                          50.0,
                                                        ),
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .analysisValueController ??=
                                                            FormFieldController<
                                                                String>(null),
                                                        options: _model
                                                            .analysisNamesList,
                                                        onChanged: (val) async {
                                                          safeSetState(() =>
                                                              _model.analysisValue =
                                                                  val);
                                                          logFirebaseEvent(
                                                              'LAB_OPTIONS_Analysis_ON_FORM_WIDGET_SELE');
                                                          logFirebaseEvent(
                                                              'Analysis_update_page_state');
                                                          _model.instrumenetPropertiesList =
                                                              null;
                                                          _model.analysisName =
                                                              _model
                                                                  .analysisValue;
                                                          safeSetState(() {});
                                                          logFirebaseEvent(
                                                              'Analysis_backend_call');
                                                          _model.apiResultfwx =
                                                              await LabsGroup
                                                                  .filterLabOptionsCall
                                                                  .call(
                                                            instrumentTestListRef:
                                                                widget.id,
                                                            visitPerson:
                                                                _model.inperson,
                                                            duration: _model
                                                                .resultDurationDropdownValue,
                                                            phoneNumber:
                                                                '95120227565',
                                                            analysisName: _model
                                                                .analysisValue,
                                                            solventMethodName:
                                                                _model
                                                                    .solventValue,
                                                            citiesRef: _model
                                                                .citieszDropdownValue,
                                                          );

                                                          if ((_model
                                                                  .apiResultfwx
                                                                  ?.succeeded ??
                                                              true)) {
                                                            logFirebaseEvent(
                                                                'Analysis_update_page_state');
                                                            _model.instrumenetPropertiesList =
                                                                LabsGroup
                                                                    .filterLabOptionsCall
                                                                    .instrument(
                                                              (_model.apiResultfwx
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                            _model.analysisbool =
                                                                true;
                                                            _model.emptyResponce =
                                                                LabsGroup
                                                                    .filterLabOptionsCall
                                                                    .emptyResponce(
                                                              (_model.apiResultfwx
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!;
                                                            safeSetState(() {});
                                                          }
                                                          logFirebaseEvent(
                                                              'Analysis_update_app_state');

                                                          safeSetState(() {});

                                                          safeSetState(() {});
                                                        },
                                                        width: 140.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  fontSize:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 9.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 11.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 14.0;
                                                                      } else {
                                                                        return 14.0;
                                                                      }
                                                                    }(),
                                                                    14.0,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
                                                                ),
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'l7h7oysn' /* Analysis */,
                                                        ),
                                                        icon: Icon(
                                                          FFIcons.karrowDown,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .border,
                                                        borderWidth: 1.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        isOverButton: false,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      ),
                                                    ),
                                                  if (_model.solventMethodList
                                                      .isNotEmpty)
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .solventValueController ??=
                                                              FormFieldController<
                                                                  String>(null),
                                                          options: _model
                                                              .solventMethodList,
                                                          onChanged:
                                                              (val) async {
                                                            safeSetState(() =>
                                                                _model.solventValue =
                                                                    val);
                                                            logFirebaseEvent(
                                                                'LAB_OPTIONS_Solvent_ON_FORM_WIDGET_SELEC');
                                                            logFirebaseEvent(
                                                                'Solvent_update_page_state');
                                                            _model.instrumenetPropertiesList =
                                                                null;
                                                            _model.solventname =
                                                                _model
                                                                    .solventValue;
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'Solvent_backend_call');
                                                            _model.apiResultSolvent =
                                                                await LabsGroup
                                                                    .filterLabOptionsCall
                                                                    .call(
                                                              instrumentTestListRef:
                                                                  widget.id,
                                                              visitPerson:
                                                                  _model
                                                                      .inperson,
                                                              duration: _model
                                                                  .duration,
                                                              phoneNumber:
                                                                  '95120227565',
                                                              analysisName: _model
                                                                  .analysisName,
                                                              solventMethodName:
                                                                  _model
                                                                      .solventname,
                                                              citiesRef: _model
                                                                  .cityName,
                                                            );

                                                            if ((_model
                                                                    .apiResultSolvent
                                                                    ?.succeeded ??
                                                                true)) {
                                                              logFirebaseEvent(
                                                                  'Solvent_update_page_state');
                                                              _model.instrumenetPropertiesList =
                                                                  LabsGroup
                                                                      .filterLabOptionsCall
                                                                      .instrument(
                                                                (_model.apiResultSolvent
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              );
                                                              _model.solventbool =
                                                                  true;
                                                              _model.emptyResponce =
                                                                  LabsGroup
                                                                      .filterLabOptionsCall
                                                                      .emptyResponce(
                                                                (_model.apiResultSolvent
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                            logFirebaseEvent(
                                                                'Solvent_update_app_state');

                                                            safeSetState(() {});

                                                            safeSetState(() {});
                                                          },
                                                          width: () {
                                                            if (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                kBreakpointSmall) {
                                                              return 150.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointMedium) {
                                                              return 180.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointLarge) {
                                                              return 180.0;
                                                            } else {
                                                              return 180.0;
                                                            }
                                                          }(),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    fontSize:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 9.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 11.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 14.0;
                                                                        } else {
                                                                          return 14.0;
                                                                        }
                                                                      }(),
                                                                      14.0,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodySmallFamily),
                                                                  ),
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'cecf8jzz' /* Solvent/Method */,
                                                          ),
                                                          icon: Icon(
                                                            FFIcons.karrowDown,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          elevation: 2.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .border,
                                                          borderWidth: 1.0,
                                                          borderRadius: 8.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          hidesUnderline: true,
                                                          isOverButton: true,
                                                          isSearchable: false,
                                                          isMultiSelect: false,
                                                        ),
                                                      ),
                                                    ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .citieszDropdownValueController ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      options: _model
                                                          .citiesNameList
                                                          .sortedList(
                                                              keyOf: (e) => e,
                                                              desc: false),
                                                      onChanged: (val) async {
                                                        safeSetState(() => _model
                                                                .citieszDropdownValue =
                                                            val);
                                                        logFirebaseEvent(
                                                            'LAB_OPTIONS_citieszDropdown_ON_FORM_WIDG');
                                                        logFirebaseEvent(
                                                            'citieszDropdown_update_page_state');
                                                        _model.instrumenetPropertiesList =
                                                            null;
                                                        _model.cityName = _model
                                                            .citieszDropdownValue;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'citieszDropdown_backend_call');
                                                        _model.apiResultCities =
                                                            await LabsGroup
                                                                .filterLabOptionsCall
                                                                .call(
                                                          instrumentTestListRef:
                                                              widget.id,
                                                          visitPerson:
                                                              _model.inperson,
                                                          duration:
                                                              _model.duration,
                                                          phoneNumber:
                                                              '95120227565',
                                                          analysisName: _model
                                                              .analysisName,
                                                          solventMethodName:
                                                              _model
                                                                  .solventname,
                                                          citiesRef:
                                                              _model.cityName,
                                                        );

                                                        if ((_model
                                                                .apiResultCities
                                                                ?.succeeded ??
                                                            true)) {
                                                          logFirebaseEvent(
                                                              'citieszDropdown_update_page_state');
                                                          _model.instrumenetPropertiesList =
                                                              LabsGroup
                                                                  .filterLabOptionsCall
                                                                  .instrument(
                                                            (_model.apiResultCities
                                                                    ?.jsonBody ??
                                                                ''),
                                                          );
                                                          _model.cityBool =
                                                              true;
                                                          _model.emptyResponce =
                                                              LabsGroup
                                                                  .filterLabOptionsCall
                                                                  .emptyResponce(
                                                            (_model.apiResultCities
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!;
                                                          safeSetState(() {});
                                                        }
                                                        logFirebaseEvent(
                                                            'citieszDropdown_update_app_state');

                                                        safeSetState(() {});

                                                        safeSetState(() {});
                                                      },
                                                      width: 150.0,
                                                      searchHintTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily),
                                                              ),
                                                      searchTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'fre9qy1g' /* City */,
                                                      ),
                                                      searchHintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'w9vauynd' /* Search for an item... */,
                                                      ),
                                                      icon: Icon(
                                                        FFIcons.karrowDown,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 15.0,
                                                      ),
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border,
                                                      borderWidth: 1.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isSearchable: true,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .resultDurationDropdownValueController ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      options: [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'xj27s3dy' /* 1 day */,
                                                        ),
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '9z295hz2' /* 2-3 days */,
                                                        ),
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '9aygaytq' /* 4-5 days */,
                                                        ),
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ef2yfvnn' /* 1 week */,
                                                        ),
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'mheylnt6' /* 8-10 days */,
                                                        ),
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'k1eh49e6' /* 10+ days */,
                                                        )
                                                      ],
                                                      onChanged: (val) async {
                                                        safeSetState(() => _model
                                                                .resultDurationDropdownValue =
                                                            val);
                                                        logFirebaseEvent(
                                                            'LAB_OPTIONS_ResultDurationDropdown_ON_FO');
                                                        logFirebaseEvent(
                                                            'ResultDurationDropdown_update_page_state');
                                                        _model.instrumenetPropertiesList =
                                                            null;
                                                        _model.duration = _model
                                                            .resultDurationDropdownValue;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'ResultDurationDropdown_backend_call');
                                                        _model.apiResultSolventDuration =
                                                            await LabsGroup
                                                                .filterLabOptionsCall
                                                                .call(
                                                          instrumentTestListRef:
                                                              widget.id,
                                                          visitPerson:
                                                              _model.inperson,
                                                          duration:
                                                              _model.duration,
                                                          phoneNumber:
                                                              '95120227565',
                                                          analysisName: _model
                                                              .analysisName,
                                                          solventMethodName:
                                                              _model
                                                                  .solventname,
                                                          citiesRef:
                                                              _model.cityName,
                                                        );

                                                        if ((_model
                                                                .apiResultSolventDuration
                                                                ?.succeeded ??
                                                            true)) {
                                                          logFirebaseEvent(
                                                              'ResultDurationDropdown_update_page_state');
                                                          _model.instrumenetPropertiesList =
                                                              LabsGroup
                                                                  .filterLabOptionsCall
                                                                  .instrument(
                                                            (_model.apiResultSolventDuration
                                                                    ?.jsonBody ??
                                                                ''),
                                                          );
                                                          _model.durationResult =
                                                              true;
                                                          _model.emptyResponce =
                                                              LabsGroup
                                                                  .filterLabOptionsCall
                                                                  .emptyResponce(
                                                            (_model.apiResultSolventDuration
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!;
                                                          safeSetState(() {});
                                                        }
                                                        logFirebaseEvent(
                                                            'ResultDurationDropdown_update_app_state');

                                                        safeSetState(() {});

                                                        safeSetState(() {});
                                                      },
                                                      width: 150.0,
                                                      height: valueOrDefault<
                                                          double>(
                                                        () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall) {
                                                            return 45.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium) {
                                                            return 45.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointLarge) {
                                                            return 50.0;
                                                          } else {
                                                            return 50.0;
                                                          }
                                                        }(),
                                                        50.0,
                                                      ),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'ybw98kdt' /* Result Duration */,
                                                      ),
                                                      icon: Icon(
                                                        FFIcons.karrowDown,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 15.0,
                                                      ),
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border,
                                                      borderWidth: 1.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      height: valueOrDefault<
                                                          double>(
                                                        () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall) {
                                                            return 45.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium) {
                                                            return 45.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointLarge) {
                                                            return 50.0;
                                                          } else {
                                                            return 50.0;
                                                          }
                                                        }(),
                                                        50.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    8.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'q59pckak' /* In person */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Switch
                                                                  .adaptive(
                                                                value: _model
                                                                    .switchValue!,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchValue =
                                                                          newValue);
                                                                  if (newValue) {
                                                                    logFirebaseEvent(
                                                                        'LAB_OPTIONS_Switch_ijkdtvma_ON_TOGGLE_ON');
                                                                    logFirebaseEvent(
                                                                        'Switch_update_page_state');
                                                                    _model.instrumenetPropertiesList =
                                                                        null;
                                                                    _model.inperson =
                                                                        true;
                                                                    _model.personVisit =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'Switch_backend_call');
                                                                    _model.apiResultVisitPersonal =
                                                                        await LabsGroup
                                                                            .filterLabOptionsCall
                                                                            .call(
                                                                      instrumentTestListRef:
                                                                          widget
                                                                              .id,
                                                                      visitPerson:
                                                                          _model
                                                                              .inperson,
                                                                      duration:
                                                                          _model
                                                                              .duration,
                                                                      phoneNumber:
                                                                          '95120227565',
                                                                      analysisName:
                                                                          _model
                                                                              .analysisName,
                                                                      solventMethodName:
                                                                          _model
                                                                              .solventname,
                                                                      citiesRef:
                                                                          _model
                                                                              .cityName,
                                                                    );

                                                                    if ((_model
                                                                            .apiResultVisitPersonal
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      logFirebaseEvent(
                                                                          'Switch_update_page_state');
                                                                      _model.instrumenetPropertiesList = LabsGroup
                                                                          .filterLabOptionsCall
                                                                          .instrument(
                                                                        (_model.apiResultVisitPersonal?.jsonBody ??
                                                                            ''),
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                    logFirebaseEvent(
                                                                        'Switch_update_app_state');

                                                                    safeSetState(
                                                                        () {});

                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'LAB_OPTIONS_Switch_ijkdtvma_ON_TOGGLE_OF');
                                                                    logFirebaseEvent(
                                                                        'Switch_update_page_state');
                                                                    _model.instrumenetPropertiesList =
                                                                        null;
                                                                    _model.inperson =
                                                                        null;
                                                                    _model.personVisit =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'Switch_backend_call');
                                                                    _model.apiResultVisitPersonalCopy =
                                                                        await LabsGroup
                                                                            .filterLabOptionsCall
                                                                            .call(
                                                                      instrumentTestListRef:
                                                                          widget
                                                                              .id,
                                                                      visitPerson:
                                                                          _model
                                                                              .inperson,
                                                                      duration:
                                                                          _model
                                                                              .duration,
                                                                      phoneNumber:
                                                                          '95120227565',
                                                                      analysisName:
                                                                          _model
                                                                              .analysisName,
                                                                      solventMethodName:
                                                                          _model
                                                                              .solventname,
                                                                      citiesRef:
                                                                          _model
                                                                              .cityName,
                                                                    );

                                                                    if ((_model
                                                                            .apiResultVisitPersonalCopy
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      logFirebaseEvent(
                                                                          'Switch_update_page_state');
                                                                      _model.instrumenetPropertiesList = LabsGroup
                                                                          .filterLabOptionsCall
                                                                          .instrument(
                                                                        (_model.apiResultVisitPersonalCopy?.jsonBody ??
                                                                            ''),
                                                                      );
                                                                      _model.personVisit =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                    logFirebaseEvent(
                                                                        'Switch_update_app_state');

                                                                    safeSetState(
                                                                        () {});

                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                },
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                activeTrackColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                inactiveTrackColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                inactiveThumbColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if ((_model.analysisbool ==
                                                          true) ||
                                                      (_model.solventbool ==
                                                          true) ||
                                                      (_model.personVisit ==
                                                          true) ||
                                                      (_model.durationResult ==
                                                          true) ||
                                                      _model.cityBool)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'LAB_OPTIONS_PAGE_CLEAR_FILTER_BTN_ON_TAP');
                                                          await Future.wait([
                                                            Future(() async {
                                                              logFirebaseEvent(
                                                                  'Button_reset_form_fields');
                                                              safeSetState(() {
                                                                _model.switchValue =
                                                                    false;
                                                              });
                                                              logFirebaseEvent(
                                                                  'Button_backend_call');
                                                              _model.apiResulty2tResetButton =
                                                                  await LabsGroup
                                                                      .fetchLabOptionsCall
                                                                      .call(
                                                                instrumentTestListRef:
                                                                    widget.id,
                                                              );

                                                              if ((_model
                                                                      .apiResulty2tResetButton
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                logFirebaseEvent(
                                                                    'Button_update_page_state');
                                                                _model.instrumenetPropertiesList =
                                                                    LabsGroup
                                                                        .fetchLabOptionsCall
                                                                        .instrumentList(
                                                                  (_model.apiResulty2tResetButton
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                              logFirebaseEvent(
                                                                  'Button_update_app_state');

                                                              safeSetState(
                                                                  () {});
                                                            }),
                                                            Future(() async {
                                                              logFirebaseEvent(
                                                                  'Button_reset_form_fields');
                                                              safeSetState(() {
                                                                _model
                                                                    .analysisValueController
                                                                    ?.reset();
                                                                _model
                                                                    .solventValueController
                                                                    ?.reset();
                                                                _model
                                                                    .resultDurationDropdownValueController
                                                                    ?.reset();
                                                                _model
                                                                    .citieszDropdownValueController
                                                                    ?.reset();
                                                              });
                                                            }),
                                                          ]);

                                                          safeSetState(() {});
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '1o1lja2l' /* Clear filter */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelMediumFamily),
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (_model.instrumenetPropertiesList !=
                                            null)
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Builder(
                                              builder: (context) {
                                                final instrumentProperties =
                                                    _model.instrumenetPropertiesList
                                                            ?.toList() ??
                                                        [];

                                                return MasonryGridView.builder(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  gridDelegate:
                                                      SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 1;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 2;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 2;
                                                      } else {
                                                        return 2;
                                                      }
                                                    }(),
                                                  ),
                                                  crossAxisSpacing: 20.0,
                                                  mainAxisSpacing: 30.0,
                                                  itemCount:
                                                      instrumentProperties
                                                          .length,
                                                  padding: EdgeInsets.fromLTRB(
                                                    0,
                                                    0,
                                                    0,
                                                    100.0,
                                                  ),
                                                  shrinkWrap: true,
                                                  itemBuilder: (context,
                                                      instrumentPropertiesIndex) {
                                                    final instrumentPropertiesItem =
                                                        instrumentProperties[
                                                            instrumentPropertiesIndex];
                                                    return InstrumentPropertiesWidget(
                                                      key: Key(
                                                          'Keyqjl_${instrumentPropertiesIndex}_of_${instrumentProperties.length}'),
                                                      isShowAnalysis: _model
                                                              .analysisNamesList
                                                              .length >
                                                          0,
                                                      isShowSolvent: _model
                                                              .solventMethodList
                                                              .length >
                                                          0,
                                                      isShowOtherDetail: _model
                                                              .otherDetailList
                                                              .length >
                                                          0,
                                                      instrumentPropertieJson:
                                                          instrumentPropertiesItem,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        if ((_model.instrumenetPropertiesList ==
                                                null) ||
                                            _model.emptyResponce)
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 50.0, 0.0, 0.0),
                                                child: Container(
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .dataNotFoundCOmponentModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        DataNotFoundCOmponentWidget(
                                                      isJobs: false,
                                                      isLoad: (_model
                                                                  .analysisbool ==
                                                              true) ||
                                                          (_model.solventbool ==
                                                              true) ||
                                                          (_model.personVisit ==
                                                              true) ||
                                                          (_model.durationResult ==
                                                              true) ||
                                                          _model.cityBool,
                                                      refresh: (_model
                                                                  .analysisbool ==
                                                              true) ||
                                                          (_model.solventbool ==
                                                              true) ||
                                                          (_model.personVisit ==
                                                              true) ||
                                                          (_model.durationResult ==
                                                              true) ||
                                                          _model.cityBool,
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
                      ),
                    ),
                  ),
                  if (!(isWeb
                          ? MediaQuery.viewInsetsOf(context).bottom > 0
                          : _isKeyboardVisible) &&
                      responsiveVisibility(
                        context: context,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: wrapWithModel(
                        model: _model.bottomNavBarModel,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: Hero(
                          tag: 'NavBar',
                          transitionOnUserGestures: true,
                          child: Material(
                            color: Colors.transparent,
                            child: BottomNavBarWidget(
                              home: false,
                              resources: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
