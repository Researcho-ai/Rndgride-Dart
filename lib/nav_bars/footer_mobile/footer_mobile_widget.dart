import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'footer_mobile_model.dart';
export 'footer_mobile_model.dart';

class FooterMobileWidget extends StatefulWidget {
  const FooterMobileWidget({super.key});

  @override
  State<FooterMobileWidget> createState() => _FooterMobileWidgetState();
}

class _FooterMobileWidgetState extends State<FooterMobileWidget> {
  late FooterMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FooterMobileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (Theme.of(context).brightness == Brightness.dark)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'FOOTER_MOBILE_COMP_darkMode_ON_TAP');
                          logFirebaseEvent('darkMode_navigate_to');

                          context.pushNamed(HomeWidget.routeName);
                        },
                        child: SvgPicture.asset(
                          'assets/images/RNDgrid_Horizontal_Logo_Dark.svg',
                          width: 160.0,
                          height: 50.0,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  if (Theme.of(context).brightness == Brightness.light)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('FOOTER_MOBILE_COMP_lightMode_ON_TAP');
                        logFirebaseEvent('lightMode_navigate_to');

                        context.pushNamed(HomeWidget.routeName);
                      },
                      child: Image.asset(
                        'assets/images/horizontal_black_fonts.png',
                        width: 160.0,
                        height: 50.0,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '823osy6y' /* For Researchers */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleLargeFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleLargeFamily),
                        ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                width: 250.0,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'ud6esqha' /* Join Community */,
                      ),
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 30.0,
                            buttonSize: 42.0,
                            icon: Icon(
                              FFIcons.klinkedin1,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 28.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'FOOTER_MOBILE_COMP_linkedin1_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_launch_u_r_l');
                              await launchURL(
                                  'https://linkedin.com/company/codots');
                            },
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 30.0,
                            buttonSize: 42.0,
                            icon: Icon(
                              FFIcons.kfacebook,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 28.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'FOOTER_MOBILE_COMP_facebook_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_launch_u_r_l');
                              await launchURL('https://facebook.com/codots.io');
                            },
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 30.0,
                            buttonSize: 42.0,
                            icon: Icon(
                              FFIcons.kinsta,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 28.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'FOOTER_MOBILE_COMP_insta_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_launch_u_r_l');
                              await launchURL(
                                  'https://instagram.com/codots.io/');
                            },
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 30.0,
                            buttonSize: 42.0,
                            icon: Icon(
                              FFIcons.ktwitter,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 28.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'FOOTER_MOBILE_COMP_twitter_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_launch_u_r_l');
                              await launchURL('https://twitter.com/codots_io');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'spj88hi5' /* 1st Floor, Atal-Kalam Research... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyLargeFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyLargeFamily),
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'l7f87o47' /* hello@rndgrid.com */,
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyLargeFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyLargeFamily),
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'FOOTER_MOBILE_COMP_Text_velc55td_ON_TAP');
                          logFirebaseEvent('Text_navigate_to');

                          context.pushNamed(
                            PrivacyPolicyWidget.routeName,
                            queryParameters: {
                              'page': serializeParam(
                                'user-terms',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'zxnjxn2m' /* T&C */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                        child: VerticalDivider(
                          thickness: 2.0,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'FOOTER_MOBILE_COMP_Text_4ayyh5yf_ON_TAP');
                          logFirebaseEvent('Text_navigate_to');

                          context.pushNamed(
                            PrivacyPolicyWidget.routeName,
                            queryParameters: {
                              'page': serializeParam(
                                'user-privacy-policy',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'n9pknqy0' /* Privacy */,
                          ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                              ),
                        ),
                      ),
                    ],
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
