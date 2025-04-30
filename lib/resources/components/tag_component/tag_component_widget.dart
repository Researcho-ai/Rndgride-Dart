import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'tag_component_model.dart';
export 'tag_component_model.dart';

class TagComponentWidget extends StatefulWidget {
  const TagComponentWidget({
    super.key,
    this.text,
    this.tagColor,
    this.textColor,
  });

  final String? text;
  final Color? tagColor;
  final Color? textColor;

  @override
  State<TagComponentWidget> createState() => _TagComponentWidgetState();
}

class _TagComponentWidgetState extends State<TagComponentWidget> {
  late TagComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TagComponentModel());

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
      decoration: BoxDecoration(
        color: widget.tagColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                  child: Text(
                    widget.text!,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: FlutterFlowTheme.of(context).labelSmall,
                          color: valueOrDefault<Color>(
                            widget.textColor,
                            Color(0xFF141B33),
                          ),
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
