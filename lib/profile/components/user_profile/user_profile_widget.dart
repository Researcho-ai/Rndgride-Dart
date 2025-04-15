import '/auth/custom_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/components/theme_mode/theme_mode_widget.dart';
import '/onboarding/logout_popup/logout_popup_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_profile_model.dart';
export 'user_profile_model.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({super.key});

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  late UserProfileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfileModel());

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

    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.click ?? MouseCursor.defer,
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          width: 250.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.themeModeModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ThemeModeWidget(),
                ),
                if (loggedIn &&
                    responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
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
                                      'USER_PROFILE_Container_ppu363co_ON_TAP');
                                  if (loggedIn) {
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed(ProfileWidget.routeName);
                                  } else {
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed(SignInWidget.routeName);
                                  }
                                },
                                child: Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    FFIcons.kprofile,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 52.0,
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
                                      'USER_PROFILE_CircleImage_bfhenhiy_ON_TAP');
                                  if (loggedIn) {
                                    logFirebaseEvent('CircleImage_navigate_to');

                                    context.pushNamed(ProfileWidget.routeName);
                                  } else {
                                    logFirebaseEvent('CircleImage_navigate_to');

                                    context.pushNamed(SignInWidget.routeName);
                                  }
                                },
                                child: Container(
                                  width: 70.0,
                                  height: 70.0,
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
                      ],
                    ),
                  ),
                if (loggedIn)
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          currentUserData?.displayName,
                          '-',
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelLargeFamily),
                            ),
                      ),
                    ),
                  ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        valueOrDefault<double>(
                          loggedIn ? 8.0 : 16.0,
                          0.0,
                        ),
                        0.0,
                        0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'USER_PROFILE_VIEW_PROFILE_BTN_ON_TAP');
                        if (loggedIn) {
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed(ProfileWidget.routeName);
                        } else {
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed(SignInWidget.routeName);
                        }
                      },
                      text: loggedIn ? 'View Profile' : 'Sign in',
                      options: FFButtonOptions(
                        height: 30.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.transparent,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodySmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodySmallFamily,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodySmallFamily),
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        valueOrDefault<double>(
                          loggedIn ? 8.0 : 16.0,
                          0.0,
                        ),
                        0.0,
                        0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'USER_PROFILE_Container_2aqeye56_ON_TAP');
                        logFirebaseEvent('Container_navigate_to');

                        context.pushNamed(AboutUsWidget.routeName);
                      },
                      child: Container(
                        height: 45.0,
                        decoration: BoxDecoration(),
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '6x6zlp77' /* About Us */,
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
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'USER_PROFILE_Container_6xz5j51k_ON_TAP');
                        logFirebaseEvent('Container_navigate_to');

                        context.pushNamed(ContactUsWidget.routeName);
                      },
                      child: Container(
                        height: 45.0,
                        decoration: BoxDecoration(),
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '6zcuzzrw' /* Contact Us */,
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
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (loggedIn)
                  Flexible(
                    child: Builder(
                      builder: (context) => Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'USER_PROFILE_Container_4sh3u84y_ON_TAP');
                            logFirebaseEvent(
                                'Container_close_dialog_drawer_etc');
                            Navigator.pop(context);
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
                                  child: LogoutPopupWidget(),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 45.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'kpszibm5' /* Logout */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
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
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
      }),
    );
  }
}
