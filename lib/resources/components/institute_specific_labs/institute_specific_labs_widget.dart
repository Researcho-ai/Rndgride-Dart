import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/resources/components/all_labs_list_component/all_labs_list_component_widget.dart';
import '/resources/components/data_not_found_c_omponent/data_not_found_c_omponent_widget.dart';
import '/resources/components/instruments_details/instruments_details_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'institute_specific_labs_model.dart';
export 'institute_specific_labs_model.dart';

class InstituteSpecificLabsWidget extends StatefulWidget {
  const InstituteSpecificLabsWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  });

  final DocumentReference? parameter1;
  final List<LabsRecord>? parameter2;
  final DocumentReference? parameter3;

  @override
  State<InstituteSpecificLabsWidget> createState() =>
      _InstituteSpecificLabsWidgetState();
}

class _InstituteSpecificLabsWidgetState
    extends State<InstituteSpecificLabsWidget> {
  late InstituteSpecificLabsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InstituteSpecificLabsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('INSTITUTE_SPECIFIC_LABS_instituteSpecifi');
      if (widget.parameter2!.length > 0) {
        logFirebaseEvent('instituteSpecificLabs_update_component_s');
        _model.defaultLabRef = widget.parameter2?.firstOrNull?.reference;
        logFirebaseEvent('instituteSpecificLabs_firestore_query');
        _model.instrumentTestREf = await queryInstrumentsTestsRecordOnce(
          parent: widget.parameter3,
          queryBuilder: (instrumentsTestsRecord) =>
              instrumentsTestsRecord.where(
            'is_instrument_active',
            isEqualTo: true,
          ),
        );
        logFirebaseEvent('instituteSpecificLabs_update_component_s');
        _model.initialLabInstruments = _model.instrumentTestREf!
            .map((e) => e.reference)
            .toList()
            .toList()
            .cast<DocumentReference>();
        safeSetState(() {});
      }
      logFirebaseEvent('instituteSpecificLabs_update_app_state');

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
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 10.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 13.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 16.0;
                          } else {
                            return 16.0;
                          }
                        }(),
                        16.0,
                      ),
                      0.0,
                      valueOrDefault<double>(
                        () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 10.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 13.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 16.0;
                          } else {
                            return 16.0;
                          }
                        }(),
                        16.0,
                      )),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0,
                          valueOrDefault<double>(
                            () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return 10.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return 12.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 20.0;
                              } else {
                                return 20.0;
                              }
                            }(),
                            20.0,
                          ),
                          24.0,
                          valueOrDefault<double>(
                            () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return 10.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return 12.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 20.0;
                              } else {
                                return 20.0;
                              }
                            }(),
                            20.0,
                          )),
                      child: StreamBuilder<InstitutesRecord>(
                        stream:
                            InstitutesRecord.getDocument(widget.parameter1!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 35.0,
                                height: 35.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }

                          final rowInstitutesRecord = snapshot.data!;

                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: SelectionArea(
                                    child: Text(
                                  rowInstitutesRecord.instituteName,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                        letterSpacing: 0.0,
                                      ),
                                )),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              if (!_model.searchResultEmpty)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                  child: wrapWithModel(
                    model: _model.allLabsListComponentModel,
                    updateCallback: () => safeSetState(() {}),
                    child: AllLabsListComponentWidget(
                      parameter1:
                          widget.parameter2?.map((e) => e.reference).toList(),
                    ),
                  ),
                ),
              if (!_model.searchResultEmpty)
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: FutureBuilder<int>(
                    future: queryInstrumentsTestsRecordCount(
                      parent: widget.parameter3,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 35.0,
                            height: 35.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      int containerCount = snapshot.data!;

                      return Container(
                        decoration: BoxDecoration(),
                        child: Visibility(
                          visible: containerCount > 0,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 24.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: StreamBuilder<LabsRecord>(
                                      stream: LabsRecord.getDocument(
                                          _model.defaultLabRef!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 35.0,
                                              height: 35.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        final textLabsRecord = snapshot.data!;

                                        return Text(
                                          '${textLabsRecord.labName} - Available Instruments :',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
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
                      );
                    },
                  ),
                ),
              if ((_model.defaultLabRef != null) && !_model.searchResultEmpty)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: StreamBuilder<List<InstrumentsTestsRecord>>(
                    stream: queryInstrumentsTestsRecord(
                      parent: widget.parameter3,
                      queryBuilder: (instrumentsTestsRecord) =>
                          instrumentsTestsRecord.where(
                        'is_instrument_active',
                        isEqualTo: true,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 35.0,
                            height: 35.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<InstrumentsTestsRecord>
                          labsInstrumentInstrumentsTestsRecordList =
                          snapshot.data!;

                      return MasonryGridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return 1;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return 2;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return 3;
                            } else {
                              return 3;
                            }
                          }(),
                        ),
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        itemCount:
                            labsInstrumentInstrumentsTestsRecordList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, labsInstrumentIndex) {
                          final labsInstrumentInstrumentsTestsRecord =
                              labsInstrumentInstrumentsTestsRecordList[
                                  labsInstrumentIndex];
                          return Container(
                            decoration: BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.instrumentsDetailsModels.getModel(
                                labsInstrumentIndex.toString(),
                                labsInstrumentIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: InstrumentsDetailsWidget(
                                key: Key(
                                  'Keyg7f_${labsInstrumentIndex.toString()}',
                                ),
                                instrumentTestName:
                                    labsInstrumentInstrumentsTestsRecord
                                        .instrumentTestName,
                                index: labsInstrumentIndex,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              if (_model.searchResultEmpty)
                Flexible(
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.dataNotFoundCOmponentModel,
                        updateCallback: () => safeSetState(() {}),
                        child: DataNotFoundCOmponentWidget(
                          isJobs: false,
                        ),
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
