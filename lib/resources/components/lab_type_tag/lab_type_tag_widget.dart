import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lab_type_tag_model.dart';
export 'lab_type_tag_model.dart';

class LabTypeTagWidget extends StatefulWidget {
  const LabTypeTagWidget({
    super.key,
    required this.labType,
  });

  final String? labType;

  @override
  State<LabTypeTagWidget> createState() => _LabTypeTagWidgetState();
}

class _LabTypeTagWidgetState extends State<LabTypeTagWidget> {
  late LabTypeTagModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LabTypeTagModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFF7DD),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
            child: Text(
              valueOrDefault<String>(
                widget.labType,
                'labType',
              ),
              style: FlutterFlowTheme.of(context).labelSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                    color: Color(0xFF141B33),
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).labelSmallFamily),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
