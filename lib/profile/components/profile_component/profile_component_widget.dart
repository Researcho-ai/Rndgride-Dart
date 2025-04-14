import '/auth/custom_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile_component_model.dart';
export 'profile_component_model.dart';

class ProfileComponentWidget extends StatefulWidget {
  const ProfileComponentWidget({super.key});

  @override
  State<ProfileComponentWidget> createState() => _ProfileComponentWidgetState();
}

class _ProfileComponentWidgetState extends State<ProfileComponentWidget> {
  late ProfileComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).border,
        ),
      ),
      child: Stack(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('PROFILE_COMPONENT_Container_pgh75msu_ON_');
              if (loggedIn) {
                logFirebaseEvent('Container_navigate_to');

                context.pushNamed(ProfileWidget.routeName);
              } else {
                logFirebaseEvent('Container_navigate_to');

                context.pushNamed(SignInWidget.routeName);
              }
            },
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                shape: BoxShape.circle,
              ),
              child: Icon(
                FFIcons.kprofile,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 28.0,
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('PROFILE_COMPONENT_CircleImage_vaaxpow8_O');
              if (loggedIn) {
                logFirebaseEvent('CircleImage_navigate_to');

                context.pushNamed(ProfileWidget.routeName);
              } else {
                logFirebaseEvent('CircleImage_navigate_to');

                context.pushNamed(SignInWidget.routeName);
              }
            },
            child: Container(
              width: 40.0,
              height: 40.0,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                FFAppState().userProfileData.photoUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
