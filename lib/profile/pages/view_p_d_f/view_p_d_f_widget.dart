import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'view_p_d_f_model.dart';
export 'view_p_d_f_model.dart';

class ViewPDFWidget extends StatefulWidget {
  const ViewPDFWidget({
    super.key,
    this.pdfurl,
  });

  final String? pdfurl;

  static String routeName = 'ViewPDF';
  static String routePath = 'viewPDF';

  @override
  State<ViewPDFWidget> createState() => _ViewPDFWidgetState();
}

class _ViewPDFWidgetState extends State<ViewPDFWidget> {
  late ViewPDFModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewPDFModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ViewPDF'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'ViewPDF',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    automaticallyImplyLeading: false,
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'huxns30x' /* Page Title */,
                      ),
                      style: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .override(
                            font: FlutterFlowTheme.of(context).headlineMedium,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    actions: [],
                    centerTitle: false,
                    elevation: 0.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowPdfViewer(
                        networkPath: widget.pdfurl!,
                        height: 743.0,
                        horizontalScroll: false,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('VIEW_P_D_F_PAGE_BACK_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_back');
                            context.safePop();
                          },
                          text: FFLocalizations.of(context).getText(
                            'mhw15ful' /* Back */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: FlutterFlowTheme.of(context).titleSmall,
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
