import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'createthemechangingcomponentusingmytheme_model.dart';
export 'createthemechangingcomponentusingmytheme_model.dart';

class CreatethemechangingcomponentusingmythemeWidget extends StatefulWidget {
  const CreatethemechangingcomponentusingmythemeWidget({super.key});

  @override
  State<CreatethemechangingcomponentusingmythemeWidget> createState() =>
      _CreatethemechangingcomponentusingmythemeWidgetState();
}

class _CreatethemechangingcomponentusingmythemeWidgetState
    extends State<CreatethemechangingcomponentusingmythemeWidget> {
  late CreatethemechangingcomponentusingmythemeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => CreatethemechangingcomponentusingmythemeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
