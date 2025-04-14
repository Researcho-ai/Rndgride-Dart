import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/components/profile_details_1/profile_details1_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_step1_model.dart';
export 'profile_step1_model.dart';

class ProfileStep1Widget extends StatefulWidget {
  const ProfileStep1Widget({
    super.key,
    String? pageName,
    bool? isNewuser,
    this.phoneNumber,
  })  : this.pageName = pageName ?? 'Signin',
        this.isNewuser = isNewuser ?? false;

  final String pageName;
  final bool isNewuser;
  final String? phoneNumber;

  static String routeName = 'ProfileStep1';
  static String routePath = 'profileStep1';

  @override
  State<ProfileStep1Widget> createState() => _ProfileStep1WidgetState();
}

class _ProfileStep1WidgetState extends State<ProfileStep1Widget> {
  late ProfileStep1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileStep1Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ProfileStep1'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
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
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'pw8tjlkt' /* Profile */,
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
                                      .containsKey(FlutterFlowTheme.of(context)
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Container(
                            width: () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return (MediaQuery.sizeOf(context).width * 0.9);
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return (MediaQuery.sizeOf(context).width * 0.6);
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return (MediaQuery.sizeOf(context).width *
                                    0.40);
                              } else {
                                return (MediaQuery.sizeOf(context).width *
                                    0.40);
                              }
                            }(),
                            height: MediaQuery.sizeOf(context).height * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).border,
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 24.0, 16.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.profileDetails1Model,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: ProfileDetails1Widget(
                                          pageName: widget.pageName,
                                          isProfilePge: false,
                                          isNewUser: widget.isNewuser,
                                          phoneNumber: widget.phoneNumber,
                                          actionCall: () async {
                                            logFirebaseEvent(
                                                'PROFILE_STEP1_Container_5cb9nuyl_CALLBAC');
                                            logFirebaseEvent(
                                                'ProfileDetails-1_navigate_to');

                                            context.pushNamed(
                                                HomeWidget.routeName);
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
