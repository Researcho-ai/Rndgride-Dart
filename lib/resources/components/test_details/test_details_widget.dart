import '/auth/custom_auth/auth_util.dart';
import '/components/test_properties_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/onboarding/sign_in_compoent/sign_in_compoent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'test_details_model.dart';
export 'test_details_model.dart';

class TestDetailsWidget extends StatefulWidget {
  const TestDetailsWidget({
    super.key,
    this.testName,
    this.index,
    this.testJson,
  });

  final String? testName;
  final int? index;
  final dynamic testJson;

  @override
  State<TestDetailsWidget> createState() => _TestDetailsWidgetState();
}

class _TestDetailsWidgetState extends State<TestDetailsWidget> {
  late TestDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      child: Builder(
        builder: (context) => InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('TEST_DETAILS_InstrumnetContainer_ON_TAP');
            if (loggedIn) {
              logFirebaseEvent('InstrumnetContainer_alert_dialog');
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
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      child: TestPropertiesComponentWidget(
                        testPropertieJson: widget.testJson,
                      ),
                    ),
                  );
                },
              );
            } else {
              if (() {
                if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                logFirebaseEvent('InstrumnetContainer_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.7,
                        child: SignInCompoentWidget(
                          loginRequered: true,
                        ),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              } else {
                logFirebaseEvent('InstrumnetContainer_alert_dialog');
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
          child: Material(
            color: Colors.transparent,
            elevation: _model.mouseRegionHovered ? 6.0 : 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              height: 135.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).iconBackground,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).border,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 50.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.testName,
                                'N/A',
                              ).maybeHandleOverflow(
                                maxChars: 104,
                                replacement: '…',
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelLargeFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelLargeFamily),
                                  ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            Theme.of(context).brightness == Brightness.dark
                                ? 'assets/images/Dark_Instrument_Button.svg'
                                : 'assets/images/Dark_Instrument_Button.svg',
                            width: 35.0,
                            height: 35.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
