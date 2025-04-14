import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'icon_component_model.dart';
export 'icon_component_model.dart';

class IconComponentWidget extends StatefulWidget {
  const IconComponentWidget({
    super.key,
    required this.icon,
    required this.iconPhoneview,
  });

  final Widget? icon;
  final Widget? iconPhoneview;

  @override
  State<IconComponentWidget> createState() => _IconComponentWidgetState();
}

class _IconComponentWidgetState extends State<IconComponentWidget> {
  late IconComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IconComponentModel());

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
      width: () {
        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
          return 60.0;
        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
          return 70.0;
        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
          return 90.0;
        } else {
          return 90.0;
        }
      }(),
      height: () {
        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
          return 60.0;
        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
          return 70.0;
        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
          return 90.0;
        } else {
          return 90.0;
        }
      }(),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        shape: BoxShape.circle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          width: 6.0,
        ),
      ),
      child: Container(
        width: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 50.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 70.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 80.0;
          } else {
            return 80.0;
          }
        }(),
        height: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 50.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 70.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 80.0;
          } else {
            return 80.0;
          }
        }(),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).iconBackground,
          shape: BoxShape.circle,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (() {
              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                return false;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                return false;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                return true;
              } else {
                return true;
              }
            }())
              Container(
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: widget.icon!,
                ),
              ),
            if (() {
              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                return true;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                return true;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                return false;
              } else {
                return false;
              }
            }())
              Container(
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: widget.iconPhoneview!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
