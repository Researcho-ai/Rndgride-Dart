import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'not_login_top_nav_bar_model.dart';
export 'not_login_top_nav_bar_model.dart';

class NotLoginTopNavBarWidget extends StatefulWidget {
  const NotLoginTopNavBarWidget({super.key});

  @override
  State<NotLoginTopNavBarWidget> createState() =>
      _NotLoginTopNavBarWidgetState();
}

class _NotLoginTopNavBarWidgetState extends State<NotLoginTopNavBarWidget> {
  late NotLoginTopNavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotLoginTopNavBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
      child: Container(
        height: 70.0,
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'NOT_LOGIN_TOP_NAV_BAR_lightMode_ON_TAP');
                        if (!loggedIn) {
                          logFirebaseEvent('lightMode_navigate_to');

                          context.pushNamed(HomeWidget.routeName);

                          logFirebaseEvent('lightMode_update_app_state');
                          FFAppState().topnavBaronSelect =
                              TopNavBarOnSelectStruct(
                            instruments: false,
                            home: true,
                            bookings: false,
                            history: false,
                            aboutUs: false,
                            contactUs: false,
                            forum: false,
                            community: false,
                          );
                          safeSetState(() {});
                        } else {
                          logFirebaseEvent('lightMode_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('please Complete your profile !'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: SvgPicture.asset(
                        Theme.of(context).brightness == Brightness.dark
                            ? 'assets/images/RNDgrid_Horizontal_Logo_Dark.svg'
                            : 'assets/images/RNDgrid_Horizontal_Logo_Light.svg',
                        width: 150.0,
                        height: 40.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
