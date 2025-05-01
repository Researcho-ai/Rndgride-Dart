import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'data_not_found_c_omponent_model.dart';
export 'data_not_found_c_omponent_model.dart';

class DataNotFoundCOmponentWidget extends StatefulWidget {
  const DataNotFoundCOmponentWidget({
    super.key,
    bool? isJobs,
    bool? isLoad,
    this.refresh,
  })  : this.isJobs = isJobs ?? false,
        this.isLoad = isLoad ?? false;

  final bool isJobs;
  final bool isLoad;
  final bool? refresh;

  @override
  State<DataNotFoundCOmponentWidget> createState() =>
      _DataNotFoundCOmponentWidgetState();
}

class _DataNotFoundCOmponentWidgetState
    extends State<DataNotFoundCOmponentWidget> {
  late DataNotFoundCOmponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DataNotFoundCOmponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DATA_NOT_FOUND_C_OMPONENT_DataNotFoundCO');
      if (widget.refresh!) {
        logFirebaseEvent('DataNotFoundCOmponent_update_component_s');
        _model.daataNotFound = false;
        safeSetState(() {});
      }
      logFirebaseEvent('DataNotFoundCOmponent_wait__delay');
      await Future.delayed(const Duration(milliseconds: 3000));
      logFirebaseEvent('DataNotFoundCOmponent_update_component_s');
      _model.daataNotFound = true;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (!_model.daataNotFound)
          Container(
            width: 130.0,
            height: 130.0,
            decoration: BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/Loading.png',
                width: 200.0,
                height: 100.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
        if (_model.daataNotFound)
          Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/Result_Not_Found.png',
                width: 200.0,
                height: 100.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
        Text(
          _model.daataNotFound
              ? (widget.isJobs ? 'No Jobs!' : 'Data Not Found!')
              : 'Loading .........',
          style: FlutterFlowTheme.of(context).titleLarge.override(
                font: FlutterFlowTheme.of(context).titleLarge,
                letterSpacing: 0.0,
              ),
        ),
      ],
    );
  }
}
