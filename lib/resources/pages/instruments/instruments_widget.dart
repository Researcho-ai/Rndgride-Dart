import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bars/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/nav_bars/drawer/drawer_widget.dart';
import '/nav_bars/top_nav_bar/top_nav_bar_widget.dart';
import '/resources/components/data_not_found_c_omponent/data_not_found_c_omponent_widget.dart';
import '/resources/components/instruments_details/instruments_details_widget.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'instruments_model.dart';
export 'instruments_model.dart';

class InstrumentsWidget extends StatefulWidget {
  const InstrumentsWidget({super.key});

  static String routeName = 'Instruments';
  static String routePath = 'Instruments';

  @override
  State<InstrumentsWidget> createState() => _InstrumentsWidgetState();
}

class _InstrumentsWidgetState extends State<InstrumentsWidget> {
  late InstrumentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InstrumentsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Instruments'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('INSTRUMENTS_Instruments_ON_INIT_STATE');
      logFirebaseEvent('Instruments_backend_call');
      _model.instrumentsFromAPI =
          await InstrumentsTestsGroup.getInstrumentsTestsCall.call(
        limit: 18,
        filteredValue: true,
      );

      if ((_model.instrumentsFromAPI?.succeeded ?? true)) {
        logFirebaseEvent('Instruments_update_page_state');
        _model.instrumentsListFromAPI =
            InstrumentsTestsGroup.getInstrumentsTestsCall.instrumentsTests(
          (_model.instrumentsFromAPI?.jsonBody ?? ''),
        );
        _model.instrumentLength =
            InstrumentsTestsGroup.getInstrumentsTestsCall.count(
          (_model.instrumentsFromAPI?.jsonBody ?? ''),
        )!;
        safeSetState(() {});
        return;
      } else {
        return;
      }
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.searchITextController ??= TextEditingController();
    _model.searchIFocusNode ??= FocusNode();
    _model.searchIFocusNode!.addListener(
      () async {
        logFirebaseEvent('INSTRUMENTS_PAGE_searchI_ON_FOCUS_CHANGE');
        logFirebaseEvent('searchI_wait__delay');
        await Future.delayed(const Duration(milliseconds: 2000));
        logFirebaseEvent('searchI_update_page_state');
        _model.searchbarFocuse = false;
        safeSetState(() {});
      },
    );
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
    context.watch<FFAppState>();

    return Title(
        title: 'Instruments',
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
                    backgroundColor: FlutterFlowTheme.of(context).primary,
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
                            'INSTRUMENTS_arrow_back_rounded_ICN_ON_TA');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'k21bwglw' /* Resources */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: FlutterFlowTheme.of(context).bodyMedium,
                            color: FlutterFlowTheme.of(context).buttonText,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
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
                    child: Container(
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      60.0, 0.0, 60.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.topNavBarModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TopNavBarWidget(
                                      instrument: true,
                                      about: false,
                                      contactus: false,
                                      tests: false,
                                      sophisticated: false,
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
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.8);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.8);
                                } else {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.8);
                                }
                              }(),
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        0.0,
                                        0.0,
                                        valueOrDefault<double>(
                                          () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 24.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 0.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 0.0;
                                            } else {
                                              return 0.0;
                                            }
                                          }(),
                                          0.0,
                                        )),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 16.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 50.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  icon: Icon(
                                                    FFIcons.karrowLeft,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'INSTRUMENTS_PAGE_arrowLeft_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_navigate_back');
                                                    context.safePop();
                                                  },
                                                ),
                                              ),
                                              Flexible(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 8.0),
                                                    child: Container(
                                                      width: () {
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            kBreakpointSmall) {
                                                          return (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width *
                                                              0.9);
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointMedium) {
                                                          return (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width *
                                                              0.8);
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointLarge) {
                                                          return (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width *
                                                              0.8);
                                                        } else {
                                                          return (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width *
                                                              0.8);
                                                        }
                                                      }(),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    valueOrDefault<
                                                                        double>(
                                                                      () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 4.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 8.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 10.0;
                                                                        } else {
                                                                          return 10.0;
                                                                        }
                                                                      }(),
                                                                      0.0,
                                                                    ),
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 4.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 8.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 10.0;
                                                                        } else {
                                                                          return 10.0;
                                                                        }
                                                                      }(),
                                                                      0.0,
                                                                    ),
                                                                    0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.4,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .searchITextController,
                                                                      focusNode:
                                                                          _model
                                                                              .searchIFocusNode,
                                                                      onChanged:
                                                                          (_) =>
                                                                              EasyDebounce.debounce(
                                                                        '_model.searchITextController',
                                                                        Duration(
                                                                            milliseconds:
                                                                                800),
                                                                        () async {
                                                                          logFirebaseEvent(
                                                                              'INSTRUMENTS_searchI_ON_TEXTFIELD_CHANGE');
                                                                          if (_model.searchITextController.text != '') {
                                                                            logFirebaseEvent('searchI_update_page_state');
                                                                            _model.searchbarFocuse =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('searchI_backend_call');
                                                                            _model.apiResultq7d =
                                                                                await InstrumentsTestsGroup.instrumentSuggestionsCall.call(
                                                                              searchTerm: _model.searchITextController.text,
                                                                              sophisticatedSearch: false,
                                                                            );

                                                                            if ((_model.apiResultq7d?.succeeded ??
                                                                                true)) {
                                                                              logFirebaseEvent('searchI_update_page_state');
                                                                              _model.sugetiion = InstrumentsTestsGroup.instrumentSuggestionsCall
                                                                                  .suggetion(
                                                                                    (_model.apiResultq7d?.jsonBody ?? ''),
                                                                                  )!
                                                                                  .toList()
                                                                                  .cast<String>();
                                                                              safeSetState(() {});
                                                                            }
                                                                          } else {
                                                                            logFirebaseEvent('searchI_wait__delay');
                                                                            await Future.delayed(const Duration(milliseconds: 1000));
                                                                            logFirebaseEvent('searchI_update_page_state');
                                                                            _model.activeSearch =
                                                                                false;
                                                                            safeSetState(() {});
                                                                          }

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                      ),
                                                                      onFieldSubmitted:
                                                                          (_) async {
                                                                        logFirebaseEvent(
                                                                            'INSTRUMENTS_searchI_ON_TEXTFIELD_SUBMIT');
                                                                        var _shouldSetState =
                                                                            false;
                                                                        if (_model.searchITextController.text !=
                                                                            ' ') {
                                                                          logFirebaseEvent(
                                                                              'searchI_update_page_state');
                                                                          _model.activeSearch =
                                                                              true;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'searchI_backend_call');
                                                                          _model.instrumentSearch = await InstrumentsTestsGroup
                                                                              .searchInstrumentTestCall
                                                                              .call(
                                                                            search:
                                                                                _model.searchITextController.text,
                                                                            sophisticatedSearch:
                                                                                false,
                                                                          );

                                                                          _shouldSetState =
                                                                              true;
                                                                          if ((_model.instrumentSearch?.succeeded ??
                                                                              true)) {
                                                                            logFirebaseEvent('searchI_update_page_state');
                                                                            _model.resultInstrumentsFromAPI = InstrumentsTestsGroup.searchInstrumentTestCall
                                                                                .instruments(
                                                                                  (_model.instrumentSearch?.jsonBody ?? ''),
                                                                                )!
                                                                                .toList()
                                                                                .cast<dynamic>();
                                                                            _model.searchInstrumentCount =
                                                                                valueOrDefault<int>(
                                                                              InstrumentsTestsGroup.searchInstrumentTestCall.count(
                                                                                (_model.instrumentSearch?.jsonBody ?? ''),
                                                                              ),
                                                                              0,
                                                                            );
                                                                            _model.searchbarFocuse =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                            return;
                                                                          } else {
                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                            return;
                                                                          }
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'searchI_update_page_state');
                                                                          _model.activeSearch =
                                                                              false;
                                                                          safeSetState(
                                                                              () {});
                                                                        }

                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                      },
                                                                      autofocus:
                                                                          false,
                                                                      textCapitalization:
                                                                          TextCapitalization
                                                                              .none,
                                                                      textInputAction:
                                                                          TextInputAction
                                                                              .search,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'yhistp7b' /* Search  Instrument... */,
                                                                        ),
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              font: FlutterFlowTheme.of(context).bodySmall,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        prefixIcon:
                                                                            Icon(
                                                                          FFIcons
                                                                              .ksearch,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      validator: _model
                                                                          .searchITextControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                      inputFormatters: [
                                                                        if (!isAndroid &&
                                                                            !isiOS)
                                                                          TextInputFormatter.withFunction((oldValue,
                                                                              newValue) {
                                                                            return TextEditingValue(
                                                                              selection: newValue.selection,
                                                                              text: newValue.text.toCapitalization(TextCapitalization.none),
                                                                            );
                                                                          }),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (_model
                                                                        .searchITextController
                                                                        .text !=
                                                                    '')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'INSTRUMENTS_PAGE_Icon_vf9iun5v_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Icon_clear_text_fields_pin_codes');
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .searchITextController
                                                                              ?.clear();
                                                                        });
                                                                        logFirebaseEvent(
                                                                            'Icon_update_page_state');
                                                                        _model.activeSearch =
                                                                            false;
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        FFIcons
                                                                            .kcross,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                          if ((_model.searchITextController
                                                                          .text !=
                                                                      '') &&
                                                              (_model.sugetiion
                                                                  .isNotEmpty) &&
                                                              _model
                                                                  .searchbarFocuse)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          8.0,
                                                                          24.0,
                                                                          8.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final sUggention = _model
                                                                      .sugetiion
                                                                      .toList()
                                                                      .take(6)
                                                                      .toList();

                                                                  return SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: List.generate(
                                                                          sUggention
                                                                              .length,
                                                                          (sUggentionIndex) {
                                                                        final sUggentionItem =
                                                                            sUggention[sUggentionIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              6.0,
                                                                              4.0,
                                                                              6.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('INSTRUMENTS_PAGE_Row_cv4ompa3_ON_TAP');
                                                                              var _shouldSetState = false;
                                                                              logFirebaseEvent('Row_set_form_field');
                                                                              safeSetState(() {
                                                                                _model.searchITextController?.text = sUggentionItem;
                                                                              });
                                                                              logFirebaseEvent('Row_update_page_state');
                                                                              _model.activeSearch = true;
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Row_backend_call');
                                                                              _model.instrumentSearchByRow = await InstrumentsTestsGroup.searchInstrumentTestCall.call(
                                                                                search: sUggentionItem,
                                                                                sophisticatedSearch: false,
                                                                              );

                                                                              _shouldSetState = true;
                                                                              if ((_model.instrumentSearchByRow?.succeeded ?? true)) {
                                                                                logFirebaseEvent('Row_update_page_state');
                                                                                _model.resultInstrumentsFromAPI = InstrumentsTestsGroup.searchInstrumentTestCall
                                                                                    .instruments(
                                                                                      (_model.instrumentSearchByRow?.jsonBody ?? ''),
                                                                                    )!
                                                                                    .toList()
                                                                                    .cast<dynamic>();
                                                                                _model.searchInstrumentCount = InstrumentsTestsGroup.searchInstrumentTestCall.count(
                                                                                  (_model.instrumentSearchByRow?.jsonBody ?? ''),
                                                                                );
                                                                                safeSetState(() {});
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              } else {
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              }

                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      sUggentionItem,
                                                                                      '1h',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Icon(
                                                                                  Icons.arrow_outward,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 16.0,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      valueOrDefault<double>(
                                                        () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall) {
                                                            return 5.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium) {
                                                            return 5.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointLarge) {
                                                            return 0.0;
                                                          } else {
                                                            return 0.0;
                                                          }
                                                        }(),
                                                        0.0,
                                                      ),
                                                      8.0,
                                                      valueOrDefault<double>(
                                                        () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall) {
                                                            return 5.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium) {
                                                            return 5.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointLarge) {
                                                            return 0.0;
                                                          } else {
                                                            return 0.0;
                                                          }
                                                        }(),
                                                        0.0,
                                                      ),
                                                      0.0),
                                              child: Container(
                                                width: () {
                                                  if (MediaQuery.sizeOf(context)
                                                          .width <
                                                      kBreakpointSmall) {
                                                    return (MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9);
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointMedium) {
                                                    return (MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.8);
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointLarge) {
                                                    return (MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.8);
                                                  } else {
                                                    return (MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.8);
                                                  }
                                                }(),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              valueOrDefault<
                                                                  double>(
                                                                () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 5.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 5.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 0.0;
                                                                  } else {
                                                                    return 0.0;
                                                                  }
                                                                }(),
                                                                0.0,
                                                              ),
                                                              0.0,
                                                              valueOrDefault<
                                                                  double>(
                                                                () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 5.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 5.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 0.0;
                                                                  } else {
                                                                    return 0.0;
                                                                  }
                                                                }(),
                                                                0.0,
                                                              ),
                                                              0.0),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if ((FFAppState()
                                                                    .InstrumentsList !=
                                                                null) &&
                                                            !_model
                                                                .activeSearch)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        valueOrDefault<
                                                                            double>(
                                                                          () {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return 100.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return 70.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return 30.0;
                                                                            } else {
                                                                              return 30.0;
                                                                            }
                                                                          }(),
                                                                          0.0,
                                                                        )),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final instrumentsTestsList =
                                                                                _model.instrumentsListFromAPI?.toList() ?? [];

                                                                            return MasonryGridView.builder(
                                                                              physics: const NeverScrollableScrollPhysics(),
                                                                              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                                                crossAxisCount: valueOrDefault<int>(
                                                                                  () {
                                                                                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                      return 1;
                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                      return 2;
                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                      return 3;
                                                                                    } else {
                                                                                      return 3;
                                                                                    }
                                                                                  }(),
                                                                                  2,
                                                                                ),
                                                                              ),
                                                                              crossAxisSpacing: 20.0,
                                                                              mainAxisSpacing: 20.0,
                                                                              itemCount: instrumentsTestsList.length,
                                                                              padding: EdgeInsets.fromLTRB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                10.0,
                                                                              ),
                                                                              shrinkWrap: true,
                                                                              itemBuilder: (context, instrumentsTestsListIndex) {
                                                                                final instrumentsTestsListItem = instrumentsTestsList[instrumentsTestsListIndex];
                                                                                return Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 0.0,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(0.0),
                                                                                      topLeft: Radius.circular(0.0),
                                                                                      topRight: Radius.circular(0.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(0.0),
                                                                                        bottomRight: Radius.circular(0.0),
                                                                                        topLeft: Radius.circular(0.0),
                                                                                        topRight: Radius.circular(0.0),
                                                                                      ),
                                                                                    ),
                                                                                    child: wrapWithModel(
                                                                                      model: _model.instrumentsDetailsModels1.getModel(
                                                                                        instrumentsTestsListIndex.toString(),
                                                                                        instrumentsTestsListIndex,
                                                                                      ),
                                                                                      updateCallback: () => safeSetState(() {}),
                                                                                      child: InstrumentsDetailsWidget(
                                                                                        key: Key(
                                                                                          'Keytdi_${instrumentsTestsListIndex.toString()}',
                                                                                        ),
                                                                                        instrumentTestName: getJsonField(
                                                                                          instrumentsTestsListItem,
                                                                                          r'''$.instrument_name''',
                                                                                        ).toString(),
                                                                                        index: instrumentsTestsListIndex,
                                                                                        instrumentJson: instrumentsTestsListItem,
                                                                                        isLabInstrument: false,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            if (_model.instrumentLength >=
                                                                                18)
                                                                              FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  logFirebaseEvent('INSTRUMENTS_PAGE_AddButton_ON_TAP');
                                                                                  var _shouldSetState = false;
                                                                                  logFirebaseEvent('AddButton_backend_call');
                                                                                  _model.extraInstrumentz = await InstrumentsTestsGroup.getInstrumentsTestsCall.call(
                                                                                    limit: _model.instrumentLength + 12,
                                                                                  );

                                                                                  _shouldSetState = true;
                                                                                  if ((_model.extraInstrumentz?.succeeded ?? true)) {
                                                                                    logFirebaseEvent('AddButton_update_page_state');
                                                                                    _model.instrumentsListFromAPI = InstrumentsTestsGroup.getInstrumentsTestsCall.instrumentsTests(
                                                                                      (_model.extraInstrumentz?.jsonBody ?? ''),
                                                                                    );
                                                                                    _model.instrumentLength = InstrumentsTestsGroup.getInstrumentsTestsCall.count(
                                                                                      (_model.extraInstrumentz?.jsonBody ?? ''),
                                                                                    )!;
                                                                                    safeSetState(() {});
                                                                                    if (_shouldSetState) safeSetState(() {});
                                                                                    return;
                                                                                  } else {
                                                                                    if (_shouldSetState) safeSetState(() {});
                                                                                    return;
                                                                                  }

                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'rnul1obx' /* Show More Instruments */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  width: 200.0,
                                                                                  height: 40.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                        font: FlutterFlowTheme.of(context).labelLarge,
                                                                                        color: FlutterFlowTheme.of(context).buttonText,
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
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if ((_model.searchITextController
                                                                        .text !=
                                                                    '') &&
                                                            _model.activeSearch)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        valueOrDefault<
                                                                            double>(
                                                                          () {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return 100.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return 70.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return 30.0;
                                                                            } else {
                                                                              return 30.0;
                                                                            }
                                                                          }(),
                                                                          0.0,
                                                                        )),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (_model
                                                                          .resultInstrumentsFromAPI
                                                                          .isNotEmpty)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              20.0),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final instrumentsTestsList = _model.resultInstrumentsFromAPI.toList();

                                                                              return MasonryGridView.builder(
                                                                                physics: const NeverScrollableScrollPhysics(),
                                                                                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                                                  crossAxisCount: valueOrDefault<int>(
                                                                                    () {
                                                                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                        return 1;
                                                                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                        return 2;
                                                                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                        return 3;
                                                                                      } else {
                                                                                        return 3;
                                                                                      }
                                                                                    }(),
                                                                                    2,
                                                                                  ),
                                                                                ),
                                                                                crossAxisSpacing: 20.0,
                                                                                mainAxisSpacing: 20.0,
                                                                                itemCount: instrumentsTestsList.length,
                                                                                padding: EdgeInsets.fromLTRB(
                                                                                  0,
                                                                                  0,
                                                                                  0,
                                                                                  10.0,
                                                                                ),
                                                                                shrinkWrap: true,
                                                                                itemBuilder: (context, instrumentsTestsListIndex) {
                                                                                  final instrumentsTestsListItem = instrumentsTestsList[instrumentsTestsListIndex];
                                                                                  return wrapWithModel(
                                                                                    model: _model.instrumentsDetailsModels2.getModel(
                                                                                      instrumentsTestsListIndex.toString(),
                                                                                      instrumentsTestsListIndex,
                                                                                    ),
                                                                                    updateCallback: () => safeSetState(() {}),
                                                                                    child: InstrumentsDetailsWidget(
                                                                                      key: Key(
                                                                                        'Keyzma_${instrumentsTestsListIndex.toString()}',
                                                                                      ),
                                                                                      instrumentTestName: getJsonField(
                                                                                        instrumentsTestsListItem,
                                                                                        r'''$.instrument_name''',
                                                                                      ).toString(),
                                                                                      index: instrumentsTestsListIndex,
                                                                                      instrumentJson: instrumentsTestsListItem,
                                                                                      isLabInstrument: false,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      if (!(_model
                                                                          .resultInstrumentsFromAPI
                                                                          .isNotEmpty))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              20.0),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.dataNotFoundCOmponentModel,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: DataNotFoundCOmponentWidget(),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                              resources: true,
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
