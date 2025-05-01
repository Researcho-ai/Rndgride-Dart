import '/auth/custom_auth/auth_util.dart';
import '/components/instrument_properties_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/onboarding/sign_in_compoent/sign_in_compoent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'instruments_details_model.dart';
export 'instruments_details_model.dart';

class InstrumentsDetailsWidget extends StatefulWidget {
  const InstrumentsDetailsWidget({
    super.key,
    this.instrumentTestName,
    this.index,
    this.instrumentJson,
    this.labName,
    this.instituteName,
    this.labType,
    this.instrumentId,
    bool? isLabInstrument,
  }) : this.isLabInstrument = isLabInstrument ?? false;

  final String? instrumentTestName;
  final int? index;
  final dynamic instrumentJson;
  final String? labName;
  final String? instituteName;
  final String? labType;
  final String? instrumentId;
  final bool isLabInstrument;

  @override
  State<InstrumentsDetailsWidget> createState() =>
      _InstrumentsDetailsWidgetState();
}

class _InstrumentsDetailsWidgetState extends State<InstrumentsDetailsWidget> {
  late InstrumentsDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InstrumentsDetailsModel());

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
            logFirebaseEvent('INSTRUMENTS_DETAILS_InstrumnetContainer_');
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
                      child: InstrumentPropertiesComponentWidget(
                        instrumentPropertieJson: widget.instrumentJson,
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
                        height: 400.0,
                        width: 500.0,
                        child: SignInCompoentWidget(
                          loginRequered: true,
                        ),
                      ),
                    );
                  },
                );
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
                      child: SignInCompoentWidget(
                        loginRequered: true,
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
                color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                widget.instrumentTestName,
                                'N/A',
                              ).maybeHandleOverflow(
                                maxChars: 104,
                                replacement: '…',
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).labelLarge,
                                    letterSpacing: 0.0,
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
