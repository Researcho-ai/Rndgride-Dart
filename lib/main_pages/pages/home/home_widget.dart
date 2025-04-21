import '/backend/api_requests/api_calls.dart';
import '/components/customer_feedback_mobile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/components/customer_feedback_web/customer_feedback_web_widget.dart';
import '/main_pages/components/requerment_button/requerment_button_widget.dart';
import '/main_pages/components/user_requirement_copy/user_requirement_copy_widget.dart';
import '/nav_bars/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/nav_bars/drawer/drawer_widget.dart';
import '/nav_bars/footer/footer_widget.dart';
import '/nav_bars/footer_mobile/footer_mobile_widget.dart';
import '/nav_bars/top_nav_bar/top_nav_bar_widget.dart';
import '/resources/components/data_not_found_c_omponent/data_not_found_c_omponent_widget.dart';
import '/resources/components/instruments_details/instruments_details_widget.dart';
import '/resources/components/sophisticated_instrument_component/sophisticated_instrument_component_widget.dart';
import '/resources/components/test_details/test_details_widget.dart';
import 'dart:async';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = 'home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_Home_ON_INIT_STATE');
      await Future.wait([
        Future(() async {}),
        Future(() async {
          if (() {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return false;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return false;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return true;
            } else {
              return true;
            }
          }()) {
            logFirebaseEvent('Home_backend_call');
            _model.sophisticatedInstrumentDesktop = await InstrumentsTestsGroup
                .getSophisticatedInstrumentsTestsCall
                .call(
              limit: 8,
            );

            if ((_model.sophisticatedInstrumentDesktop?.succeeded ?? true)) {
              logFirebaseEvent('Home_update_app_state');
              FFAppState().sophisticatedInstruments = InstrumentsTestsGroup
                  .getSophisticatedInstrumentsTestsCall
                  .instruments(
                (_model.sophisticatedInstrumentDesktop?.jsonBody ?? ''),
              );
              safeSetState(() {});
              logFirebaseEvent('Home_update_page_state');
              _model.showSophisticated = true;
              safeSetState(() {});
              return;
            } else {
              return;
            }
          } else {
            logFirebaseEvent('Home_backend_call');
            _model.sophisticatedInstrumentsMobile = await InstrumentsTestsGroup
                .getSophisticatedInstrumentsTestsCall
                .call(
              limit: 6,
            );

            if ((_model.sophisticatedInstrumentsMobile?.succeeded ?? true)) {
              logFirebaseEvent('Home_update_app_state');
              FFAppState().sophisticatedInstruments = InstrumentsTestsGroup
                  .getSophisticatedInstrumentsTestsCall
                  .instruments(
                (_model.sophisticatedInstrumentsMobile?.jsonBody ?? ''),
              );
              safeSetState(() {});
              logFirebaseEvent('Home_update_page_state');
              _model.showSophisticated = true;
              safeSetState(() {});
              return;
            } else {
              return;
            }
          }
        }),
        Future(() async {
          logFirebaseEvent('Home_backend_call');
          _model.instrumentsFromAPI =
              await InstrumentsTestsGroup.getInstrumentsTestsCall.call(
            limit: 5,
          );

          if ((_model.instrumentsFromAPI?.succeeded ?? true)) {
            logFirebaseEvent('Home_update_app_state');
            FFAppState().InstrumentsList =
                InstrumentsTestsGroup.getInstrumentsTestsCall.instrumentsTests(
              (_model.instrumentsFromAPI?.jsonBody ?? ''),
            );
            safeSetState(() {});
            return;
          }
        }),
        Future(() async {
          logFirebaseEvent('Home_backend_call');
          _model.getFields = await TestsGroup.getFiedsCall.call(
            limit: 5,
          );

          if ((_model.getFields?.succeeded ?? true)) {
            logFirebaseEvent('Home_update_app_state');
            FFAppState().testsList = TestsGroup.getFiedsCall
                .fields(
                  (_model.getFields?.jsonBody ?? ''),
                )!
                .toList()
                .cast<dynamic>();
            safeSetState(() {});
            return;
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

    _model.textFieldTextController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
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
        title: 'RNDgrid',
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
                    title: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'h22l0zy0' /* RNDgrid.com */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: Colors.white,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ],
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
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        60.0, 0.0, 60.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
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
                                      ],
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 24.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 24.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 8.0;
                                          } else {
                                            return 8.0;
                                          }
                                        }(),
                                        0.0,
                                      ),
                                      0.0,
                                      valueOrDefault<double>(
                                        () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 24.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 24.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 48.0;
                                          } else {
                                            return 48.0;
                                          }
                                        }(),
                                        0.0,
                                      )),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .iconBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 40.0, 0.0, 40.0),
                                          child: SafeArea(
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
                                                      0.7);
                                                } else {
                                                  return (MediaQuery.sizeOf(
                                                              context)
                                                          .width *
                                                      0.7);
                                                }
                                              }(),
                                              constraints: BoxConstraints(
                                                minHeight: 300.0,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'rl4agx8j' /* For research & innovation 
foc... */
                                                              ,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'i09efrwm' /* Find R&D labs, instruments, an... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  24.0,
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 16.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 24.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 24.0;
                                                                      } else {
                                                                        return 24.0;
                                                                      }
                                                                    }(),
                                                                    0.0,
                                                                  )),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.4,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textFieldTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldFocusNode,
                                                                    onFieldSubmitted:
                                                                        (_) async {
                                                                      logFirebaseEvent(
                                                                          'HOME_PAGE_TextField_ON_TEXTFIELD_SUBMIT');
                                                                      var _shouldSetState =
                                                                          false;
                                                                      if (_model
                                                                              .textFieldTextController
                                                                              .text !=
                                                                          ' ') {
                                                                        logFirebaseEvent(
                                                                            'TextField_update_page_state');
                                                                        _model.searchActive =
                                                                            true;
                                                                        _model.instrumentaTestResult =
                                                                            [];
                                                                        _model.testSearchList =
                                                                            [];
                                                                        _model.finaResourcesList =
                                                                            [];
                                                                        safeSetState(
                                                                            () {});
                                                                        await Future
                                                                            .wait([
                                                                          Future(
                                                                              () async {
                                                                            logFirebaseEvent('TextField_backend_call');
                                                                            _model.searchOutput =
                                                                                await InstrumentsTestsGroup.searchInstrumentTestCall.call(
                                                                              search: _model.textFieldTextController.text,
                                                                            );

                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.searchOutput?.succeeded ??
                                                                                true)) {
                                                                              logFirebaseEvent('TextField_update_page_state');
                                                                              _model.instrumentaTestResult = InstrumentsTestsGroup.searchInstrumentTestCall
                                                                                  .instruments(
                                                                                    (_model.searchOutput?.jsonBody ?? ''),
                                                                                  )!
                                                                                  .toList()
                                                                                  .cast<dynamic>();
                                                                              _model.count = _model.count +
                                                                                  valueOrDefault<int>(
                                                                                    InstrumentsTestsGroup.searchInstrumentTestCall.count(
                                                                                      (_model.searchOutput?.jsonBody ?? ''),
                                                                                    ),
                                                                                    0,
                                                                                  );
                                                                              safeSetState(() {});
                                                                            } else {
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }
                                                                          }),
                                                                          Future(
                                                                              () async {
                                                                            logFirebaseEvent('TextField_backend_call');
                                                                            _model.searhTest =
                                                                                await TestsGroup.searchTestCall.call(
                                                                              searchTerm: _model.textFieldTextController.text,
                                                                            );

                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.searhTest?.succeeded ??
                                                                                true)) {
                                                                              logFirebaseEvent('TextField_update_page_state');
                                                                              _model.testSearchList = getJsonField(
                                                                                (_model.searhTest?.jsonBody ?? ''),
                                                                                r'''$.tests''',
                                                                                true,
                                                                              )!
                                                                                  .toList()
                                                                                  .cast<dynamic>();
                                                                              _model.count = _model.count +
                                                                                  valueOrDefault<int>(
                                                                                    getJsonField(
                                                                                      (_model.searhTest?.jsonBody ?? ''),
                                                                                      r'''$.count''',
                                                                                    ),
                                                                                    0,
                                                                                  );
                                                                              safeSetState(() {});
                                                                            }
                                                                          }),
                                                                        ]);
                                                                      } else {
                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                        return;
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
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        '06qae4g9' /* Search  Instruments/Tests... */,
                                                                      ),
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodySmallFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      prefixIcon:
                                                                          Icon(
                                                                        FFIcons
                                                                            .ksearch,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                    validator: _model
                                                                        .textFieldTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (_model
                                                                      .textFieldTextController
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
                                                                          'HOME_PAGE_Icon_me3vrqb1_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Icon_clear_text_fields_pin_codes');
                                                                      safeSetState(
                                                                          () {
                                                                        _model
                                                                            .textFieldTextController
                                                                            ?.clear();
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Icon_update_page_state');
                                                                      _model.searchActive =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .kcross,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 16.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 24.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 28.0;
                                                                      } else {
                                                                        return 28.0;
                                                                      }
                                                                    }(),
                                                                    0.0,
                                                                  ),
                                                                  0.0,
                                                                  0.0),
                                                      child: MasonryGridView
                                                          .builder(
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        gridDelegate:
                                                            SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 3,
                                                        ),
                                                        crossAxisSpacing: 20.0,
                                                        mainAxisSpacing: 20.0,
                                                        itemCount: 3,
                                                        shrinkWrap: true,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return [
                                                            () => Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Icon(
                                                                      FFIcons
                                                                          .ksearch,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          40.0,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '3352kfsb' /* Search */,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                            () => Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Icon(
                                                                      FFIcons
                                                                          .kcompare,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          40.0,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '4v183wv0' /* Compare labs */,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                            () => Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Icon(
                                                                      FFIcons
                                                                          .kcall,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          40.0,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'rjzos1fi' /* Contact lab */,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                          ][index]();
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
                                  ),
                                ),
                                if ((_model.searchActive == true) &&
                                    (_model.textFieldTextController.text !=
                                            ''))
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Container(
                                      width: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return (MediaQuery.sizeOf(context)
                                                  .width *
                                              0.9);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return (MediaQuery.sizeOf(context)
                                                  .width *
                                              0.8);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return (MediaQuery.sizeOf(context)
                                                  .width *
                                              0.8);
                                        } else {
                                          return (MediaQuery.sizeOf(context)
                                                  .width *
                                              0.8);
                                        }
                                      }(),
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0,
                                                    0.0,
                                                    0.0,
                                                    valueOrDefault<double>(
                                                      () {
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            kBreakpointSmall) {
                                                          return 8.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointMedium) {
                                                          return 16.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointLarge) {
                                                          return 24.0;
                                                        } else {
                                                          return 24.0;
                                                        }
                                                      }(),
                                                      24.0,
                                                    )),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SelectionArea(
                                                    child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'rk0agkm2' /* Search Results */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmallFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily),
                                                      ),
                                                )),
                                              ],
                                            ),
                                          ),
                                          if (_model
                                              .instrumentaTestResult.isNotEmpty)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0,
                                                      0.0,
                                                      0.0,
                                                      valueOrDefault<double>(
                                                        () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall) {
                                                            return 6.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium) {
                                                            return 12.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointLarge) {
                                                            return 18.0;
                                                          } else {
                                                            return 18.0;
                                                          }
                                                        }(),
                                                        24.0,
                                                      )),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SelectionArea(
                                                      child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '4dmjkr8w' /* Instruments */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                                  )),
                                                ],
                                              ),
                                            ),
                                          if (_model
                                              .instrumentaTestResult.isNotEmpty)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 20.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final instrumentsTestsList =
                                                      _model
                                                          .instrumentaTestResult
                                                          .toList()
                                                          .take(6)
                                                          .toList();

                                                  return MasonryGridView
                                                      .builder(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    gridDelegate:
                                                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount:
                                                          valueOrDefault<int>(
                                                        () {
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
                                                    itemCount:
                                                        instrumentsTestsList
                                                            .length,
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      0,
                                                      0,
                                                      10.0,
                                                    ),
                                                    shrinkWrap: true,
                                                    itemBuilder: (context,
                                                        instrumentsTestsListIndex) {
                                                      final instrumentsTestsListItem =
                                                          instrumentsTestsList[
                                                              instrumentsTestsListIndex];
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (!getJsonField(
                                                            instrumentsTestsListItem,
                                                            r'''$.is_sophisticated''',
                                                          ))
                                                            Flexible(
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .instrumentsDetailsModels1
                                                                    .getModel(
                                                                  instrumentsTestsListIndex
                                                                      .toString(),
                                                                  instrumentsTestsListIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    InstrumentsDetailsWidget(
                                                                  key: Key(
                                                                    'Keyjbl_${instrumentsTestsListIndex.toString()}',
                                                                  ),
                                                                  instrumentTestName:
                                                                      getJsonField(
                                                                    instrumentsTestsListItem,
                                                                    r'''$.instrument_name''',
                                                                  ).toString(),
                                                                  index:
                                                                      instrumentsTestsListIndex,
                                                                  instrumentJson:
                                                                      instrumentsTestsListItem,
                                                                  isLabInstrument:
                                                                      false,
                                                                ),
                                                              ),
                                                            ),
                                                          if (getJsonField(
                                                            instrumentsTestsListItem,
                                                            r'''$.is_sophisticated''',
                                                          ))
                                                            Flexible(
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .sophisticatedInstrumentComponentModels1
                                                                    .getModel(
                                                                  instrumentsTestsListItem
                                                                      .toString(),
                                                                  instrumentsTestsListIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    SophisticatedInstrumentComponentWidget(
                                                                  key: Key(
                                                                    'Keyi9h_${instrumentsTestsListItem.toString()}',
                                                                  ),
                                                                  imageURL:
                                                                      getJsonField(
                                                                    instrumentsTestsListItem,
                                                                    r'''$.image_dark''',
                                                                  ).toString(),
                                                                  instrumentJson:
                                                                      instrumentsTestsListItem,
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          if (_model.testSearchList.isNotEmpty)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0,
                                                      0.0,
                                                      0.0,
                                                      valueOrDefault<double>(
                                                        () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall) {
                                                            return 6.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium) {
                                                            return 12.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointLarge) {
                                                            return 18.0;
                                                          } else {
                                                            return 18.0;
                                                          }
                                                        }(),
                                                        24.0,
                                                      )),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SelectionArea(
                                                      child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'w87m02gc' /* Tests */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                                  )),
                                                ],
                                              ),
                                            ),
                                          if (_model.testSearchList.isNotEmpty)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 20.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final searcTestsList = _model
                                                      .testSearchList
                                                      .toList()
                                                      .take(6)
                                                      .toList();

                                                  return MasonryGridView
                                                      .builder(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    gridDelegate:
                                                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount:
                                                          valueOrDefault<int>(
                                                        () {
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
                                                    itemCount:
                                                        searcTestsList.length,
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      0,
                                                      0,
                                                      10.0,
                                                    ),
                                                    shrinkWrap: true,
                                                    itemBuilder: (context,
                                                        searcTestsListIndex) {
                                                      final searcTestsListItem =
                                                          searcTestsList[
                                                              searcTestsListIndex];
                                                      return TestDetailsWidget(
                                                        key: Key(
                                                            'Keyynk_${searcTestsListIndex}_of_${searcTestsList.length}'),
                                                        testName: getJsonField(
                                                          searcTestsListItem,
                                                          r'''$.field.field_name''',
                                                        ).toString(),
                                                        index:
                                                            searcTestsListIndex,
                                                        testJson:
                                                            searcTestsListItem,
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          if (!(_model.instrumentaTestResult
                                                  .isNotEmpty) ||
                                              (_model.count <= 0) ||
                                              !(_model
                                                  .testSearchList.isNotEmpty))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 20.0),
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .dataNotFoundCOmponentModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      DataNotFoundCOmponentWidget(
                                                    isJobs: false,
                                                    isLoad: false,
                                                    refresh:
                                                        _model.searchActive,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
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
                                            return 24.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 32.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 48.0;
                                          } else {
                                            return 48.0;
                                          }
                                        }(),
                                        0.0,
                                      )),
                                  child: SafeArea(
                                    child: Container(
                                      width: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return (MediaQuery.sizeOf(context)
                                                  .width *
                                              0.9);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return (MediaQuery.sizeOf(context)
                                                  .width *
                                              0.8);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return (MediaQuery.sizeOf(context)
                                                  .width *
                                              0.8);
                                        } else {
                                          return (MediaQuery.sizeOf(context)
                                                  .width *
                                              0.8);
                                        }
                                      }(),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.05,
                                              0.0,
                                            ),
                                            48.0,
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.05,
                                              0.0,
                                            ),
                                            48.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '1e970197' /* Sophisticated instruments */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily),
                                                              ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'HOME_PAGE_Row_m7u5306g_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Row_navigate_to');

                                                        context.pushNamed(
                                                            SophisticatedInstrumentWidget
                                                                .routeName);
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                          ))
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '6mx7gdev' /* view all */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelLargeFamily),
                                                                  ),
                                                            ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Icon(
                                                              FFIcons
                                                                  .karrowRight,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '3t3ymk2r' /* Access and book cutting-edge s... */,
                                                        ),
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
                                                  ],
                                                ),
                                              ),
                                              if (FFAppState()
                                                      .sophisticatedInstruments !=
                                                  null)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 24.0, 0.0, 24.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Visibility(
                                                      visible: FFAppState()
                                                              .sophisticatedInstruments !=
                                                          null,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final sophisticatedInstrumentList =
                                                                FFAppState()
                                                                    .sophisticatedInstruments
                                                                    .toList()
                                                                    .take(8)
                                                                    .toList();

                                                            return MasonryGridView
                                                                .builder(
                                                              physics:
                                                                  const NeverScrollableScrollPhysics(),
                                                              gridDelegate:
                                                                  SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 1;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 3;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 4;
                                                                  } else {
                                                                    return 4;
                                                                  }
                                                                }(),
                                                              ),
                                                              crossAxisSpacing:
                                                                  20.0,
                                                              mainAxisSpacing:
                                                                  20.0,
                                                              itemCount:
                                                                  sophisticatedInstrumentList
                                                                      .length,
                                                              shrinkWrap: true,
                                                              itemBuilder: (context,
                                                                  sophisticatedInstrumentListIndex) {
                                                                final sophisticatedInstrumentListItem =
                                                                    sophisticatedInstrumentList[
                                                                        sophisticatedInstrumentListIndex];
                                                                return wrapWithModel(
                                                                  model: _model
                                                                      .sophisticatedInstrumentComponentModels2
                                                                      .getModel(
                                                                    sophisticatedInstrumentListIndex
                                                                        .toString(),
                                                                    sophisticatedInstrumentListIndex,
                                                                  ),
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      SophisticatedInstrumentComponentWidget(
                                                                    key: Key(
                                                                      'Keywf6_${sophisticatedInstrumentListIndex.toString()}',
                                                                    ),
                                                                    imageURL:
                                                                        getJsonField(
                                                                      sophisticatedInstrumentListItem,
                                                                      r'''$.image_dark''',
                                                                    ).toString(),
                                                                    instrumentJson:
                                                                        sophisticatedInstrumentListItem,
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      0.0,
                                      0.0,
                                      valueOrDefault<double>(
                                        () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 24.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 32.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 48.0;
                                          } else {
                                            return 48.0;
                                          }
                                        }(),
                                        48.0,
                                      )),
                                  child: Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return (MediaQuery.sizeOf(context)
                                                .width *
                                            0.9);
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return (MediaQuery.sizeOf(context)
                                                .width *
                                            0.8);
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return (MediaQuery.sizeOf(context)
                                                .width *
                                            0.8);
                                      } else {
                                        return (MediaQuery.sizeOf(context)
                                                .width *
                                            0.8);
                                      }
                                    }(),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SelectionArea(
                                                  child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ytd3ulpa' /* Explore instruments */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily),
                                                        ),
                                              )),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'HOME_PAGE_Row_catzwgun_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Row_navigate_to');

                                                  context.pushNamed(
                                                      InstrumentsWidget
                                                          .routeName);
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        's91xnnfm' /* view all */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily),
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Icon(
                                                        FFIcons.karrowRight,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  0.0,
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 8.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 16.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 24.0;
                                                      } else {
                                                        return 24.0;
                                                      }
                                                    }(),
                                                    24.0,
                                                  )),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'tniqbazd' /* Find and utilize a variety of ... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (FFAppState().InstrumentsList !=
                                            null)
                                          Builder(
                                            builder: (context) {
                                              final instrumentTestList =
                                                  FFAppState()
                                                      .InstrumentsList
                                                      .toList()
                                                      .take(5)
                                                      .toList();

                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: List.generate(
                                                      instrumentTestList.length,
                                                      (instrumentTestListIndex) {
                                                    final instrumentTestListItem =
                                                        instrumentTestList[
                                                            instrumentTestListIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  8.0,
                                                                  20.0,
                                                                  8.0),
                                                      child: Container(
                                                        width: () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall) {
                                                            return 320.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium) {
                                                            return 350.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointLarge) {
                                                            return 400.0;
                                                          } else {
                                                            return 400.0;
                                                          }
                                                        }(),
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .instrumentsDetailsModels2
                                                              .getModel(
                                                            instrumentTestListIndex
                                                                .toString(),
                                                            instrumentTestListIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              InstrumentsDetailsWidget(
                                                            key: Key(
                                                              'Keynd5_${instrumentTestListIndex.toString()}',
                                                            ),
                                                            instrumentTestName:
                                                                getJsonField(
                                                              instrumentTestListItem,
                                                              r'''$.instrument_name''',
                                                            ).toString(),
                                                            index:
                                                                instrumentTestListIndex,
                                                            instrumentJson:
                                                                instrumentTestListItem,
                                                            isLabInstrument:
                                                                false,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              );
                                            },
                                          ),
                                      ],
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
                                            return 24.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 32.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 48.0;
                                          } else {
                                            return 48.0;
                                          }
                                        }(),
                                        48.0,
                                      )),
                                  child: Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return (MediaQuery.sizeOf(context)
                                                .width *
                                            0.9);
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return (MediaQuery.sizeOf(context)
                                                .width *
                                            0.8);
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return (MediaQuery.sizeOf(context)
                                                .width *
                                            0.8);
                                      } else {
                                        return (MediaQuery.sizeOf(context)
                                                .width *
                                            0.8);
                                      }
                                    }(),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SelectionArea(
                                                  child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ftdzm7nw' /* Explore Tests */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily),
                                                        ),
                                              )),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'HOME_PAGE_Row_ttjui87p_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Row_navigate_to');

                                                  context.pushNamed(
                                                      InstrumentsWidget
                                                          .routeName);
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ubjz0opy' /* view all */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily),
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Icon(
                                                        FFIcons.karrowRight,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  0.0,
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 8.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 16.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 24.0;
                                                      } else {
                                                        return 24.0;
                                                      }
                                                    }(),
                                                    24.0,
                                                  )),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '3qye1nn8' /* Find and utilize a variety of ... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (FFAppState().testsList.isNotEmpty)
                                          Builder(
                                            builder: (context) {
                                              final testList = FFAppState()
                                                  .testsList
                                                  .toList()
                                                  .take(5)
                                                  .toList();

                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: List.generate(
                                                      testList.length,
                                                      (testListIndex) {
                                                    final testListItem =
                                                        testList[testListIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  8.0,
                                                                  20.0,
                                                                  8.0),
                                                      child: Container(
                                                        width: () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall) {
                                                            return 320.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium) {
                                                            return 350.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointLarge) {
                                                            return 400.0;
                                                          } else {
                                                            return 400.0;
                                                          }
                                                        }(),
                                                        decoration:
                                                            BoxDecoration(),
                                                        child:
                                                            TestDetailsWidget(
                                                          key: Key(
                                                              'Key06l_${testListIndex}_of_${testList.length}'),
                                                          testName:
                                                              getJsonField(
                                                            testListItem,
                                                            r'''$.field_name''',
                                                          ).toString(),
                                                          index: testListIndex,
                                                          testJson:
                                                              testListItem,
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              );
                                            },
                                          ),
                                      ],
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
                                            return 24.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 32.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 48.0;
                                          } else {
                                            return 48.0;
                                          }
                                        }(),
                                        48.0,
                                      )),
                                  child: SafeArea(
                                    child: Container(
                                      width: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return (MediaQuery.sizeOf(context)
                                                  .width *
                                              0.9);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return (MediaQuery.sizeOf(context)
                                                  .width *
                                              0.8);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return (MediaQuery.sizeOf(context)
                                                  .width *
                                              0.8);
                                        } else {
                                          return (MediaQuery.sizeOf(context)
                                                  .width *
                                              0.8);
                                        }
                                      }(),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius: BorderRadius.circular(
                                            valueOrDefault<double>(
                                          Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? 16.0
                                              : 0.0,
                                          0.0,
                                        )),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0,
                                                    0.0,
                                                    0.0,
                                                    valueOrDefault<double>(
                                                      () {
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            kBreakpointSmall) {
                                                          return 16.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointMedium) {
                                                          return 24.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointLarge) {
                                                          return 32.0;
                                                        } else {
                                                          return 32.0;
                                                        }
                                                      }(),
                                                      32.0,
                                                    )),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'gmhvzvnc' /* Why researchers choose us */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: MasonryGridView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: () {
                                                  if (MediaQuery.sizeOf(context)
                                                          .width <
                                                      kBreakpointSmall) {
                                                    return 1;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointMedium) {
                                                    return 2;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointLarge) {
                                                    return 3;
                                                  } else {
                                                    return 3;
                                                  }
                                                }(),
                                              ),
                                              itemCount: 3,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return [
                                                  () => Container(
                                                        height: () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall) {
                                                            return 200.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium) {
                                                            return 240.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointLarge) {
                                                            return 280.0;
                                                          } else {
                                                            return 280.0;
                                                          }
                                                        }(),
                                                        constraints:
                                                            BoxConstraints(
                                                          minHeight: 150.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .border,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                    desktop:
                                                                        false,
                                                                  ))
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Visibility(
                                                                          visible:
                                                                              responsiveVisibility(
                                                                            context:
                                                                                context,
                                                                            phone:
                                                                                false,
                                                                            tablet:
                                                                                false,
                                                                            tabletLandscape:
                                                                                false,
                                                                            desktop:
                                                                                false,
                                                                          ),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              'assets/images/clock_fill.svg',
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  Container(
                                                                    width: () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 60.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 70.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 90.0;
                                                                      } else {
                                                                        return 90.0;
                                                                      }
                                                                    }(),
                                                                    height: () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 60.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 70.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 90.0;
                                                                      } else {
                                                                        return 90.0;
                                                                      }
                                                                    }(),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        width:
                                                                            6.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 50.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 70.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 80.0;
                                                                        } else {
                                                                          return 80.0;
                                                                        }
                                                                      }(),
                                                                      height:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 50.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 70.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 80.0;
                                                                        } else {
                                                                          return 80.0;
                                                                        }
                                                                      }(),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .iconBackground,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          if (() {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return false;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return false;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return true;
                                                                            } else {
                                                                              return true;
                                                                            }
                                                                          }())
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Icon(
                                                                                  FFIcons.kclock,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 32.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (() {
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
                                                                          }())
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Icon(
                                                                                  FFIcons.kclock,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 32.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '9vbn3m5h' /* Save time in finding facilitie... */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                  () => Container(
                                                        height: () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall) {
                                                            return 200.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium) {
                                                            return 240.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointLarge) {
                                                            return 280.0;
                                                          } else {
                                                            return 280.0;
                                                          }
                                                        }(),
                                                        constraints:
                                                            BoxConstraints(
                                                          minHeight: 150.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .border,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                    desktop:
                                                                        false,
                                                                  ))
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            70.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              SvgPicture.asset(
                                                                            'assets/images/star_fill.svg',
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  Container(
                                                                    width: () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 60.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 70.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 90.0;
                                                                      } else {
                                                                        return 90.0;
                                                                      }
                                                                    }(),
                                                                    height: () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 60.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 70.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 90.0;
                                                                      } else {
                                                                        return 90.0;
                                                                      }
                                                                    }(),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        width:
                                                                            6.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 50.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 70.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 80.0;
                                                                        } else {
                                                                          return 80.0;
                                                                        }
                                                                      }(),
                                                                      height:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 50.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 70.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 80.0;
                                                                        } else {
                                                                          return 80.0;
                                                                        }
                                                                      }(),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .iconBackground,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          if (() {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return false;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return false;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return true;
                                                                            } else {
                                                                              return true;
                                                                            }
                                                                          }())
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Icon(
                                                                                  FFIcons.kstar,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 32.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (() {
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
                                                                          }())
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Icon(
                                                                                  FFIcons.kstar,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 32.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'mwfc4vor' /* Transparent pricing and fair r... */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                  () => Container(
                                                        height: () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall) {
                                                            return 200.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium) {
                                                            return 240.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointLarge) {
                                                            return 280.0;
                                                          } else {
                                                            return 280.0;
                                                          }
                                                        }(),
                                                        constraints:
                                                            BoxConstraints(
                                                          minHeight: 150.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .border,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                    desktop:
                                                                        false,
                                                                  ))
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              SvgPicture.asset(
                                                                            'assets/images/atom_fill.svg',
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  Container(
                                                                    width: () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 60.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 70.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 90.0;
                                                                      } else {
                                                                        return 90.0;
                                                                      }
                                                                    }(),
                                                                    height: () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 60.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 70.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 90.0;
                                                                      } else {
                                                                        return 90.0;
                                                                      }
                                                                    }(),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        width:
                                                                            6.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 50.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 70.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 80.0;
                                                                        } else {
                                                                          return 80.0;
                                                                        }
                                                                      }(),
                                                                      height:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 50.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 70.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 80.0;
                                                                        } else {
                                                                          return 80.0;
                                                                        }
                                                                      }(),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .iconBackground,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          if (() {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return false;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return false;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return true;
                                                                            } else {
                                                                              return true;
                                                                            }
                                                                          }())
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Icon(
                                                                                  FFIcons.katom,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 32.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (() {
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
                                                                          }())
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Icon(
                                                                                  FFIcons.katom,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 32.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'pc74x4mt' /* Vast network of Research and D... */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                ][index]();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 24.0),
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 1.0,
                                        decoration: BoxDecoration(
                                          color:
                                              FlutterFlowTheme.of(context).line,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 4.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'mpsqjpvy' /* We are supported by */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmallFamily),
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 24.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 70.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 75.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 80.0;
                                            } else {
                                              return 80.0;
                                            }
                                          }(),
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      () {
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            kBreakpointSmall) {
                                                          return 24.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointMedium) {
                                                          return 36.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointLarge) {
                                                          return 48.0;
                                                        } else {
                                                          return 48.0;
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
                                                          return 24.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointMedium) {
                                                          return 36.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointLarge) {
                                                          return 48.0;
                                                        } else {
                                                          return 48.0;
                                                        }
                                                      }(),
                                                      0.0,
                                                    ),
                                                    0.0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width:
                                                        valueOrDefault<double>(
                                                      () {
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            kBreakpointSmall) {
                                                          return 140.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointMedium) {
                                                          return 175.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointLarge) {
                                                          return 200.0;
                                                        } else {
                                                          return 200.0;
                                                        }
                                                      }(),
                                                      200.0,
                                                    ),
                                                    height: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 50.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 80.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 90.0;
                                                      } else {
                                                        return 90.0;
                                                      }
                                                    }(),
                                                    decoration: BoxDecoration(),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? 'assets/images/iHUB_Dark.png'
                                                            : 'assets/images/iHUB_Light.png',
                                                        width: 220.0,
                                                        height: 220.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        valueOrDefault<double>(
                                                      () {
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            kBreakpointSmall) {
                                                          return 140.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointMedium) {
                                                          return 175.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointLarge) {
                                                          return 200.0;
                                                        } else {
                                                          return 200.0;
                                                        }
                                                      }(),
                                                      200.0,
                                                    ),
                                                    height: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 70.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 100.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 100.0;
                                                      } else {
                                                        return 100.0;
                                                      }
                                                    }(),
                                                    decoration: BoxDecoration(),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? 'assets/images/GUSEC-removebg-preview.png'
                                                            : 'assets/images/GUSEC-removebg-preview.png',
                                                        width: 220.0,
                                                        height: 220.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        valueOrDefault<double>(
                                                      () {
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            kBreakpointSmall) {
                                                          return 140.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointMedium) {
                                                          return 175.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointLarge) {
                                                          return 200.0;
                                                        } else {
                                                          return 200.0;
                                                        }
                                                      }(),
                                                      200.0,
                                                    ),
                                                    height: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 70.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 100.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 100.0;
                                                      } else {
                                                        return 100.0;
                                                      }
                                                    }(),
                                                    decoration: BoxDecoration(),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? 'assets/images/StrongHer-removebg-preview.png'
                                                            : 'assets/images/StrongHer-removebg-preview.png',
                                                        width: 220.0,
                                                        height: 220.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        valueOrDefault<double>(
                                                      () {
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            kBreakpointSmall) {
                                                          return 140.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointMedium) {
                                                          return 175.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointLarge) {
                                                          return 200.0;
                                                        } else {
                                                          return 200.0;
                                                        }
                                                      }(),
                                                      200.0,
                                                    ),
                                                    height: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 70.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 100.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 100.0;
                                                      } else {
                                                        return 100.0;
                                                      }
                                                    }(),
                                                    decoration: BoxDecoration(),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? 'assets/images/PDEU_IIC-removebg-preview.png'
                                                            : 'assets/images/PDEU_IIC-removebg-preview.png',
                                                        width: 220.0,
                                                        height: 220.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        valueOrDefault<double>(
                                                      () {
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            kBreakpointSmall) {
                                                          return 140.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointMedium) {
                                                          return 175.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointLarge) {
                                                          return 200.0;
                                                        } else {
                                                          return 200.0;
                                                        }
                                                      }(),
                                                      200.0,
                                                    ),
                                                    height: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 50.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 80.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 90.0;
                                                      } else {
                                                        return 90.0;
                                                      }
                                                    }(),
                                                    decoration: BoxDecoration(),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? 'assets/images/herSTART-removebg-preview.png'
                                                            : 'assets/images/herSTART-removebg-preview.png',
                                                        width: 220.0,
                                                        height: 220.0,
                                                        fit: BoxFit.contain,
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
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).line,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 24.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 32.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 48.0;
                                          } else {
                                            return 48.0;
                                          }
                                        }(),
                                        0.0,
                                      ),
                                      0.0,
                                      valueOrDefault<double>(
                                        () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 24.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 32.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 48.0;
                                          } else {
                                            return 48.0;
                                          }
                                        }(),
                                        0.0,
                                      )),
                                  child: Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return (MediaQuery.sizeOf(context)
                                                .width *
                                            0.9);
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return (MediaQuery.sizeOf(context)
                                                .width *
                                            0.8);
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return (MediaQuery.sizeOf(context)
                                                .width *
                                            0.8);
                                      } else {
                                        return (MediaQuery.sizeOf(context)
                                                .width *
                                            0.8);
                                      }
                                    }(),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  0.0,
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 24.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 32.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 32.0;
                                                      } else {
                                                        return 32.0;
                                                      }
                                                    }(),
                                                    32.0,
                                                  )),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '793nprkg' /* What our customers say */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily),
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                        ))
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(),
                                                child: Visibility(
                                                  visible:
                                                      (((_model.pageViewCurrentIndex1 -
                                                                      1))
                                                                  .toString() !=
                                                              '-1') &&
                                                          responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                          ),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'HOME_PAGE_Icon_3smmznsk_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Icon_page_view');
                                                      await _model
                                                          .pageViewController1
                                                          ?.previousPage(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                      logFirebaseEvent(
                                                          'Icon_update_page_state');

                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      FFIcons.karrowLeft,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              16.0,
                                                              0.0,
                                                              valueOrDefault<
                                                                  double>(
                                                                () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 0.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 16.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 16.0;
                                                                  } else {
                                                                    return 16.0;
                                                                  }
                                                                }(),
                                                                0.0,
                                                              ),
                                                              0.0),
                                                  child: Container(
                                                    width: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 400.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 550.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 700.0;
                                                      } else {
                                                        return 700.0;
                                                      }
                                                    }(),
                                                    height: 400.0,
                                                    decoration: BoxDecoration(),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 24.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 36.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 48.0;
                                                                      } else {
                                                                        return 48.0;
                                                                      }
                                                                    }(),
                                                                    0.0,
                                                                  ),
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 24.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 36.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 48.0;
                                                                      } else {
                                                                        return 48.0;
                                                                      }
                                                                    }(),
                                                                    0.0,
                                                                  )),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 500.0,
                                                              child: PageView(
                                                                controller: _model
                                                                        .pageViewController1 ??=
                                                                    PageController(
                                                                        initialPage:
                                                                            0),
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            40.0,
                                                                            16.0,
                                                                            8.0,
                                                                            8.0),
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .customerFeedbackWebModel1,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          CustomerFeedbackWebWidget(
                                                                        profileImage:
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/codots-blj7r8/assets/tsino82aqb9t/WhatsApp_Image_2022-11-24_at_16.39.40-modified.png',
                                                                        name:
                                                                            'Vyom Desai,',
                                                                        affiliation:
                                                                            'Institute of Plasma Research',
                                                                        feedback:
                                                                            '“Hello, I am PhD student and required a few characterizations for my ongoing research activities.  While finding it, I came across Codots. My experience with them was nice, and the data received was fine. The procedure was simple.”',
                                                                        designation:
                                                                            'PhD Fellow',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            36.0,
                                                                            16.0,
                                                                            8.0,
                                                                            8.0),
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .customerFeedbackWebModel2,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          CustomerFeedbackWebWidget(
                                                                        profileImage:
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/codots-blj7r8/assets/k4x68fx6uv32/26756522_10204137034623225_7949056110658260532_o-modified.png',
                                                                        name:
                                                                            'Amit Srivastav,',
                                                                        affiliation:
                                                                            'Central University of Gujarat',
                                                                        feedback:
                                                                            '“I came across Codots post on LinkedIn, and they helped me in finding and scheduling NMR and XRD characterization facilities. Codots is a helpful platform for all researchers.”',
                                                                        designation:
                                                                            'Research Scholar',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            36.0,
                                                                            16.0,
                                                                            8.0,
                                                                            8.0),
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .customerFeedbackWebModel3,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          CustomerFeedbackWebWidget(
                                                                        profileImage:
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/codots-blj7r8/assets/v0v0b2wkexfp/WhatsApp_Image_2022-11-24_at_16.52.53-modified.png',
                                                                        name:
                                                                            'Sathya Reddy,',
                                                                        affiliation:
                                                                            'Homi Bhabha National Institute',
                                                                        feedback:
                                                                            '“I work in material engineering applications. So, I frequently require the characterization of various materials like metals, ceramics, and organics. Codots really helped me find leading industry-level test facilities. The procedure is quite simple yet affordable, which takes the burden away from fellow researchers.”',
                                                                        designation:
                                                                            'PhD Fellow',
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
                                                ),
                                              ),
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(),
                                                child: Visibility(
                                                  visible:
                                                      (((_model.pageViewCurrentIndex1 +
                                                                      1))
                                                                  .toString() !=
                                                              '3') &&
                                                          responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                          ),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'HOME_PAGE_Icon_eg2ll59i_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Icon_page_view');
                                                      await _model
                                                          .pageViewController1
                                                          ?.nextPage(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                      logFirebaseEvent(
                                                          'Icon_update_page_state');

                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      FFIcons.karrowRight,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (((_model.pageViewCurrentIndex2 -
                                                          1))
                                                      .toString() !=
                                                  '-1')
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'HOME_PAGE_Icon_g0b0p0sv_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_page_view');
                                                    await _model
                                                        .pageViewController2
                                                        ?.previousPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  },
                                                  child: Icon(
                                                    FFIcons.karrowLeft,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 28.0,
                                                  ),
                                                ),
                                              Flexible(
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall) {
                                                                      return 24.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointMedium) {
                                                                      return 36.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointLarge) {
                                                                      return 48.0;
                                                                    } else {
                                                                      return 48.0;
                                                                    }
                                                                  }(),
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall) {
                                                                      return 24.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointMedium) {
                                                                      return 36.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointLarge) {
                                                                      return 48.0;
                                                                    } else {
                                                                      return 48.0;
                                                                    }
                                                                  }(),
                                                                  0.0,
                                                                )),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 400.0,
                                                              child: PageView(
                                                                controller: _model
                                                                        .pageViewController2 ??=
                                                                    PageController(
                                                                        initialPage:
                                                                            0),
                                                                onPageChanged: (_) =>
                                                                    safeSetState(
                                                                        () {}),
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .customerFeedbackMobileModel1,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          CustomerFeedbackMobileWidget(
                                                                        profileImage:
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/codots-blj7r8/assets/tsino82aqb9t/WhatsApp_Image_2022-11-24_at_16.39.40-modified.png',
                                                                        name:
                                                                            'Vyom Desai,',
                                                                        affiliation:
                                                                            'Institute of Plasma Research',
                                                                        feedback:
                                                                            '“Hello, I am PhD student and required a few characterizations for my ongoing research activities.  While finding it, I came across Codots. My experience with them was nice, and the data received was fine. The procedure was simple.”',
                                                                        designation:
                                                                            'PhD Fellow',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .customerFeedbackMobileModel2,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          CustomerFeedbackMobileWidget(
                                                                        profileImage:
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/codots-blj7r8/assets/k4x68fx6uv32/26756522_10204137034623225_7949056110658260532_o-modified.png',
                                                                        name:
                                                                            'Amit Srivastav,',
                                                                        affiliation:
                                                                            'Central University of Gujarat',
                                                                        feedback:
                                                                            '“I came across Codots post on LinkedIn, and they helped me in finding and scheduling NMR and XRD characterization facilities. Codots is a helpful platform for all researchers.”',
                                                                        designation:
                                                                            'Research Scholar',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .customerFeedbackMobileModel3,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          CustomerFeedbackMobileWidget(
                                                                        profileImage:
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/codots-blj7r8/assets/v0v0b2wkexfp/WhatsApp_Image_2022-11-24_at_16.52.53-modified.png',
                                                                        name:
                                                                            'Sathya Reddy,',
                                                                        affiliation:
                                                                            'Homi Bhabha National Institute',
                                                                        feedback:
                                                                            '“I work in material engineering applications. So, I frequently require the characterization of various materials like metals, ceramics, and organics. Codots really helped me find leading industry-level test facilities. The procedure is quite simple yet affordable, which takes the burden away from fellow researchers.”',
                                                                        designation:
                                                                            'PhD fellow',
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
                                              ),
                                              if (((_model.pageViewCurrentIndex2 +
                                                          1))
                                                      .toString() !=
                                                  '3')
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'HOME_PAGE_Icon_h9py3bzs_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_page_view');
                                                    await _model
                                                        .pageViewController2
                                                        ?.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  },
                                                  child: Icon(
                                                    FFIcons.karrowRight,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 28.0,
                                                  ),
                                                ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .iconBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 48.0, 0.0, 48.0),
                                        child: Container(
                                          width: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return (MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.9);
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return (MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8);
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return (MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.7);
                                            } else {
                                              return (MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.7);
                                            }
                                          }(),
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0,
                                                        0.0,
                                                        valueOrDefault<double>(
                                                          () {
                                                            if (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                kBreakpointSmall) {
                                                              return 12.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointMedium) {
                                                              return 16.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointLarge) {
                                                              return 24.0;
                                                            } else {
                                                              return 24.0;
                                                            }
                                                          }(),
                                                          0.0,
                                                        ),
                                                        0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'cay2j0ra' /* 150+ */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineMediumFamily),
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'rvbr24e0' /* instruments */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0,
                                                        0.0,
                                                        valueOrDefault<double>(
                                                          () {
                                                            if (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                kBreakpointSmall) {
                                                              return 12.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointMedium) {
                                                              return 16.0;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointLarge) {
                                                              return 24.0;
                                                            } else {
                                                              return 24.0;
                                                            }
                                                          }(),
                                                          0.0,
                                                        ),
                                                        0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '5tyrg7tc' /* 300+ */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineMediumFamily),
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              's4jgn7h5' /* tests */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'aahaxb2i' /* 10+ */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineMediumFamily),
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '7fxl0gan' /* labs */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily),
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
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 24.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 32.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 48.0;
                                          } else {
                                            return 48.0;
                                          }
                                        }(),
                                        48.0,
                                      ),
                                      0.0,
                                      0.0),
                                  child: SafeArea(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius: BorderRadius.circular(
                                            valueOrDefault<double>(
                                          Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? 16.0
                                              : 0.0,
                                          0.0,
                                        )),
                                      ),
                                      child: Container(
                                        width: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.45);
                                          } else {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.45);
                                          }
                                        }(),
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 0.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 73.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 73.0;
                                                      } else {
                                                        return 73.0;
                                                      }
                                                    }(),
                                                    0.0,
                                                  ),
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 0.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 73.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 73.0;
                                                      } else {
                                                        return 73.0;
                                                      }
                                                    }(),
                                                    0.0,
                                                  ),
                                                  0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'p6wfhqya' /* How can we help you ? */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily),
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '2db0lfch' /* Please select an option below ... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 32.0, 0.0, 0.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .requermentButtonModel1,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: RequermentButtonWidget(
                                                    parameter2: _model
                                                        .contactUsButtomIndex,
                                                    text:
                                                        'Testing and Development Facility',
                                                    isHome: false,
                                                    hoverIndex: 1,
                                                    openForm: () async {
                                                      logFirebaseEvent(
                                                          'HOME_PAGE_Container_lrgjqtpf_CALLBACK');
                                                      logFirebaseEvent(
                                                          'requermentButton_update_page_state');
                                                      _model.contactUsButtomIndex =
                                                          1;
                                                      _model.tagValue =
                                                          'Testing and Devlopment Facility';
                                                      _model.openRequermentForm =
                                                          true;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .requermentButtonModel2,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: RequermentButtonWidget(
                                                    parameter2: _model
                                                        .contactUsButtomIndex,
                                                    text:
                                                        'Consultation and Analysis Services',
                                                    isHome: false,
                                                    hoverIndex: 2,
                                                    openForm: () async {
                                                      logFirebaseEvent(
                                                          'HOME_PAGE_Container_lt44e5l7_CALLBACK');
                                                      logFirebaseEvent(
                                                          'requermentButton_update_page_state');
                                                      _model.contactUsButtomIndex =
                                                          2;
                                                      _model.tagValue =
                                                          'Consultation and Analysis Services';
                                                      _model.openRequermentForm =
                                                          true;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'HOME_PAGE_Container_3ndrm3zv_ON_TAP');
                                                    logFirebaseEvent(
                                                        'requermentButton_update_page_state');

                                                    safeSetState(() {});
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .requermentButtonModel3,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        RequermentButtonWidget(
                                                      parameter2: _model
                                                          .contactUsButtomIndex,
                                                      text:
                                                          'Becoming a Lab Partner',
                                                      isHome: false,
                                                      hoverIndex: 3,
                                                      openForm: () async {
                                                        logFirebaseEvent(
                                                            'HOME_PAGE_Container_3ndrm3zv_CALLBACK');
                                                        logFirebaseEvent(
                                                            'requermentButton_update_page_state');
                                                        _model.contactUsButtomIndex =
                                                            3;
                                                        _model.tagValue =
                                                            'Becoming a Lab Partner';
                                                        _model.openRequermentForm =
                                                            true;
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.openRequermentForm)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 48.0, 0.0, 48.0),
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
                                                            0.9);
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width *
                                                            0.45);
                                                      } else {
                                                        return (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width *
                                                            0.45);
                                                      }
                                                    }(),
                                                    decoration: BoxDecoration(),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .userRequirementCopyModel,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          UserRequirementCopyWidget(
                                                        isDialog: false,
                                                        tagValue:
                                                            _model.tagValue,
                                                        requermwntDialog: false,
                                                        action: () async {
                                                          logFirebaseEvent(
                                                              'HOME_PAGE_Container_bbn5mb4v_CALLBACK');
                                                          logFirebaseEvent(
                                                              'UserRequirementCopy_update_page_state');
                                                          _model.openRequermentForm =
                                                              false;
                                                          safeSetState(() {});
                                                        },
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
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 48.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.footerModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: FooterWidget(),
                                ),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.footerMobileModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: FooterMobileWidget(),
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
                        child: Hero(
                          tag: 'NavBar',
                          transitionOnUserGestures: true,
                          child: Material(
                            color: Colors.transparent,
                            child: BottomNavBarWidget(
                              home: true,
                              resources: false,
                              job: false,
                              tools: false,
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
