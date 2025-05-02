import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/available_testdetial_component_widget.dart';
import '/components/common_dialog_widget.dart';
import '/components/material_component_widget.dart';
import '/components/test_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'test_properties_component_model.dart';
export 'test_properties_component_model.dart';

class TestPropertiesComponentWidget extends StatefulWidget {
  const TestPropertiesComponentWidget({
    super.key,
    this.testPropertieJson,
    bool? isSearchResult,
  }) : this.isSearchResult = isSearchResult ?? false;

  final dynamic testPropertieJson;
  final bool isSearchResult;

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
      if (widget.isSearchResult) {
        logFirebaseEvent('testPropertiesComponent_update_component');
        _model.addToSelectedtestList(widget.testPropertieJson!);
        safeSetState(() {});
      } else {
        logFirebaseEvent('testPropertiesComponent_backend_call');
        _model.apiResultvth = await TestsGroup.getFiedsCall.call(
          categoryRef: getJsonField(
            widget.testPropertieJson,
            r'''$._id''',
          ).toString().toString(),
        );

        if ((_model.apiResultvth?.succeeded ?? true)) {
          logFirebaseEvent('testPropertiesComponent_update_component');
          _model.fielsJsonList = TestsGroup.getFiedsCall
              .fields(
                (_model.apiResultvth?.jsonBody ?? ''),
              )!
              .toList()
              .cast<dynamic>();
          _model.fieldShow = true;
          safeSetState(() {});
        }
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
              if (widget.isSearchResult)
                Padding(
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'TEST_PROPERTIES_COMPONENT_Icon_oolrgmq9_');
                          logFirebaseEvent('Icon_close_dialog_drawer_etc');
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
              if (!widget.isSearchResult)
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            getJsonField(
                              widget.testPropertieJson,
                              r'''$.category_name''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  font: FlutterFlowTheme.of(context).labelLarge,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'TEST_PROPERTIES_COMPONENT_Icon_ny3a1fnr_');
                            logFirebaseEvent('Icon_close_dialog_drawer_etc');
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close_sharp,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
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
                        if (!widget.isSearchResult)
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
                                if (_model.fieldShow) {
                                  logFirebaseEvent(
                                      'Row_update_component_state');
                                  _model.fieldShow = false;
                                  safeSetState(() {});
                                } else {
                                  logFirebaseEvent(
                                      'Row_update_component_state');
                                  _model.fieldShow = true;
                                  safeSetState(() {});
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: SelectionArea(
                                        child: Text(
                                      FFLocalizations.of(context).getText(
                                        'ftkrnxdv' /* Please selet the Field  */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: FlutterFlowTheme.of(context)
                                                .titleSmall,
                                            letterSpacing: 0.0,
                                          ),
                                    )),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (!_model.fieldShow ||
                                          (_model.level == 0))
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
                                            _model.fieldShow = true;
                                            safeSetState(() {});
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_right,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      if (_model.fieldShow ||
                                          (_model.level == 0))
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
                                            _model.fieldShow = false;
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
                        if (_model.fielsJsonList.isNotEmpty)
                          Opacity(
                            opacity: 0.3,
                            child: Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).line,
                            ),
                          ),
                        if (_model.fieldShow)
                          Builder(
                            builder: (context) {
                              final fieldsList = _model.fielsJsonList.toList();

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
                                itemCount: fieldsList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, fieldsListIndex) {
                                  final fieldsListItem =
                                      fieldsList[fieldsListIndex];
                                  return MaterialComponentWidget(
                                    key: Key(
                                        'Keyo8e_${fieldsListIndex}_of_${fieldsList.length}'),
                                    materialName: getJsonField(
                                      fieldsListItem,
                                      r'''$.field_name''',
                                    ).toString(),
                                    level: 0,
                                    checkBoxValue: fieldsListIndex ==
                                        _model.selectedFieldIndex,
                                    addAction: () async {
                                      logFirebaseEvent(
                                          'TEST_PROPERTIES_COMPONENT_Container_o8ex');
                                      logFirebaseEvent(
                                          'materialComponent_update_component_state');
                                      _model.selectedFieldIndex = null;
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'materialComponent_update_component_state');
                                      _model.selectedfield = getJsonField(
                                        fieldsListItem,
                                        r'''$.field_name''',
                                      ).toString();
                                      _model.fieldShow = false;
                                      _model.selectedFieldIndex =
                                          fieldsListIndex;
                                      _model.finalList = [];
                                      _model.selectedMaterial = null;
                                      _model.selectedTest = null;
                                      _model.testMethodList = [];
                                      _model.selectedMethod = null;
                                      _model.selectedtestList = [];
                                      _model.selectesMaterialIndex = null;
                                      _model.selectedTestIndexs = [];
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'materialComponent_backend_call');
                                      _model.apiResultj0o = await TestsGroup
                                          .getAvailabeTestPropetiesCall
                                          .call(
                                        fieldRef: getJsonField(
                                          fieldsListItem,
                                          r'''$._id''',
                                        ).toString(),
                                      );

                                      if ((_model.apiResultj0o?.succeeded ??
                                          true)) {
                                        logFirebaseEvent(
                                            'materialComponent_custom_action');
                                        _model.availability =
                                            await actions.checkAvailability(
                                          TestsGroup
                                              .getAvailabeTestPropetiesCall
                                              .data(
                                                (_model.apiResultj0o
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList(),
                                        );
                                        logFirebaseEvent(
                                            'materialComponent_update_component_state');
                                        _model.finalList = TestsGroup
                                            .getAvailabeTestPropetiesCall
                                            .data(
                                              (_model.apiResultj0o?.jsonBody ??
                                                  ''),
                                            )!
                                            .toList()
                                            .cast<dynamic>();
                                        _model.testMethodList = TestsGroup
                                            .getAvailabeTestPropetiesCall
                                            .data(
                                              (_model.apiResultj0o?.jsonBody ??
                                                  ''),
                                            )!
                                            .toList()
                                            .cast<dynamic>();
                                        _model.availabilityBool = _model
                                            .availability!
                                            .toList()
                                            .cast<bool>();
                                        safeSetState(() {});
                                        await Future.wait([
                                          Future(() async {
                                            if (_model.availabilityBool
                                                .elementAtOrNull(1)!) {
                                              logFirebaseEvent(
                                                  'materialComponent_update_component_state');
                                              _model.materialShow = true;
                                              _model.level = 1;
                                              safeSetState(() {});
                                            } else {
                                              if (_model.availabilityBool
                                                      .elementAtOrNull(2)! ||
                                                  _model.availabilityBool
                                                      .elementAtOrNull(3)!) {
                                                logFirebaseEvent(
                                                    'materialComponent_update_component_state');
                                                _model.level = 2;
                                                _model.testMethodShow = true;
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'materialComponent_update_component_state');
                                                _model.selectedtestList = TestsGroup
                                                    .getAvailabeTestPropetiesCall
                                                    .data(
                                                      (_model.apiResultj0o
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                    .toList()
                                                    .cast<dynamic>();
                                                safeSetState(() {});
                                              }
                                            }
                                          }),
                                        ]);
                                      }

                                      safeSetState(() {});
                                    },
                                    rmAction: () async {
                                      logFirebaseEvent(
                                          'TEST_PROPERTIES_COMPONENT_Container_o8ex');
                                      logFirebaseEvent(
                                          'materialComponent_update_component_state');
                                      _model.finalList = [];
                                      _model.selectedMaterial = null;
                                      _model.selectedTest = null;
                                      _model.testMethodList = [];
                                      _model.selectedMethod = null;
                                      _model.selectedtestList = [];
                                      _model.selectesMaterialIndex = null;
                                      _model.selectedTestIndexs = [];
                                      _model.selectedfield = null;
                                      _model.selectedFieldIndex = null;
                                      safeSetState(() {});
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        if (_model.fieldShow)
                          Opacity(
                            opacity: 0.3,
                            child: Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).line,
                            ),
                          ),
                        if ((_model.finalList.isNotEmpty) &&
                            _model.availabilityBool.elementAtOrNull(1)!)
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
                                    'TEST_PROPERTIES_COMPONENT_Row_xfg8g1z8_O');
                                if (_model.materialShow) {
                                  logFirebaseEvent(
                                      'Row_update_component_state');
                                  _model.materialShow = false;
                                  safeSetState(() {});
                                } else {
                                  logFirebaseEvent(
                                      'Row_update_component_state');
                                  _model.materialShow = true;
                                  safeSetState(() {});
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: SelectionArea(
                                        child: Text(
                                      FFLocalizations.of(context).getText(
                                        'mlz0i413' /* Please selet the Material  */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: FlutterFlowTheme.of(context)
                                                .titleSmall,
                                            letterSpacing: 0.0,
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
                                                'TEST_PROPERTIES_COMPONENT_Icon_w8d6mms9_');
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
                                                'TEST_PROPERTIES_COMPONENT_Icon_psb00qkg_');
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
                              color: FlutterFlowTheme.of(context).primary,
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
                                  .where((e) => e != null)
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
                                  return Visibility(
                                    visible: getJsonField(
                                          analyssiListItem,
                                          r'''$.material.material_name''',
                                        ) !=
                                        null,
                                    child: MaterialComponentWidget(
                                      key: Key(
                                          'Keyhzr_${analyssiListIndex}_of_${analyssiList.length}'),
                                      materialName: getJsonField(
                                        analyssiListItem,
                                        r'''$.material.material_name''',
                                      ).toString(),
                                      level: 1,
                                      checkBoxValue: analyssiListIndex ==
                                          _model.selectesMaterialIndex,
                                      addAction: () async {
                                        logFirebaseEvent(
                                            'TEST_PROPERTIES_COMPONENT_Container_hzrc');
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
                                        _model.testMethods2 =
                                            await actions.filterAvailableTests(
                                          _model.selectedfield,
                                          getJsonField(
                                            analyssiListItem,
                                            r'''$.material.material_name''',
                                          ).toString(),
                                          '',
                                          '',
                                          _model.finalList.toList(),
                                        );
                                        if (_model.testMethods2 != null &&
                                            (_model.testMethods2)!.isNotEmpty) {
                                          logFirebaseEvent(
                                              'materialComponent_update_component_state');
                                          _model.testMethodList = _model
                                              .testMethods2!
                                              .toList()
                                              .cast<dynamic>();
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'materialComponent_update_component_state');
                                          _model.addToSelectedtestList(
                                              analyssiListItem);
                                          safeSetState(() {});
                                        }

                                        safeSetState(() {});
                                      },
                                      rmAction: () async {
                                        logFirebaseEvent(
                                            'TEST_PROPERTIES_COMPONENT_Container_hzrc');
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
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        if ((_model.finalList.isNotEmpty) &&
                            _model.materialShow)
                          Opacity(
                            opacity: 0.3,
                            child: Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).line,
                            ),
                          ),
                        if ((_model.testMethodList.isNotEmpty) &&
                            (_model.availabilityBool.elementAtOrNull(2)! ||
                                _model.availabilityBool.elementAtOrNull(3)!))
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
                                  logFirebaseEvent(
                                      'Row_update_component_state');
                                  _model.testMethodShow = false;
                                  safeSetState(() {});
                                } else {
                                  logFirebaseEvent(
                                      'Row_update_component_state');
                                  _model.testMethodShow = true;
                                  safeSetState(() {});
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            font: FlutterFlowTheme.of(context)
                                                .titleSmall,
                                            letterSpacing: 0.0,
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
                        if (_model.testMethodList.isNotEmpty)
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
                                  return Visibility(
                                    visible: (getJsonField(
                                              analyssiListItem,
                                              r'''$.test.test_name''',
                                            ) !=
                                            null) ||
                                        (getJsonField(
                                              analyssiListItem,
                                              r'''$.method.method_name''',
                                            ) !=
                                            null),
                                    child: TestComponentWidget(
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
                                        if ((getJsonField(
                                                  analyssiListItem,
                                                  r'''$.test.test_name''',
                                                ) !=
                                                null) &&
                                            (getJsonField(
                                                  analyssiListItem,
                                                  r'''$.method.method_name''',
                                                ) !=
                                                null)) {
                                          logFirebaseEvent(
                                              'testComponent_update_component_state');
                                          _model.testMethodShow = false;
                                          _model.level = 3;
                                          _model.addToSelectedTestIndexs(
                                              analyssiListIndex);
                                          _model.selectedTest = getJsonField(
                                            analyssiListItem,
                                            r'''$.test.test_name''',
                                          ).toString();
                                          _model.selectedMethod = getJsonField(
                                            analyssiListItem,
                                            r'''$.method.method_name''',
                                          ).toString();
                                          safeSetState(() {});
                                        } else {
                                          if (getJsonField(
                                                analyssiListItem,
                                                r'''$.test.test_name''',
                                              ) !=
                                              null) {
                                            logFirebaseEvent(
                                                'testComponent_update_component_state');
                                            _model.testMethodShow = false;
                                            _model.level = 3;
                                            _model.addToSelectedTestIndexs(
                                                analyssiListIndex);
                                            _model.selectedTest = getJsonField(
                                              analyssiListItem,
                                              r'''$.test.test_name''',
                                            ).toString();
                                            safeSetState(() {});
                                          } else {
                                            if (getJsonField(
                                                  analyssiListItem,
                                                  r'''$.method.method_name''',
                                                ) !=
                                                null) {
                                              logFirebaseEvent(
                                                  'testComponent_update_component_state');
                                              _model.testMethodShow = false;
                                              _model.level = 3;
                                              _model.addToSelectedTestIndexs(
                                                  analyssiListIndex);
                                              _model.selectedMethod =
                                                  getJsonField(
                                                analyssiListItem,
                                                r'''$.method.method_name''',
                                              ).toString();
                                              safeSetState(() {});
                                            }
                                          }
                                        }

                                        logFirebaseEvent(
                                            'testComponent_update_component_state');
                                        _model.selectedtestList =
                                            analyssiListItem
                                                .toList()
                                                .cast<dynamic>();
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
                                    ),
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
                        if (_model.selectedtestList.isNotEmpty)
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final selectedList =
                                      _model.selectedtestList.toList();

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(selectedList.length,
                                              (selectedListIndex) {
                                        final selectedListItem =
                                            selectedList[selectedListIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child:
                                              AvailableTestdetialComponentWidget(
                                            key: Key(
                                                'Key9ro_${selectedListIndex}_of_${selectedList.length}'),
                                            fieldName: getJsonField(
                                              selectedListItem,
                                              r'''$.field.field_name''',
                                            ).toString(),
                                            materialName: getJsonField(
                                              selectedListItem,
                                              r'''$.material.material_name''',
                                            ).toString(),
                                            testName: getJsonField(
                                              selectedListItem,
                                              r'''$.test.test_name''',
                                            ).toString(),
                                            methodName: getJsonField(
                                              selectedListItem,
                                              r'''$.method.method_name''',
                                            ).toString(),
                                            isSearchresult: false,
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        if (!(_model.selectedtestList.isNotEmpty) &&
                            ((_model.selectedfield != null &&
                                    _model.selectedfield != '') ||
                                (_model.selectedMaterial != null &&
                                    _model.selectedMaterial != '')))
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model
                                            .availableTestdetialComponentModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child:
                                            AvailableTestdetialComponentWidget(
                                          fieldName: _model.selectedfield,
                                          materialName: _model.selectedMaterial,
                                          testName: _model.selectedTest,
                                          methodName: _model.selectedMethod,
                                          isSearchresult: false,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                                    font: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    color: FlutterFlowTheme.of(context).border,
                                    letterSpacing: 0.0,
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
                                  font: FlutterFlowTheme.of(context).bodyMedium,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
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
                                  font: FlutterFlowTheme.of(context).bodySmall,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
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
                                  font: FlutterFlowTheme.of(context).bodyMedium,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
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
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: CommonDialogWidget(
                                        instrumentTestName: getJsonField(
                                          widget.testPropertieJson,
                                          r'''$.category_name''',
                                        ).toString(),
                                        isBooking: true,
                                        bookingAction: () async {
                                          if (_model
                                              .selectedtestList.isNotEmpty) {
                                            logFirebaseEvent('_backend_call');
                                            _model.apiResult =
                                                await InqueryGroup
                                                    .createBookingCall
                                                    .call(
                                              userID: currentUserData?.uid,
                                              subType: 'Test Resource Booking',
                                              instrumentRef: getJsonField(
                                                widget.testPropertieJson,
                                                r'''$._id''',
                                              ).toString(),
                                              testDetailsListJson:
                                                  _model.selectedtestList,
                                              sampleQuantity: _model
                                                  .requirementTextFieldTextController
                                                  .text,
                                              neededIn:
                                                  _model.durationDrpodownValue,
                                            );

                                            if ((_model.apiResult?.succeeded ??
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
                                            }
                                          } else {
                                            if ((_model.selectedfield != null &&
                                                    _model.selectedfield !=
                                                        '') ||
                                                (_model.selectedMaterial !=
                                                        null &&
                                                    _model.selectedMaterial !=
                                                        '')) {
                                              logFirebaseEvent(
                                                  '_custom_action');
                                              _model.genratedJsonObject =
                                                  await actions
                                                      .createJsonObject(
                                                _model.selectedfield,
                                                _model.selectedMaterial,
                                                _model.selectedTest,
                                                _model.selectedMethod,
                                              );
                                              logFirebaseEvent(
                                                  '_update_component_state');
                                              _model.addToSelectedtestList(
                                                  _model.genratedJsonObject!);
                                              logFirebaseEvent('_backend_call');
                                              _model.apiResultnotEmpty =
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

                                              if ((_model.apiResultnotEmpty
                                                      ?.succeeded ??
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
                                              }
                                            } else {
                                              logFirebaseEvent('_backend_call');
                                              _model.apiResultFullEmty =
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
                                                sampleQuantity: _model
                                                    .requirementTextFieldTextController
                                                    .text,
                                                neededIn: _model
                                                    .durationDrpodownValue,
                                              );

                                              if ((_model.apiResultFullEmty
                                                      ?.succeeded ??
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
                                              }
                                            }
                                          }

                                          logFirebaseEvent(
                                              '_close_dialog_drawer_etc');
                                          Navigator.pop(context);
                                        },
                                      ),
                                    );
                                  },
                                );

                                logFirebaseEvent(
                                    'Button_close_dialog_drawer_etc');
                                Navigator.pop(context);

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
                                      font: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                      color: FlutterFlowTheme.of(context)
                                          .buttonText,
                                      letterSpacing: 0.0,
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
