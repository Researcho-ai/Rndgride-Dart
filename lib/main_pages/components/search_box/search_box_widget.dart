import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/components/user_requirement_copy/user_requirement_copy_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_box_model.dart';
export 'search_box_model.dart';

class SearchBoxWidget extends StatefulWidget {
  const SearchBoxWidget({
    super.key,
    String? parameter1,
    this.searchValue,
  }) : this.parameter1 = parameter1 ?? '';

  final String parameter1;
  final String? searchValue;

  @override
  State<SearchBoxWidget> createState() => _SearchBoxWidgetState();
}

class _SearchBoxWidgetState extends State<SearchBoxWidget>
    with TickerProviderStateMixin {
  late SearchBoxModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchBoxModel());

    _model.desktopSearchTextController ??=
        TextEditingController(text: widget.searchValue);
    _model.desktopSearchFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 4000.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 4000.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.349,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 400.ms),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 4000.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 500.ms),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 4000.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
    });

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

    return SafeArea(
      child: Container(
        width: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return (MediaQuery.sizeOf(context).width * 0.9);
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return (MediaQuery.sizeOf(context).width * 0.8);
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return (MediaQuery.sizeOf(context).width * 0.6);
          } else {
            return (MediaQuery.sizeOf(context).width * 0.6);
          }
        }(),
        constraints: BoxConstraints(
          minHeight: () {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return 48.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return 50.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return 55.0;
            } else {
              return 55.0;
            }
          }(),
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primary,
            width: 3.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Builder(
                      builder: (context) => Container(
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        child: TextFormField(
                          controller: _model.desktopSearchTextController,
                          focusNode: _model.desktopSearchFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.desktopSearchTextController',
                            Duration(milliseconds: 2000),
                            () async {
                              logFirebaseEvent(
                                  'SEARCH_BOX_desktopSearch_ON_TEXTFIELD_CH');
                              var _shouldSetState = false;
                              logFirebaseEvent(
                                  'desktopSearch_update_app_state');
                              FFAppState().searchOutput = [];
                              safeSetState(() {});
                              logFirebaseEvent(
                                  'desktopSearch_update_component_state');
                              _model.searchCount = _model.searchCount! + 1;
                              safeSetState(() {});
                              if (_model.desktopSearchTextController.text !=
                                      '') {
                                logFirebaseEvent('desktopSearch_custom_action');
                                _model.searchString =
                                    await actions.searchString(
                                  _model.desktopSearchTextController.text,
                                );
                                _shouldSetState = true;
                                logFirebaseEvent('desktopSearch_alert_dialog');
                                unawaited(
                                  () async {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content: Text(_model.searchString!),
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
                                  }(),
                                );
                                logFirebaseEvent('desktopSearch_custom_action');
                                _model.searchR = await actions.search(
                                  _model.desktopSearchTextController.text,
                                );
                                _shouldSetState = true;
                                logFirebaseEvent(
                                    'desktopSearch_update_app_state');
                                FFAppState().searchOutput =
                                    _model.searchR!.toList().cast<String>();
                                safeSetState(() {});
                                if (FFAppState().searchOutput.isNotEmpty) {
                                  logFirebaseEvent(
                                      'desktopSearch_custom_action');
                                  _model.sortedSearchHistory2 =
                                      await actions.sortSearchHistoryByTime(
                                    FFAppState().searchHistory.toList(),
                                  );
                                  _shouldSetState = true;
                                  logFirebaseEvent(
                                      'desktopSearch_update_app_state');
                                  FFAppState().searchHistory = _model
                                      .sortedSearchHistory!
                                      .toList()
                                      .cast<SearchHistoryStruct>();
                                  safeSetState(() {});
                                } else {
                                  logFirebaseEvent('desktopSearch_wait__delay');
                                  await Future.delayed(
                                      const Duration(milliseconds: 4090));
                                  logFirebaseEvent(
                                      'desktopSearch_update_app_state');
                                  FFAppState().searchOutput = [];
                                  safeSetState(() {});
                                  logFirebaseEvent(
                                      'desktopSearch_custom_action');
                                  _model.searchR2 = await actions.search(
                                    _model.desktopSearchTextController.text,
                                  );
                                  _shouldSetState = true;
                                  logFirebaseEvent(
                                      'desktopSearch_update_app_state');
                                  FFAppState().searchOutput =
                                      _model.searchR2!.toList().cast<String>();
                                  safeSetState(() {});
                                  if (FFAppState().searchOutput.isNotEmpty) {
                                    logFirebaseEvent(
                                        'desktopSearch_custom_action');
                                    _model.sortedSearchHistory =
                                        await actions.sortSearchHistoryByTime(
                                      FFAppState().searchHistory.toList(),
                                    );
                                    _shouldSetState = true;
                                    logFirebaseEvent(
                                        'desktopSearch_update_app_state');
                                    FFAppState().searchHistory = _model
                                        .sortedSearchHistory2!
                                        .toList()
                                        .cast<SearchHistoryStruct>();
                                    safeSetState(() {});
                                  } else {
                                    if (() {
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
                                    }()) {
                                      logFirebaseEvent(
                                          'desktopSearch_alert_dialog');
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
                                            child: Container(
                                              width: 500.0,
                                              child: UserRequirementCopyWidget(
                                                isDialog: true,
                                                text: _model
                                                    .desktopSearchTextController
                                                    .text,
                                                tagValue: 'Search not found',
                                                requermwntDialog: true,
                                                action: () async {},
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      logFirebaseEvent(
                                          'desktopSearch_alert_dialog');
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
                                            child: Container(
                                              width: 700.0,
                                              child: UserRequirementCopyWidget(
                                                isDialog: true,
                                                text: _model
                                                    .desktopSearchTextController
                                                    .text,
                                                tagValue: 'Search not found',
                                                requermwntDialog: true,
                                                action: () async {},
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  }
                                }
                              } else {
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }

                              if (_shouldSetState) safeSetState(() {});
                            },
                          ),
                          onFieldSubmitted: (_) async {
                            logFirebaseEvent(
                                'SEARCH_BOX_desktopSearch_ON_TEXTFIELD_SU');
                          },
                          autofocus: false,
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Search For \"${widget.parameter1}\"',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodySmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodySmallFamily),
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: EdgeInsets.all(8.0),
                            prefixIcon: Icon(
                              FFIcons.ksearch,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            suffixIcon: _model.desktopSearchTextController!.text
                                    .isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.desktopSearchTextController
                                          ?.clear();
                                      logFirebaseEvent(
                                          'SEARCH_BOX_desktopSearch_ON_TEXTFIELD_CH');
                                      var _shouldSetState = false;
                                      logFirebaseEvent(
                                          'desktopSearch_update_app_state');
                                      FFAppState().searchOutput = [];
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'desktopSearch_update_component_state');
                                      _model.searchCount =
                                          _model.searchCount! + 1;
                                      safeSetState(() {});
                                      if (_model.desktopSearchTextController
                                                  .text !=
                                              '') {
                                        logFirebaseEvent(
                                            'desktopSearch_custom_action');
                                        _model.searchString =
                                            await actions.searchString(
                                          _model
                                              .desktopSearchTextController.text,
                                        );
                                        _shouldSetState = true;
                                        logFirebaseEvent(
                                            'desktopSearch_alert_dialog');
                                        unawaited(
                                          () async {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      _model.searchString!),
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
                                          }(),
                                        );
                                        logFirebaseEvent(
                                            'desktopSearch_custom_action');
                                        _model.searchR = await actions.search(
                                          _model
                                              .desktopSearchTextController.text,
                                        );
                                        _shouldSetState = true;
                                        logFirebaseEvent(
                                            'desktopSearch_update_app_state');
                                        FFAppState().searchOutput = _model
                                            .searchR!
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                        if (FFAppState()
                                            .searchOutput
                                            .isNotEmpty) {
                                          logFirebaseEvent(
                                              'desktopSearch_custom_action');
                                          _model.sortedSearchHistory2 =
                                              await actions
                                                  .sortSearchHistoryByTime(
                                            FFAppState().searchHistory.toList(),
                                          );
                                          _shouldSetState = true;
                                          logFirebaseEvent(
                                              'desktopSearch_update_app_state');
                                          FFAppState().searchHistory = _model
                                              .sortedSearchHistory!
                                              .toList()
                                              .cast<SearchHistoryStruct>();
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'desktopSearch_wait__delay');
                                          await Future.delayed(const Duration(
                                              milliseconds: 4090));
                                          logFirebaseEvent(
                                              'desktopSearch_update_app_state');
                                          FFAppState().searchOutput = [];
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'desktopSearch_custom_action');
                                          _model.searchR2 =
                                              await actions.search(
                                            _model.desktopSearchTextController
                                                .text,
                                          );
                                          _shouldSetState = true;
                                          logFirebaseEvent(
                                              'desktopSearch_update_app_state');
                                          FFAppState().searchOutput = _model
                                              .searchR2!
                                              .toList()
                                              .cast<String>();
                                          safeSetState(() {});
                                          if (FFAppState()
                                              .searchOutput
                                              .isNotEmpty) {
                                            logFirebaseEvent(
                                                'desktopSearch_custom_action');
                                            _model.sortedSearchHistory =
                                                await actions
                                                    .sortSearchHistoryByTime(
                                              FFAppState()
                                                  .searchHistory
                                                  .toList(),
                                            );
                                            _shouldSetState = true;
                                            logFirebaseEvent(
                                                'desktopSearch_update_app_state');
                                            FFAppState().searchHistory = _model
                                                .sortedSearchHistory2!
                                                .toList()
                                                .cast<SearchHistoryStruct>();
                                            safeSetState(() {});
                                          } else {
                                            if (() {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return true;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return true;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return false;
                                              } else {
                                                return false;
                                              }
                                            }()) {
                                              logFirebaseEvent(
                                                  'desktopSearch_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: Container(
                                                      width: 500.0,
                                                      child:
                                                          UserRequirementCopyWidget(
                                                        isDialog: true,
                                                        text: _model
                                                            .desktopSearchTextController
                                                            .text,
                                                        tagValue:
                                                            'Search not found',
                                                        requermwntDialog: true,
                                                        action: () async {},
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              logFirebaseEvent(
                                                  'desktopSearch_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: Container(
                                                      width: 700.0,
                                                      child:
                                                          UserRequirementCopyWidget(
                                                        isDialog: true,
                                                        text: _model
                                                            .desktopSearchTextController
                                                            .text,
                                                        tagValue:
                                                            'Search not found',
                                                        requermwntDialog: true,
                                                        action: () async {},
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          }
                                        }
                                      } else {
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22.0,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          validator: _model.desktopSearchTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (widget.searchValue != null && widget.searchValue != ''
                ? (_model.searchCount != 0)
                : ((_model.desktopSearchFocusNode?.hasFocus ?? false) ||
                    (_model.desktopSearchTextController.text != '')))
              Material(
                color: Colors.transparent,
                elevation: 6.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxHeight: () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return 190.0;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return 200.0;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return 220.0;
                      } else {
                        return 220.0;
                      }
                    }(),
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (FFAppState().searchOutput.isNotEmpty)
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final analysisItem = FFAppState()
                                    .searchOutput
                                    .unique((e) => e)
                                    .sortedList(keyOf: (e) => e, desc: false)
                                    .toList();

                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(analysisItem.length,
                                        (analysisItemIndex) {
                                      final analysisItemItem =
                                          analysisItem[analysisItemIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 2.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SEARCH_BOX_Container_2h1qo66q_ON_TAP');
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        analysisItemItem,
                                                        style:
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
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                        ),
                      if ((FFAppState().searchHistory.isNotEmpty) &&
                          (_model.desktopSearchTextController.text == '') &&
                          !(FFAppState().searchOutput.isNotEmpty))
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final analysisNameList = FFAppState()
                                    .searchHistory
                                    .map((e) => e)
                                    .toList()
                                    .take(15)
                                    .toList();

                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:
                                        List.generate(analysisNameList.length,
                                            (analysisNameListIndex) {
                                      final analysisNameListItem =
                                          analysisNameList[
                                              analysisNameListIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 2.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'SEARCH_BOX_COMP_Row_9pqezdfu_ON_TAP');
                                              logFirebaseEvent(
                                                  'Row_set_form_field');
                                              safeSetState(() {
                                                _model.desktopSearchTextController
                                                        ?.text =
                                                    analysisNameListItem
                                                        .searchTerm;
                                              });
                                              logFirebaseEvent(
                                                  'Row_custom_action');
                                              _model.searchResultListForSearchHistory =
                                                  await actions.search(
                                                analysisNameListItem.searchTerm,
                                              );

                                              safeSetState(() {});
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                12.0,
                                                                0.0,
                                                                12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.history_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              analysisNameListItem
                                                                  .searchTerm,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
                                                  child: Icon(
                                                    Icons
                                                        .arrow_outward_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ],
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
                        ),
                      if ((_model.desktopSearchTextController.text != '') &&
                          !(FFAppState().searchOutput.isNotEmpty))
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 2.0, 5.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 2.0),
                                    child: Container(
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [],
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation1']!),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 2.0),
                                    child: Container(
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [],
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation2']!),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 2.0),
                                    child: Container(
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [],
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation3']!),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 2.0),
                                    child: Container(
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [],
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation4']!),
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
          ],
        ),
      ),
    );
  }
}
