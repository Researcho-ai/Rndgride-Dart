import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/components/user_profile/user_profile_widget.dart';
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'top_nav_bar_model.dart';
export 'top_nav_bar_model.dart';

class TopNavBarWidget extends StatefulWidget {
  const TopNavBarWidget({
    super.key,
    bool? instrument,
    bool? about,
    bool? contactus,
    bool? jobs,
    bool? labs,
  })  : this.instrument = instrument ?? false,
        this.about = about ?? false,
        this.contactus = contactus ?? false,
        this.jobs = jobs ?? false,
        this.labs = labs ?? false;

  final bool instrument;
  final bool about;
  final bool contactus;
  final bool jobs;
  final bool labs;

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
    context.watch<FFAppState>();

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

                      context.goNamed(InstrumentsWidget.routeName);

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
                              '3v0sb94k' /* Instruments */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: widget.instrument ||
                                          _model.instrumentMouseRegionHovered
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  fontSize: widget.instrument ||
                                          _model.instrumentMouseRegionHovered
                                      ? 20.0
                                      : 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                          ),
                        ),
                        if (widget.instrument ||
                            _model.instrumentMouseRegionHovered)
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
                        () => _model.instrumentMouseRegionHovered = true);
                  }),
                  onExit: ((event) async {
                    safeSetState(
                        () => _model.instrumentMouseRegionHovered = false);
                  }),
                ),
                MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  child: Visibility(
                    visible: responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'TOP_NAV_BAR_COMP_Column_yivx6xdc_ON_TAP');
                          logFirebaseEvent('Column_navigate_to');

                          context.pushNamed(LabsWidget.routeName);

                          logFirebaseEvent('Column_update_app_state');
                          FFAppState().topnavBaronSelect =
                              TopNavBarOnSelectStruct(
                            instruments: false,
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 8.0, 15.0, 4.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '90izqlyv' /* Labs */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: widget.labs ||
                                              _model.labsMouseRegionHovered
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      fontSize: widget.labs ||
                                              _model.labsMouseRegionHovered
                                          ? 20.0
                                          : 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                              ),
                            ),
                            if (FFAppState().topnavBaronSelect.lab ||
                                _model.labsMouseRegionHovered)
                              SizedBox(
                                width: 50.0,
                                child: Divider(
                                  thickness: 1.0,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onEnter: ((event) async {
                    safeSetState(() => _model.labsMouseRegionHovered = true);
                  }),
                  onExit: ((event) async {
                    safeSetState(() => _model.labsMouseRegionHovered = false);
                  }),
                ),
                MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
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
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
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
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
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
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
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
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => MouseRegion(
                      opaque: false,
                      cursor: MouseCursor.defer ?? MouseCursor.defer,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).border,
                          ),
                        ),
                        child: Stack(
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'TOP_NAV_BAR_Container_y2wt2nue_ON_TAP');
                                if (loggedIn) {
                                  logFirebaseEvent('Container_navigate_to');

                                  context.pushNamed(ProfileWidget.routeName);
                                } else {
                                  logFirebaseEvent('Container_navigate_to');

                                  context.pushNamed(SignInWidget.routeName);
                                }
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  FFIcons.kprofile,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 28.0,
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
                                    'TOP_NAV_BAR_CircleImage_tur921rf_ON_TAP');
                                if (loggedIn) {
                                  logFirebaseEvent('CircleImage_navigate_to');

                                  context.pushNamed(ProfileWidget.routeName);
                                } else {
                                  logFirebaseEvent('CircleImage_navigate_to');

                                  context.pushNamed(SignInWidget.routeName);
                                }
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  FFAppState().userProfileData.photoUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onEnter: ((event) async {
                        safeSetState(() => _model.profilHovered = true);
                        logFirebaseEvent(
                            'TOP_NAV_BAR_COMP_Profil_ON_TOGGLE_ON');
                        logFirebaseEvent('Profil_alert_dialog');
                        await showAlignedDialog(
                          context: context,
                          isGlobal: false,
                          avoidOverflow: true,
                          targetAnchor: AlignmentDirectional(-3.0, -1.38)
                              .resolve(Directionality.of(context)),
                          followerAnchor: AlignmentDirectional(0.0, -1.38)
                              .resolve(Directionality.of(context)),
                          builder: (dialogContext) {
                            return Material(
                              color: Colors.transparent,
                              child: Container(
                                height: 350.0,
                                width: 300.0,
                                child: UserProfileWidget(),
                              ),
                            );
                          },
                        );
                      }),
                      onExit: ((event) async {
                        safeSetState(() => _model.profilHovered = false);
                      }),
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
