import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'suported_by_component_model.dart';
export 'suported_by_component_model.dart';

class SuportedByComponentWidget extends StatefulWidget {
  const SuportedByComponentWidget({super.key});

  @override
  State<SuportedByComponentWidget> createState() =>
      _SuportedByComponentWidgetState();
}

class _SuportedByComponentWidgetState extends State<SuportedByComponentWidget> {
  late SuportedByComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuportedByComponentModel());

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
      width: valueOrDefault<double>(
        () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 140.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 175.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 200.0;
          } else {
            return 200.0;
          }
        }(),
        200.0,
      ),
      height: () {
        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
          return 50.0;
        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
          return 80.0;
        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
          return 90.0;
        } else {
          return 90.0;
        }
      }(),
      decoration: BoxDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          Theme.of(context).brightness == Brightness.dark
              ? 'assets/images/iHUB_Dark.png'
              : 'assets/images/iHUB_Light.png',
          width: 220.0,
          height: 220.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
