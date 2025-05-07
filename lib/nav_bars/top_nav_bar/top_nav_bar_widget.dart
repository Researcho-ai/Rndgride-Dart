import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/onboarding/sign_in_compoent/sign_in_compoent_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'top_nav_bar_model.dart';
export 'top_nav_bar_model.dart';

class TopNavBarWidget extends StatefulWidget {
  const TopNavBarWidget({
    super.key,
    bool? instrument,
    bool? about,
    bool? contactus,
    bool? tests,
    bool? sophisticated,
  })  : this.instrument = instrument ?? false,
        this.about = about ?? false,
        this.contactus = contactus ?? false,
        this.tests = tests ?? false,
        this.sophisticated = sophisticated ?? false;

  final bool instrument;
  final bool about;
  final bool contactus;
  final bool tests;
  final bool sophisticated;

  @override
  State<TopNavBarWidget> createState() => _TopNavBarWidgetState();
}

class _TopNavBarWidgetState extends State<TopNavBarWidget> {
  late TopNavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopNavBarModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
      child: Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('TOP_NAV_BAR_COMP_lightMode_ON_TAP');
                  logFirebaseEvent('lightMode_navigate_to');

                  context.pushNamed(HomeWidget.routeName);

                  logFirebaseEvent('lightMode_update_app_state');
                  FFAppState().topnavBaronSelect = TopNavBarOnSelectStruct(
                    instruments: false,
                    home: true,
                    bookings: false,
                    history: false,
                    aboutUs: false,
                    contactUs: false,
                    forum: false,
                    community: false,
                  );
                  safeSetState(() {});
                },
                child: SvgPicture.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'assets/images/RNDgrid_Horizontal_Logo_Dark.svg'
                      : 'assets/images/RNDgrid_Horizontal_Logo_Light.svg',
                  width: 150.0,
                  height: 40.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'TOP_NAV_BAR_COMP_Column_2czshu1x_ON_TAP');
                      logFirebaseEvent('Column_navigate_to');

                      context.pushNamed(InstrumentsWidget.routeName);

                      logFirebaseEvent('Column_update_app_state');
                      FFAppState().topnavBaronSelect = TopNavBarOnSelectStruct(
                        instruments: true,
                        home: false,
                        bookings: false,
                        history: false,
                        aboutUs: false,
                        contactUs: false,
                        forum: false,
                        community: false,
                        lab: true,
                        jobs: false,
                      );
                      safeSetState(() {});
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 8.0, 15.0, 4.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '3v0sb94k' /* Instruments */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).titleSmall,
                                    color: widget.instrument ||
                                            _model
                                                .instrumentMouseRegionHovered1
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    fontSize: widget.instrument ||
                                            _model
                                                .instrumentMouseRegionHovered1
                                        ? 20.0
                                        : 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        if (widget.sophisticated ||
                            _model.instrumentMouseRegionHovered1)
                          SizedBox(
                            width: 100.0,
                            child: Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                      ],
                    ),
                  ),
                  onEnter: ((event) async {
                    safeSetState(
                        () => _model.instrumentMouseRegionHovered1 = true);
                  }),
                  onExit: ((event) async {
                    safeSetState(
                        () => _model.instrumentMouseRegionHovered1 = false);
                  }),
                ),
                MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'TOP_NAV_BAR_COMP_Column_1dgvrce3_ON_TAP');
                      logFirebaseEvent('Column_navigate_to');

                      context.goNamed(DevFacilitiesWidget.routeName);

                      logFirebaseEvent('Column_update_app_state');
                      FFAppState().topnavBaronSelect = TopNavBarOnSelectStruct(
                        instruments: true,
                        home: false,
                        bookings: false,
                        history: false,
                        aboutUs: false,
                        contactUs: false,
                        forum: false,
                        community: false,
                        lab: false,
                        jobs: false,
                      );
                      safeSetState(() {});
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 8.0, 15.0, 4.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'd2f0iqxd' /* Dev Facilities */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: FlutterFlowTheme.of(context).titleSmall,
                                  color: widget.instrument ||
                                          _model.instrumentMouseRegionHovered2
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  fontSize: widget.instrument ||
                                          _model.instrumentMouseRegionHovered2
                                      ? 20.0
                                      : 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        if (widget.instrument ||
                            _model.instrumentMouseRegionHovered2)
                          SizedBox(
                            width: 100.0,
                            child: Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                      ],
                    ),
                  ),
                  onEnter: ((event) async {
                    safeSetState(
                        () => _model.instrumentMouseRegionHovered2 = true);
                  }),
                  onExit: ((event) async {
                    safeSetState(
                        () => _model.instrumentMouseRegionHovered2 = false);
                  }),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                  child: MouseRegion(
                    opaque: false,
                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'TOP_NAV_BAR_COMP_Column_szovlnxc_ON_TAP');
                        logFirebaseEvent('Column_navigate_to');

                        context.goNamed(SectorsWidget.routeName);

                        logFirebaseEvent('Column_update_app_state');
                        FFAppState().topnavBaronSelect =
                            TopNavBarOnSelectStruct(
                          instruments: false,
                          home: false,
                          bookings: false,
                          history: true,
                          aboutUs: false,
                          contactUs: false,
                          forum: false,
                          community: false,
                          lab: false,
                          jobs: false,
                        );
                        safeSetState(() {});
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 8.0, 15.0, 4.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '0e1v881w' /* Sectors */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).titleSmall,
                                    color: widget.instrument ||
                                            _model.testMouseRegionHovered
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    fontSize: widget.instrument ||
                                            _model.testMouseRegionHovered
                                        ? 20.0
                                        : 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          if (widget.tests || _model.testMouseRegionHovered)
                            SizedBox(
                              width: 80.0,
                              child: Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                        ],
                      ),
                    ),
                    onEnter: ((event) async {
                      safeSetState(() => _model.testMouseRegionHovered = true);
                    }),
                    onExit: ((event) async {
                      safeSetState(() => _model.testMouseRegionHovered = false);
                    }),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                  child: MouseRegion(
                    opaque: false,
                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'TOP_NAV_BAR_COMP_Column_5hmpiux0_ON_TAP');
                        logFirebaseEvent('Column_navigate_to');

                        context.pushNamed(AboutUsWidget.routeName);

                        logFirebaseEvent('Column_update_app_state');
                        FFAppState().topnavBaronSelect =
                            TopNavBarOnSelectStruct(
                          instruments: false,
                          home: false,
                          bookings: false,
                          history: false,
                          aboutUs: true,
                          contactUs: false,
                          forum: false,
                          community: false,
                          lab: false,
                          jobs: false,
                        );
                        safeSetState(() {});
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 8.0, 15.0, 4.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'mwn6usg0' /* About */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).titleSmall,
                                    color: widget.about ||
                                            _model.abouteUsMouseRegionHovered
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    fontSize: widget.about ||
                                            _model.abouteUsMouseRegionHovered
                                        ? 20.0
                                        : 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          if (widget.about ||
                              _model.abouteUsMouseRegionHovered)
                            SizedBox(
                              width: 80.0,
                              child: Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                        ],
                      ),
                    ),
                    onEnter: ((event) async {
                      safeSetState(
                          () => _model.abouteUsMouseRegionHovered = true);
                    }),
                    onExit: ((event) async {
                      safeSetState(
                          () => _model.abouteUsMouseRegionHovered = false);
                    }),
                  ),
                ),
                MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'TOP_NAV_BAR_COMP_Column_41eqvx1d_ON_TAP');
                      logFirebaseEvent('Column_navigate_to');

                      context.pushNamed(ContactUsWidget.routeName);

                      logFirebaseEvent('Column_update_app_state');
                      FFAppState().topnavBaronSelect = TopNavBarOnSelectStruct(
                        instruments: false,
                        home: false,
                        bookings: false,
                        history: false,
                        aboutUs: false,
                        contactUs: true,
                        forum: false,
                        community: false,
                        lab: false,
                        jobs: false,
                      );
                      safeSetState(() {});
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 8.0, 15.0, 4.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'm4s4yhvd' /* Contact */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: FlutterFlowTheme.of(context).titleSmall,
                                  color: widget.contactus ||
                                          _model.contactUsMouseREgionHovered
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  fontSize: widget.contactus ||
                                          _model.contactUsMouseREgionHovered
                                      ? 20.0
                                      : 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        if (widget.contactus ||
                            _model.contactUsMouseREgionHovered)
                          SizedBox(
                            width: 100.0,
                            child: Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                      ],
                    ),
                  ),
                  onEnter: ((event) async {
                    safeSetState(
                        () => _model.contactUsMouseREgionHovered = true);
                  }),
                  onExit: ((event) async {
                    safeSetState(
                        () => _model.contactUsMouseREgionHovered = false);
                  }),
                ),
              ],
            ),
            Builder(
              builder: (context) => Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('TOP_NAV_BAR_Container_y2wt2nue_ON_TAP');
                    if (loggedIn) {
                      logFirebaseEvent('Container_navigate_to');

                      context.pushNamed(ProfileWidget.routeName);
                    } else {
                      logFirebaseEvent('Container_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: SignInCompoentWidget(
                              loginRequered: true,
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      FFIcons.kprofile,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 28.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
