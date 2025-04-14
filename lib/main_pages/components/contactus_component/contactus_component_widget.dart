import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'contactus_component_model.dart';
export 'contactus_component_model.dart';

class ContactusComponentWidget extends StatefulWidget {
  const ContactusComponentWidget({
    super.key,
    String? pageName,
  }) : this.pageName = pageName ?? 'Login';

  final String pageName;

  @override
  State<ContactusComponentWidget> createState() =>
      _ContactusComponentWidgetState();
}

class _ContactusComponentWidgetState extends State<ContactusComponentWidget> {
  late ContactusComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactusComponentModel());

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
