import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/components/user_requirement_copy/user_requirement_copy_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'requerment_button_model.dart';
export 'requerment_button_model.dart';

class RequermentButtonWidget extends StatefulWidget {
  const RequermentButtonWidget({
    super.key,
    this.parameter2,
    this.text,
    bool? isHome,
    this.openForm,
    this.hoverIndex,
  }) : this.isHome = isHome ?? false;

  final int? parameter2;
  final String? text;
  final bool isHome;
  final Future Function()? openForm;
  final int? hoverIndex;

  @override
  State<RequermentButtonWidget> createState() => _RequermentButtonWidgetState();
}

class _RequermentButtonWidgetState extends State<RequermentButtonWidget> {
  late RequermentButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequermentButtonModel());

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
            logFirebaseEvent('REQUERMENT_BUTTON_ContacOption1_ON_TAP');
            if (widget.isHome) {
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
                logFirebaseEvent('ContacOption1_alert_dialog');
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
                        width: 500.0,
                        child: UserRequirementCopyWidget(
                          isDialog: false,
                          tagValue: widget.text,
                          requermwntDialog: true,
                          action: () async {},
                        ),
                      ),
                    );
                  },
                );
              } else {
                logFirebaseEvent('ContacOption1_alert_dialog');
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
                        width: 700.0,
                        child: UserRequirementCopyWidget(
                          isDialog: false,
                          tagValue: widget.text,
                          requermwntDialog: true,
                          action: () async {},
                        ),
                      ),
                    );
                  },
                );
              }
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
                logFirebaseEvent('ContacOption1_alert_dialog');
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
                        width: 500.0,
                        child: UserRequirementCopyWidget(
                          isDialog: false,
                          tagValue: widget.text,
                          requermwntDialog: true,
                          action: () async {},
                        ),
                      ),
                    );
                  },
                );
              } else {
                logFirebaseEvent('ContacOption1_execute_callback');
                await widget.openForm?.call();
              }
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: _model.contacOption1Hovered ||
                      (widget.parameter2 == widget.hoverIndex)
                  ? FlutterFlowTheme.of(context).primary
                  : Color(0x00000000),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).border,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      valueOrDefault<String>(
                        widget.text,
                        'Testing and Development Facility',
                      ),
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: _model.contacOption1Hovered ||
                                    (widget.parameter2 == widget.hoverIndex)
                                ? FlutterFlowTheme.of(context).buttonText
                                : FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onEnter: ((event) async {
        safeSetState(() => _model.contacOption1Hovered = true);
      }),
      onExit: ((event) async {
        safeSetState(() => _model.contacOption1Hovered = false);
      }),
    );
  }
}
