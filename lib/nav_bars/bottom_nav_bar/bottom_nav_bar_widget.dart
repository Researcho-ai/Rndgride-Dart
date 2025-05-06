import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'bottom_nav_bar_model.dart';
export 'bottom_nav_bar_model.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({
    super.key,
    bool? home,
    bool? instruments,
    bool? labFacilities,
    bool? tests,
    bool? contactUs,
    bool? abouteUs,
  })  : this.home = home ?? false,
        this.instruments = instruments ?? false,
        this.labFacilities = labFacilities ?? false,
        this.tests = tests ?? false,
        this.contactUs = contactUs ?? false,
        this.abouteUs = abouteUs ?? false;

  final bool home;
  final bool instruments;
  final bool labFacilities;
  final bool tests;
  final bool contactUs;
  final bool abouteUs;

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  late BottomNavBarModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavBarModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !(isWeb
          ? MediaQuery.viewInsetsOf(context).bottom > 0
          : _isKeyboardVisible),
      child: Container(
        width: double.infinity,
        height: 65.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 12.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                5.0,
              ),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('BOTTOM_NAV_BAR_COMP_Hom_ON_TAP');
                    logFirebaseEvent('Hom_navigate_to');

                    context.pushNamed(HomeWidget.routeName);
                  },
                  child: Container(
                    height: 70.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          FFIcons.khome,
                          color: widget.home
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                          size: 28.0,
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'w2pgq0ja' /* Home */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                font: FlutterFlowTheme.of(context).bodySmall,
                                color: widget.home
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('BOTTOM_NAV_BAR_COMP_Hom_ON_TAP');
                    logFirebaseEvent('Hom_navigate_to');

                    context.pushNamed(InstrumentsWidget.routeName);
                  },
                  child: Container(
                    height: 70.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          FFIcons.kxps,
                          color: widget.instruments
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                          size: 28.0,
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'qtmvg5io' /* Instruments */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                font: FlutterFlowTheme.of(context).bodySmall,
                                color: widget.instruments
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('BOTTOM_NAV_BAR_COMP_Hom_ON_TAP');
                    logFirebaseEvent('Hom_navigate_to');

                    context.pushNamed(ContactUsWidget.routeName);
                  },
                  child: Container(
                    height: 70.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          FFIcons.ktestTube,
                          color: widget.labFacilities
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                          size: 28.0,
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '6pcto925' /* Lab Facilities */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                font: FlutterFlowTheme.of(context).bodySmall,
                                color: widget.labFacilities
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('BOTTOM_NAV_BAR_COMP_Hom_ON_TAP');
                    logFirebaseEvent('Hom_navigate_to');

                    context.pushNamed(TestsWidget.routeName);
                  },
                  child: Container(
                    height: 70.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.hive_outlined,
                          color: widget.tests
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                          size: 28.0,
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '8mvwdzmj' /* Sectors */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                font: FlutterFlowTheme.of(context).bodySmall,
                                color: widget.tests
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
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
