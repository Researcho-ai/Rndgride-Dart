import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/resources/components/instrument_test_detail_component/instrument_test_detail_component_widget.dart';
import '/resources/components/lab_type_tag/lab_type_tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lab_options_c_model.dart';
export 'lab_options_c_model.dart';

class LabOptionsCWidget extends StatefulWidget {
  const LabOptionsCWidget({
    super.key,
    this.labname,
    this.instituteName,
    this.labType,
    this.instrumentId,
  });

  final String? labname;
  final String? instituteName;
  final String? labType;
  final String? instrumentId;

  @override
  State<LabOptionsCWidget> createState() => _LabOptionsCWidgetState();
}

class _LabOptionsCWidgetState extends State<LabOptionsCWidget> {
  late LabOptionsCModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LabOptionsCModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LAB_OPTIONS_C_LabOptionsC_ON_INIT_STATE');
      logFirebaseEvent('LabOptionsC_backend_call');
      _model.apiResultcbv =
          await InstrumentsTestsGroup.getInstrumentPropertiesCall.call(
        instrumentID: widget.instrumentId,
      );

      if ((_model.apiResultcbv?.succeeded ?? true)) {
        logFirebaseEvent('LabOptionsC_update_component_state');
        _model.instrumentJson = InstrumentsTestsGroup
            .getInstrumentPropertiesCall
            .instrumentProperties(
          (_model.apiResultcbv?.jsonBody ?? ''),
        );
        _model.analysisBool =
            InstrumentsTestsGroup.getInstrumentPropertiesCall.analysisBool(
          (_model.apiResultcbv?.jsonBody ?? ''),
        )!;
        _model.solventBool =
            InstrumentsTestsGroup.getInstrumentPropertiesCall.solventBool(
          (_model.apiResultcbv?.jsonBody ?? ''),
        )!;
        _model.academicBool =
            InstrumentsTestsGroup.getInstrumentPropertiesCall.academicBool(
          (_model.apiResultcbv?.jsonBody ?? ''),
        )!;
        _model.industrilBool =
            InstrumentsTestsGroup.getInstrumentPropertiesCall.industrialBool(
          (_model.apiResultcbv?.jsonBody ?? ''),
        )!;
        _model.otherBool =
            InstrumentsTestsGroup.getInstrumentPropertiesCall.otherdetailBool(
          (_model.apiResultcbv?.jsonBody ?? ''),
        )!;
        safeSetState(() {});
      } else {
        logFirebaseEvent('LabOptionsC_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text((_model.apiResultcbv?.exceptionMessage ?? '')),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      }
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
    return Container(
      constraints: BoxConstraints(
        maxWidth: 800.0,
      ),
      decoration: BoxDecoration(),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(valueOrDefault<double>(
                  () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 14.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 20.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 25.0;
                    } else {
                      return 25.0;
                    }
                  }(),
                  0.0,
                )),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 4.0, 0.0),
                            child: SelectionArea(
                                child: Text(
                              valueOrDefault<String>(
                                widget.labname,
                                'labName',
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            )),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'LAB_OPTIONS_C_COMP_Icon_rsk33tw7_ON_TAP');
                              logFirebaseEvent('Icon_close_dialog_drawer_etc');
                              Navigator.pop(context);
                            },
                            child: Icon(
                              FFIcons.kcross,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: SelectionArea(
                              child: Text(
                            valueOrDefault<String>(
                              widget.instituteName,
                              'Insititute',
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelLargeFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelLargeFamily),
                                ),
                          )),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              wrapWithModel(
                                model: _model.labTypeTagModel,
                                updateCallback: () => safeSetState(() {}),
                                child: LabTypeTagWidget(
                                  labType: widget.labType!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SelectionArea(
                          child: Text(
                        FFLocalizations.of(context).getText(
                          'qn1le94q' /* Tax not included.* */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                      )),
                      Opacity(
                        opacity: 0.5,
                        child: Divider(
                          thickness: 2.0,
                          color: FlutterFlowTheme.of(context).line,
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final avaialableAnalysisType =
                                  _model.instrumentJson?.toList() ?? [];

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(
                                      avaialableAnalysisType.length,
                                      (avaialableAnalysisTypeIndex) {
                                    final avaialableAnalysisTypeItem =
                                        avaialableAnalysisType[
                                            avaialableAnalysisTypeIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 20.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model
                                            .instrumentTestDetailComponentModels
                                            .getModel(
                                          avaialableAnalysisTypeIndex
                                              .toString(),
                                          avaialableAnalysisTypeIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child:
                                            InstrumentTestDetailComponentWidget(
                                          key: Key(
                                            'Keybhf_${avaialableAnalysisTypeIndex.toString()}',
                                          ),
                                          analysis: getJsonField(
                                            avaialableAnalysisTypeItem,
                                            r'''$.analysis_name''',
                                          ).toString(),
                                          solvent: getJsonField(
                                            avaialableAnalysisTypeItem,
                                            r'''$.solvent_method_name''',
                                          ).toString(),
                                          acedemic: getJsonField(
                                            avaialableAnalysisTypeItem,
                                            r'''$.academic_price''',
                                          ).toString(),
                                          industrial: getJsonField(
                                            avaialableAnalysisTypeItem,
                                            r'''$.industrial_price''',
                                          ).toString(),
                                          other: getJsonField(
                                            avaialableAnalysisTypeItem,
                                            r'''$.other_details''',
                                          ).toString(),
                                          analysisBool: _model.analysisBool,
                                          solventBool: _model.solventBool,
                                          acedemicBool: _model.academicBool,
                                          industrialBool: _model.industrilBool,
                                          otherBool: _model.otherBool,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
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
    );
  }
}
