import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'footer_model.dart';
export 'footer_model.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  late FooterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FooterModel());

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
      height: 250.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    width: 250.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'zcj00tm8' /* Join Community */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: FlutterFlowTheme.of(context).titleSmall,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 30.0,
                                buttonSize: 45.0,
                                icon: Icon(
                                  FFIcons.klinkedin1,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 28.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'FOOTER_COMP_linkedin1_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_launch_u_r_l');
                                  await launchURL(
                                      'https://linkedin.com/company/codots');
                                },
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 30.0,
                                buttonSize: 45.0,
                                icon: Icon(
                                  FFIcons.kfacebook,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 28.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'FOOTER_COMP_facebook_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_launch_u_r_l');
                                  await launchURL(
                                      'https://facebook.com/codots.io');
                                },
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 30.0,
                                buttonSize: 45.0,
                                icon: Icon(
                                  FFIcons.kinsta,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 28.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'FOOTER_COMP_insta_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_launch_u_r_l');
                                  await launchURL(
                                      'https://instagram.com/codots.io/');
                                },
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 30.0,
                                buttonSize: 45.0,
                                icon: Icon(
                                  FFIcons.ktwitter,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 28.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'FOOTER_COMP_twitter_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_launch_u_r_l');
                                  await launchURL(
                                      'https://twitter.com/codots_io');
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
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('FOOTER_COMP_darkMode_ON_TAP');
                          logFirebaseEvent('darkMode_navigate_to');

                          context.pushNamed(HomeWidget.routeName);
                        },
                        child: SvgPicture.asset(
                          Theme.of(context).brightness == Brightness.dark
                              ? 'assets/images/RNDgrid_Horizontal_Logo_Dark.svg'
                              : 'assets/images/RNDgrid_Horizontal_Logo_Light.svg',
                          width: 160.0,
                          height: 50.0,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'ws417kkg' /* For Researchers */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                font: FlutterFlowTheme.of(context).titleLarge,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'mn3rf2lg' /* 1st Floor, Atal-Kalam Research... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: FlutterFlowTheme.of(context).bodyLarge,
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'egxc4pl0' /* hello@rndgrid.com */,
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: FlutterFlowTheme.of(context).bodyLarge,
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'FOOTER_COMP_Text_rufaji5p_ON_TAP');
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
                                'oxbxoe3i' /* T&C */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
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
                                  'FOOTER_COMP_Text_4uq2yv2c_ON_TAP');
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
                                '187r90vz' /* Privacy */,
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
