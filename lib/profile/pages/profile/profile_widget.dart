import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bars/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/nav_bars/drawer/drawer_widget.dart';
import '/nav_bars/top_nav_bar/top_nav_bar_widget.dart';
import '/onboarding/logout_popup/logout_popup_widget.dart';
import '/onboarding/sign_in_compoent/sign_in_compoent_widget.dart';
import '/profile/components/profile_detail_2/profile_detail2_widget.dart';
import '/profile/components/profile_details_1/profile_details1_widget.dart';
import '/profile/components/profile_page_component/profile_page_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  static String routeName = 'Profile';
  static String routePath = 'profile';

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Profile'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROFILE_PAGE_Profile_ON_INIT_STATE');
      if (loggedIn) {
        return;
      }

      if (MediaQuery.sizeOf(context).width < kBreakpointSmall ? true : false) {
        logFirebaseEvent('Profile_navigate_to');

        context.pushNamed(SignInWidget.routeName);
      } else {
        logFirebaseEvent('Profile_alert_dialog');
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Container(
                  height: 440.0,
                  width: 610.0,
                  child: SignInCompoentWidget(
                    loginRequered: true,
                  ),
                ),
              ),
            );
          },
        );
      }

      logFirebaseEvent('Profile_update_app_state');

      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => Title(
          title: 'Profile',
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
                      title: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.arrow_back_sharp,
                                color: Colors.white,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'PROFILE_PAGE_arrow_back_sharp_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.safePop();
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'gxtgsiam' /* Profile */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color:
                                        FlutterFlowTheme.of(context).buttonText,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
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
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  96.0, 0.0, 96.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model.topNavBarModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: TopNavBarWidget(
                                              instrument: false,
                                              about: false,
                                              contactus: false,
                                              jobs: false,
                                              labs: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 24.0),
                                      child: Container(
                                        width: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.8);
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
                                                0.6);
                                          } else {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.7);
                                          }
                                        }(),
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                16.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 50.0,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      icon: Icon(
                                                        FFIcons.karrowLeft,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'PROFILE_PAGE_arrowLeft_ICN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'IconButton_navigate_back');
                                                        context.safePop();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            MasonryGridView.builder(
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
                                                    return 2;
                                                  } else {
                                                    return 2;
                                                  }
                                                }(),
                                              ),
                                              crossAxisSpacing: 10.0,
                                              mainAxisSpacing: 10.0,
                                              itemCount: 3,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return [
                                                  () => Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 0.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 24.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 36.0;
                                                                        } else {
                                                                          return 36.0;
                                                                        }
                                                                      }(),
                                                                      0.0,
                                                                    ),
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            24.0),
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
                                                                          24.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  if (responsiveVisibility(
                                                                                    context: context,
                                                                                    phone: false,
                                                                                    tablet: false,
                                                                                    tabletLandscape: false,
                                                                                    desktop: false,
                                                                                  ))
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                        child: wrapWithModel(
                                                                                          model: _model.profilePageComponentModel,
                                                                                          updateCallback: () => safeSetState(() {}),
                                                                                          updateOnChange: true,
                                                                                          child: Hero(
                                                                                            tag: 'NavBar',
                                                                                            transitionOnUserGestures: true,
                                                                                            child: Material(
                                                                                              color: Colors.transparent,
                                                                                              child: ProfilePageComponentWidget(
                                                                                                userImage: FFAppState().userProfileData.photoUrl,
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
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) => FlutterFlowIconButton(
                                                                                borderColor: Colors.transparent,
                                                                                borderRadius: 20.0,
                                                                                borderWidth: 1.0,
                                                                                buttonSize: 40.0,
                                                                                icon: Icon(
                                                                                  FFIcons.kedit,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 24.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  logFirebaseEvent('PROFILE_PAGE_edit_ICN_ON_TAP');
                                                                                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall ? true : false) {
                                                                                    logFirebaseEvent('IconButton_bottom_sheet');
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return GestureDetector(
                                                                                          onTap: () {
                                                                                            FocusScope.of(context).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: Container(
                                                                                              height: MediaQuery.sizeOf(context).height * 0.7,
                                                                                              child: ProfileDetails1Widget(
                                                                                                pageName: 'profile',
                                                                                                isProfilePge: true,
                                                                                                actionCall: () async {
                                                                                                  var _shouldSetState = false;
                                                                                                  logFirebaseEvent('_bottom_sheet');
                                                                                                  Navigator.pop(context);
                                                                                                  logFirebaseEvent('_backend_call');
                                                                                                  _model.userDataFetched = await UsersGroup.getUserDataCall.call(
                                                                                                    userID: FFAppState().userProfileData.uid,
                                                                                                  );

                                                                                                  _shouldSetState = true;
                                                                                                  if ((_model.userDataFetched?.succeeded ?? true)) {
                                                                                                    logFirebaseEvent('_update_app_state');
                                                                                                    FFAppState().userProfileData = UserProfileDataStruct(
                                                                                                      uid: UsersGroup.getUserDataCall.uid(
                                                                                                        (_model.userDataFetched?.jsonBody ?? ''),
                                                                                                      ),
                                                                                                      photoUrl: UsersGroup.getUserDataCall.photoURL(
                                                                                                        (_model.userDataFetched?.jsonBody ?? ''),
                                                                                                      ),
                                                                                                      displayName: UsersGroup.getUserDataCall.displayName(
                                                                                                        (_model.userDataFetched?.jsonBody ?? ''),
                                                                                                      ),
                                                                                                      userAffiliation: UsersGroup.getUserDataCall.affiliation(
                                                                                                        (_model.userDataFetched?.jsonBody ?? ''),
                                                                                                      ),
                                                                                                      userResearchField: UsersGroup.getUserDataCall.researchField(
                                                                                                        (_model.userDataFetched?.jsonBody ?? ''),
                                                                                                      ),
                                                                                                      userRequiredResources: UsersGroup.getUserDataCall.requiredResources(
                                                                                                        (_model.userDataFetched?.jsonBody ?? ''),
                                                                                                      ),
                                                                                                      userType: UsersGroup.getUserDataCall.userType(
                                                                                                        (_model.userDataFetched?.jsonBody ?? ''),
                                                                                                      ),
                                                                                                      phoneNumber: UsersGroup.getUserDataCall.phoneNo(
                                                                                                        (_model.userDataFetched?.jsonBody ?? ''),
                                                                                                      ),
                                                                                                    );
                                                                                                    FFAppState().update(() {});
                                                                                                    return;
                                                                                                  } else {
                                                                                                    return;
                                                                                                  }
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  } else {
                                                                                    logFirebaseEvent('IconButton_alert_dialog');
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (dialogContext) {
                                                                                        return Dialog(
                                                                                          elevation: 0,
                                                                                          insetPadding: EdgeInsets.zero,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          child: GestureDetector(
                                                                                            onTap: () {
                                                                                              FocusScope.of(dialogContext).unfocus();
                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                            },
                                                                                            child: Container(
                                                                                              height: MediaQuery.sizeOf(context).height * 0.6,
                                                                                              width: MediaQuery.sizeOf(context).width * 0.45,
                                                                                              child: ProfileDetails1Widget(
                                                                                                pageName: 'profile',
                                                                                                isProfilePge: true,
                                                                                                actionCall: () async {
                                                                                                  var _shouldSetState = false;
                                                                                                  logFirebaseEvent('_close_dialog_drawer_etc');
                                                                                                  Navigator.pop(context);
                                                                                                  logFirebaseEvent('_backend_call');
                                                                                                  _model.userDataFetchedDialog = await UsersGroup.getUserDataCall.call(
                                                                                                    userID: FFAppState().userProfileData.uid,
                                                                                                  );

                                                                                                  _shouldSetState = true;
                                                                                                  if ((_model.userDataFetchedDialog?.succeeded ?? true)) {
                                                                                                    logFirebaseEvent('_update_app_state');
                                                                                                    FFAppState().userProfileData = UserProfileDataStruct(
                                                                                                      uid: UsersGroup.getUserDataCall.uid(
                                                                                                        (_model.userDataFetchedDialog?.jsonBody ?? ''),
                                                                                                      ),
                                                                                                      photoUrl: UsersGroup.getUserDataCall.photoURL(
                                                                                                        (_model.userDataFetchedDialog?.jsonBody ?? ''),
                                                                                                      ),
                                                                                                      displayName: UsersGroup.getUserDataCall.displayName(
                                                                                                        (_model.userDataFetchedDialog?.jsonBody ?? ''),
                                                                                                      ),
                                                                                                      userAffiliation: UsersGroup.getUserDataCall.affiliation(
                                                                                                        (_model.userDataFetchedDialog?.jsonBody ?? ''),
                                                                                                      ),
                                                                                                      userResearchField: UsersGroup.getUserDataCall.researchField(
                                                                                                        (_model.userDataFetchedDialog?.jsonBody ?? ''),
                                                                                                      ),
                                                                                                      userRequiredResources: UsersGroup.getUserDataCall.requiredResources(
                                                                                                        (_model.userDataFetchedDialog?.jsonBody ?? ''),
                                                                                                      ),
                                                                                                      userType: UsersGroup.getUserDataCall.userType(
                                                                                                        (_model.userDataFetchedDialog?.jsonBody ?? ''),
                                                                                                      ),
                                                                                                      phoneNumber: UsersGroup.getUserDataCall.phoneNo(
                                                                                                        (_model.userDataFetchedDialog?.jsonBody ?? ''),
                                                                                                      ),
                                                                                                    );
                                                                                                    FFAppState().update(() {});
                                                                                                    return;
                                                                                                  } else {
                                                                                                    return;
                                                                                                  }
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  }

                                                                                  safeSetState(() {});
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    if (loggedIn)
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          FFAppState()
                                                                              .userProfileData
                                                                              .displayName,
                                                                          '-',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                            ),
                                                                      ),
                                                                    if (loggedIn &&
                                                                        (FFAppState().userProfileData.userType !=
                                                                            'Unknown'))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            FFAppState().userProfileData.userType,
                                                                            '-',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    if (loggedIn &&
                                                                        (FFAppState().userProfileData.userType ==
                                                                            'Unknown'))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'jo6lfqia' /* User Type Not Mentioned! */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    SizedBox(
                                                                      width:
                                                                          380.0,
                                                                      child:
                                                                          Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .border,
                                                                      ),
                                                                    ),
                                                                    if (loggedIn)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          functions.formatPhoneNumber(FFAppState()
                                                                              .userProfileData
                                                                              .phoneNumber),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
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
                                                                      SelectionArea(
                                                                          child:
                                                                              Text(
                                                                        FFAppState()
                                                                            .debugString,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      )),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tablet: false,
                                                            ))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (loggedIn)
                                                                        Expanded(
                                                                          child:
                                                                              Builder(
                                                                            builder: (context) =>
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_Container_xvpoyfjo_ON_TAP');
                                                                                logFirebaseEvent('Container_alert_dialog');
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (dialogContext) {
                                                                                    return Dialog(
                                                                                      elevation: 0,
                                                                                      insetPadding: EdgeInsets.zero,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                      child: GestureDetector(
                                                                                        onTap: () {
                                                                                          FocusScope.of(dialogContext).unfocus();
                                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                                        },
                                                                                        child: LogoutPopupWidget(),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 100.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                                                      valueOrDefault<double>(
                                                                                        () {
                                                                                          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                            return 24.0;
                                                                                          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                            return 35.0;
                                                                                          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                            return 40.0;
                                                                                          } else {
                                                                                            return 40.0;
                                                                                          }
                                                                                        }(),
                                                                                        40.0,
                                                                                      ),
                                                                                      14.0,
                                                                                      14.0,
                                                                                      14.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Icon(
                                                                                        FFIcons.klogout,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'pkt900na' /* Logout */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                          ],
                                                        ),
                                                      ),
                                                  () => Container(
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
                                                                      24.0,
                                                                      24.0,
                                                                      24.0,
                                                                      24.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) =>
                                                                                FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              20.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          icon:
                                                                              Icon(
                                                                            FFIcons.kedit,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('PROFILE_PAGE_edit_ICN_ON_TAP');
                                                                            if (MediaQuery.sizeOf(context).width < kBreakpointSmall
                                                                                ? true
                                                                                : false) {
                                                                              logFirebaseEvent('IconButton_bottom_sheet');
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return GestureDetector(
                                                                                    onTap: () {
                                                                                      FocusScope.of(context).unfocus();
                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                    },
                                                                                    child: Padding(
                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                      child: Container(
                                                                                        height: MediaQuery.sizeOf(context).height * 0.8,
                                                                                        child: ProfileDetail2Widget(
                                                                                          action: () async {
                                                                                            var _shouldSetState = false;
                                                                                            logFirebaseEvent('_bottom_sheet');
                                                                                            Navigator.pop(context);
                                                                                            logFirebaseEvent('_backend_call');
                                                                                            _model.userDataFetchedDialog2 = await UsersGroup.getUserDataCall.call(
                                                                                              userID: FFAppState().userProfileData.uid,
                                                                                            );

                                                                                            _shouldSetState = true;
                                                                                            if ((_model.userDataFetchedDialog2?.succeeded ?? true)) {
                                                                                              logFirebaseEvent('_update_app_state');
                                                                                              FFAppState().userProfileData = UserProfileDataStruct(
                                                                                                uid: UsersGroup.getUserDataCall.uid(
                                                                                                  (_model.userDataFetchedDialog2?.jsonBody ?? ''),
                                                                                                ),
                                                                                                photoUrl: UsersGroup.getUserDataCall.photoURL(
                                                                                                  (_model.userDataFetchedDialog2?.jsonBody ?? ''),
                                                                                                ),
                                                                                                displayName: UsersGroup.getUserDataCall.displayName(
                                                                                                  (_model.userDataFetchedDialog2?.jsonBody ?? ''),
                                                                                                ),
                                                                                                userAffiliation: UsersGroup.getUserDataCall.affiliation(
                                                                                                  (_model.userDataFetchedDialog2?.jsonBody ?? ''),
                                                                                                ),
                                                                                                userResearchField: UsersGroup.getUserDataCall.researchField(
                                                                                                  (_model.userDataFetchedDialog2?.jsonBody ?? ''),
                                                                                                ),
                                                                                                userRequiredResources: UsersGroup.getUserDataCall.requiredResources(
                                                                                                  (_model.userDataFetchedDialog2?.jsonBody ?? ''),
                                                                                                ),
                                                                                                userType: UsersGroup.getUserDataCall.userType(
                                                                                                  (_model.userDataFetchedDialog2?.jsonBody ?? ''),
                                                                                                ),
                                                                                                phoneNumber: UsersGroup.getUserDataCall.phoneNo(
                                                                                                  (_model.userDataFetchedDialog2?.jsonBody ?? ''),
                                                                                                ),
                                                                                              );
                                                                                              FFAppState().update(() {});
                                                                                              return;
                                                                                            } else {
                                                                                              return;
                                                                                            }
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));
                                                                            } else {
                                                                              logFirebaseEvent('IconButton_alert_dialog');
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (dialogContext) {
                                                                                  return Dialog(
                                                                                    elevation: 0,
                                                                                    insetPadding: EdgeInsets.zero,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                    child: GestureDetector(
                                                                                      onTap: () {
                                                                                        FocusScope.of(dialogContext).unfocus();
                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                      },
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.45,
                                                                                        child: ProfileDetail2Widget(
                                                                                          action: () async {
                                                                                            var _shouldSetState = false;
                                                                                            logFirebaseEvent('_close_dialog_drawer_etc');
                                                                                            Navigator.pop(context);
                                                                                            logFirebaseEvent('_backend_call');
                                                                                            _model.userDataFetchedButtomSheet2 = await UsersGroup.getUserDataCall.call(
                                                                                              userID: FFAppState().userProfileData.uid,
                                                                                            );

                                                                                            _shouldSetState = true;
                                                                                            if ((_model.userDataFetchedButtomSheet2?.succeeded ?? true)) {
                                                                                              logFirebaseEvent('_update_app_state');
                                                                                              FFAppState().userProfileData = UserProfileDataStruct(
                                                                                                uid: UsersGroup.getUserDataCall.uid(
                                                                                                  (_model.userDataFetchedButtomSheet2?.jsonBody ?? ''),
                                                                                                ),
                                                                                                photoUrl: UsersGroup.getUserDataCall.photoURL(
                                                                                                  (_model.userDataFetchedButtomSheet2?.jsonBody ?? ''),
                                                                                                ),
                                                                                                displayName: UsersGroup.getUserDataCall.displayName(
                                                                                                  (_model.userDataFetchedButtomSheet2?.jsonBody ?? ''),
                                                                                                ),
                                                                                                userAffiliation: UsersGroup.getUserDataCall.affiliation(
                                                                                                  (_model.userDataFetchedButtomSheet2?.jsonBody ?? ''),
                                                                                                ),
                                                                                                userResearchField: UsersGroup.getUserDataCall.researchField(
                                                                                                  (_model.userDataFetchedButtomSheet2?.jsonBody ?? ''),
                                                                                                ),
                                                                                                userRequiredResources: UsersGroup.getUserDataCall.requiredResources(
                                                                                                  (_model.userDataFetchedButtomSheet2?.jsonBody ?? ''),
                                                                                                ),
                                                                                                userType: UsersGroup.getUserDataCall.userType(
                                                                                                  (_model.userDataFetchedButtomSheet2?.jsonBody ?? ''),
                                                                                                ),
                                                                                                phoneNumber: UsersGroup.getUserDataCall.phoneNo(
                                                                                                  (_model.userDataFetchedButtomSheet2?.jsonBody ?? ''),
                                                                                                ),
                                                                                              );
                                                                                              FFAppState().update(() {});
                                                                                              return;
                                                                                            } else {
                                                                                              return;
                                                                                            }
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            }

                                                                            safeSetState(() {});
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '68pxlvcy' /* Research Field */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleSmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                        ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .border,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        FFAppState()
                                                                            .userProfileData
                                                                            .userResearchField,
                                                                        '-',
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
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            24.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'm6z0m9p9' /* Affiliation */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          1.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .border,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          FFAppState()
                                                                              .userProfileData
                                                                              .userAffiliation,
                                                                          '-',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                  () => Visibility(
                                                        visible:
                                                            responsiveVisibility(
                                                          context: context,
                                                          tabletLandscape:
                                                              false,
                                                          desktop: false,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
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
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (loggedIn)
                                                                  Expanded(
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) =>
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
                                                                          logFirebaseEvent(
                                                                              'PROFILE_PAGE_Container_eykvpii6_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Container_alert_dialog');
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Dialog(
                                                                                elevation: 0,
                                                                                insetPadding: EdgeInsets.zero,
                                                                                backgroundColor: Colors.transparent,
                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: LogoutPopupWidget(),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                valueOrDefault<double>(
                                                                                  () {
                                                                                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                      return 24.0;
                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                      return 35.0;
                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                      return 40.0;
                                                                                    } else {
                                                                                      return 40.0;
                                                                                    }
                                                                                  }(),
                                                                                  40.0,
                                                                                ),
                                                                                14.0,
                                                                                14.0,
                                                                                14.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  FFIcons.klogout,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 24.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '9w783bib' /* Logout */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                ][index]();
                                              },
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
                    ),
                    if (responsiveVisibility(
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
          )),
    );
  }
}
