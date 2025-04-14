import '/auth/custom_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/onboarding/sign_in_compoent/sign_in_compoent_widget.dart';
import '/resources/pages/instrument_properties_copy/instrument_properties_copy_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sophisticated_instrument_component_model.dart';
export 'sophisticated_instrument_component_model.dart';

class SophisticatedInstrumentComponentWidget extends StatefulWidget {
  const SophisticatedInstrumentComponentWidget({
    super.key,
    this.imageURL,
    this.instrumentJson,
  });

  final String? imageURL;
  final dynamic instrumentJson;

  @override
  State<SophisticatedInstrumentComponentWidget> createState() =>
      _SophisticatedInstrumentComponentWidgetState();
}

class _SophisticatedInstrumentComponentWidgetState
    extends State<SophisticatedInstrumentComponentWidget> {
  late SophisticatedInstrumentComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => SophisticatedInstrumentComponentModel());

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
      constraints: BoxConstraints(
        minHeight: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 200.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 220.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 260.0;
          } else {
            return 260.0;
          }
        }(),
        maxHeight: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 200.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 220.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 260.0;
          } else {
            return 260.0;
          }
        }(),
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).border,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 80.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 90.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 100.0;
                    } else {
                      return 100.0;
                    }
                  }(),
                  height: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 80.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 90.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 100.0;
                    } else {
                      return 100.0;
                    }
                  }(),
                  decoration: BoxDecoration(),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.SvgImageWidget(
                      width: double.infinity,
                      height: double.infinity,
                      svgUrl: getJsonField(
                        widget.instrumentJson,
                        r'''$.image_url''',
                      ).toString(),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              getJsonField(
                                widget.instrumentJson,
                                r'''$.instrument_name''',
                              ).toString(),
                              textAlign: TextAlign.center,
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
                        ],
                      ),
                      Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'SOPHISTICATED_INSTRUMENT_COMPONENT_Text_');
                              if (loggedIn) {
                                logFirebaseEvent('Text_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.6,
                                        child: InstrumentPropertiesCopyWidget(
                                          instrumentPropertieJson:
                                              widget.instrumentJson,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
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
                                }()) {
                                  logFirebaseEvent('Text_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.7,
                                          child: SignInCompoentWidget(
                                            loginRequered: true,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                } else {
                                  logFirebaseEvent('Text_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: Container(
                                          height: 440.0,
                                          width: 610.0,
                                          child: SignInCompoentWidget(
                                            loginRequered: true,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              }
                            },
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'vy319n0z' /* submit request */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodySmallFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodySmallFamily),
                                  ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 110.0,
                        child: Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).primary,
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
    );
  }
}
