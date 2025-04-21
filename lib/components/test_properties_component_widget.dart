import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/common_dialog_widget.dart';
import '/components/material_component_widget.dart';
import '/components/test_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'test_properties_component_model.dart';
export 'test_properties_component_model.dart';

class TestPropertiesComponentWidget extends StatefulWidget {
  const TestPropertiesComponentWidget({
    super.key,
    this.testPropertieJson,
  });

  final dynamic testPropertieJson;

  @override
  State<TestPropertiesComponentWidget> createState() =>
      _TestPropertiesComponentWidgetState();
}

class _TestPropertiesComponentWidgetState
    extends State<TestPropertiesComponentWidget> {
  late TestPropertiesComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestPropertiesComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TEST_PROPERTIES_COMPONENT_testProperties');
      logFirebaseEvent('testPropertiesComponent_backend_call');
      _model.apiResultj0o = await TestsGroup.getAvailabeTestPropetiesCall.call(
        fieldRef: getJsonField(
          widget.testPropertieJson,
          r'''$._id''',
        ).toString().toString(),
      );

      if ((_model.apiResultj0o?.succeeded ?? true)) {
        logFirebaseEvent('testPropertiesComponent_update_component');
        _model.finalList = TestsGroup.getAvailabeTestPropetiesCall
            .data(
              (_model.apiResultj0o?.jsonBody ?? ''),
            )!
            .toList()
            .cast<dynamic>();
        _model.testMethodList = TestsGroup.getAvailabeTestPropetiesCall
            .data(
              (_model.apiResultj0o?.jsonBody ?? ''),
            )!
            .toList()
            .cast<dynamic>();
        _model.materialShow = true;
        _model.level = 1;
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
                            widget.testPropertieJson,
                            r'''$.field_name''',
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'TEST_PROPERTIES_COMPONENT_Row_fub8gyf2_O');
                              if (_model.materialShow) {
                                logFirebaseEvent('Row_update_component_state');
                                _model.materialShow = false;
                                safeSetState(() {});
                              } else {
                                logFirebaseEvent('Row_update_component_state');
                                _model.materialShow = true;
                                safeSetState(() {});
                              }
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: SelectionArea(
                                      child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ftkrnxdv' /* Please selet the material  */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                  )),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (!_model.materialShow ||
                                        (_model.level == 1))
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'TEST_PROPERTIES_COMPONENT_Icon_1nud622n_');
                                          logFirebaseEvent(
                                              'Icon_update_component_state');
                                          _model.materialShow = true;
                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_right,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    if (_model.materialShow ||
                                        (_model.level == 1))
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'TEST_PROPERTIES_COMPONENT_Icon_vqb0awb8_');
                                          logFirebaseEvent(
                                              'Icon_update_component_state');
                                          _model.materialShow = false;
                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (_model.finalList.isNotEmpty)
                          Opacity(
                            opacity: 0.3,
                            child: Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).line,
                            ),
                          ),
                        if (_model.materialShow || (_model.level == 1))
                          Builder(
                            builder: (context) {
                              final analyssiList = _model.finalList
                                  .unique((e) => getJsonField(
                                        e,
                                        r'''$.material.material_name''',
                                      ))
                                  .toList();

                              return MasonryGridView.builder(
                                gridDelegate:
                                    SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 2;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 3;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
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
                                  return MaterialComponentWidget(
                                    key: Key(
                                        'Keyo8e_${analyssiListIndex}_of_${analyssiList.length}'),
                                    materialName: getJsonField(
                                      analyssiListItem,
                                      r'''$.material.material_name''',
                                    ).toString(),
                                    level: 1,
                                    currentIndex: analyssiListIndex,
                                    selectedIndex: _model.selectesMaterialIndex,
                                    addAction: () async {
                                      logFirebaseEvent(
                                          'TEST_PROPERTIES_COMPONENT_Container_o8ex');
                                      logFirebaseEvent(
                                          'materialComponent_update_component_state');
                                      _model.selectedMaterial = getJsonField(
                                        analyssiListItem,
                                        r'''$.material.material_name''',
                                      ).toString();
                                      _model.level = 2;
                                      _model.materialShow = false;
                                      _model.testMethodShow = true;
                                      _model.selectesMaterialIndex =
                                          analyssiListIndex;
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'materialComponent_custom_action');
                                      _model.testMethods =
                                          await actions.filterAvailableTests(
                                        getJsonField(
                                          widget.testPropertieJson,
                                          r'''$.field_name''',
                                        ).toString(),
                                        getJsonField(
                                          analyssiListItem,
                                          r'''$.material.material_name''',
                                        ).toString(),
                                        '',
                                        '',
                                        _model.finalList.toList(),
                                      );
                                      if (_model.testMethods != null &&
                                          (_model.testMethods)!.isNotEmpty) {
                                        logFirebaseEvent(
                                            'materialComponent_update_component_state');
                                        _model.testMethodList = _model
                                            .testMethods!
                                            .toList()
                                            .cast<dynamic>();
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                    rmAction: () async {
                                      logFirebaseEvent(
                                          'TEST_PROPERTIES_COMPONENT_Container_o8ex');
                                      logFirebaseEvent(
                                          'materialComponent_update_component_state');
                                      _model.testMethodList = _model.finalList
                                          .toList()
                                          .cast<dynamic>();
                                      _model.testMethodShow = false;
                                      _model.selectedMaterial = null;
                                      _model.selectesMaterialIndex = null;
                                      safeSetState(() {});
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        if (_model.materialShow)
                          Opacity(
                            opacity: 0.3,
                            child: Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).line,
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'TEST_PROPERTIES_COMPONENT_Row_q8s0v568_O');
                              if (_model.testMethodShow) {
                                logFirebaseEvent('Row_update_component_state');
                                _model.testMethodShow = false;
                                safeSetState(() {});
                              } else {
                                logFirebaseEvent('Row_update_component_state');
                                _model.testMethodShow = true;
                                safeSetState(() {});
                              }
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: SelectionArea(
                                      child: Text(
                                    FFLocalizations.of(context).getText(
                                      'xuetjvlp' /* Please selet the Test & Method... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                  )),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (!_model.testMethodShow)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'TEST_PROPERTIES_COMPONENT_Icon_o6ybut3m_');
                                          logFirebaseEvent(
                                              'Icon_update_component_state');
                                          _model.testMethodShow = true;
                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_right,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    if (_model.testMethodShow)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'TEST_PROPERTIES_COMPONENT_Icon_qohinsnh_');
                                          logFirebaseEvent(
                                              'Icon_update_component_state');
                                          _model.testMethodShow = false;
                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: 0.3,
                          child: Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).line,
                          ),
                        ),
                        if (_model.testMethodShow)
                          Builder(
                            builder: (context) {
                              final analyssiList =
                                  _model.testMethodList.toList();

                              return MasonryGridView.builder(
                                gridDelegate:
                                    SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 2;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 3;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
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
                                  return TestComponentWidget(
                                    key: Key(
                                        'Keyhi4_${analyssiListIndex}_of_${analyssiList.length}'),
                                    test: getJsonField(
                                      analyssiListItem,
                                      r'''$.test.test_name''',
                                    ).toString(),
                                    methods: getJsonField(
                                      analyssiListItem,
                                      r'''$.method.method_name''',
                                    ).toString(),
                                    level: 2,
                                    checkboxValue: _model.selectedTestIndexs
                                        .contains(analyssiListIndex),
                                    addAction: () async {
                                      logFirebaseEvent(
                                          'TEST_PROPERTIES_COMPONENT_Container_hi4p');
                                      logFirebaseEvent(
                                          'testComponent_update_component_state');
                                      _model.testMethodShow = false;
                                      _model.selectedTest = getJsonField(
                                        analyssiListItem,
                                        r'''$.test.test_name''',
                                      ).toString();
                                      _model.selectedMethod = getJsonField(
                                        analyssiListItem,
                                        r'''$.method.method_name''',
                                      ).toString();
                                      _model.level = 3;
                                      _model.addToSelectedtestList(
                                          analyssiListItem);
                                      _model.addToSelectedTestIndexs(
                                          analyssiListIndex);
                                      safeSetState(() {});
                                    },
                                    rmAction: () async {
                                      logFirebaseEvent(
                                          'TEST_PROPERTIES_COMPONENT_Container_hi4p');
                                      logFirebaseEvent(
                                          'testComponent_update_component_state');
                                      _model.selectedTest = null;
                                      _model.selectedMethod = null;
                                      _model.level = 3;
                                      _model.removeFromSelectedtestList(
                                          analyssiListItem);
                                      _model
                                          .removeAtIndexFromSelectedTestIndexs(
                                              analyssiListIndex);
                                      safeSetState(() {});
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        if (_model.testMethodShow)
                          Opacity(
                            opacity: 0.3,
                            child: Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).line,
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final selectedList =
                                  _model.selectedtestList.toList();

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(selectedList.length,
                                      (selectedListIndex) {
                                    final selectedListItem =
                                        selectedList[selectedListIndex];
                                    return Visibility(
                                      visible: (_model.selectedMaterial !=
                                                  null &&
                                              _model.selectedMaterial != '') ||
                                          (_model.selectedTest != null &&
                                              _model.selectedTest != '') ||
                                          (_model.selectedMethod != null &&
                                              _model.selectedMethod != ''),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: Container(
                                            constraints: BoxConstraints(
                                              minWidth: 200.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (getJsonField(
                                                        selectedListItem,
                                                        r'''$.field.field_name''',
                                                      ) !=
                                                      null)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  6.0,
                                                                  0.0,
                                                                  6.0),
                                                      child: Text(
                                                        'Field : ${getJsonField(
                                                          selectedListItem,
                                                          r'''$.field.field_name''',
                                                        ).toString()}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  if (_model.selectedMaterial !=
                                                          null &&
                                                      _model.selectedMaterial !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  6.0,
                                                                  0.0,
                                                                  6.0),
                                                      child: Text(
                                                        'Material : ${_model.selectedMaterial}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  if (getJsonField(
                                                        selectedListItem,
                                                        r'''$.test.test_name''',
                                                      ) !=
                                                      null)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  6.0,
                                                                  0.0,
                                                                  6.0),
                                                      child: Text(
                                                        'Test : ${getJsonField(
                                                          selectedListItem,
                                                          r'''$.test.test_name''',
                                                        ).toString()}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  if (getJsonField(
                                                        selectedListItem,
                                                        r'''$.method.method_name''',
                                                      ) !=
                                                      null)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  6.0,
                                                                  0.0,
                                                                  6.0),
                                                      child: Text(
                                                        'Method : ${getJsonField(
                                                          selectedListItem,
                                                          r'''$.method.method_name''',
                                                        ).toString()}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: TextFormField(
                            controller:
                                _model.requirementTextFieldTextController,
                            focusNode: _model.requirementTextFieldFocusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelText: FFLocalizations.of(context).getText(
                                '2avljgoe' /* Number of samples */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
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
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
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
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 16.0, 16.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            validator: _model
                                .requirementTextFieldTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [_model.requirementTextFieldMask],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller:
                                _model.durationDrpodownValueController ??=
                                    FormFieldController<String>(null),
                            options: [
                              FFLocalizations.of(context).getText(
                                '3qqnk5p0' /* Today */,
                              ),
                              FFLocalizations.of(context).getText(
                                '1iqjqy7c' /* 2-6 days */,
                              ),
                              FFLocalizations.of(context).getText(
                                'bh9s4z3g' /* 7-14 days */,
                              ),
                              FFLocalizations.of(context).getText(
                                'akpls8jd' /* 15-30 days */,
                              ),
                              FFLocalizations.of(context).getText(
                                'oyytvrl7' /* Later */,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodySmallFamily),
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'iett80gh' /* When do you need it? */,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
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
                                    'TEST_PROPERTIES_COMPONENT_SUBMIT_REQUEST');
                                if (_model.selectedMaterial != null &&
                                    _model.selectedMaterial != '') {
                                  if (_model.selectedtestList.isNotEmpty) {
                                    logFirebaseEvent('Button_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: CommonDialogWidget(
                                            instrumentTestName: getJsonField(
                                              widget.testPropertieJson,
                                              r'''$.field_name''',
                                            ).toString(),
                                            isBooking: true,
                                            bookingAction: () async {
                                              logFirebaseEvent('_backend_call');
                                              _model.apiResult =
                                                  await InqueryGroup
                                                      .createBookingCall
                                                      .call(
                                                userID: currentUserData?.uid,
                                                subType:
                                                    'Test Resource Booking',
                                                instrumentRef: getJsonField(
                                                  widget.testPropertieJson,
                                                  r'''$._id''',
                                                ).toString(),
                                                testDetailsListJson:
                                                    _model.selectedtestList,
                                                sampleQuantity: _model
                                                    .requirementTextFieldTextController
                                                    .text,
                                                neededIn: _model
                                                    .durationDrpodownValue,
                                              );

                                              if ((_model
                                                      .apiResult?.succeeded ??
                                                  true)) {
                                                logFirebaseEvent(
                                                    '_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
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
                                                logFirebaseEvent(
                                                    '_navigate_to');

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
                                          content: Text(
                                              'Please select the test and method!'),
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
                                } else {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: Text(
                                            'Please select material from list'),
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

                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '7ke4gerq' /* Submit Request */,
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
                                      color: FlutterFlowTheme.of(context)
                                          .buttonText,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
