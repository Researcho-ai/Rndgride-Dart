import '/auth/custom_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/onboarding/sign_in_compoent/sign_in_compoent_widget.dart';
import '/resources/components/lab_card/lab_card_widget.dart';
import 'package:flutter/material.dart';
import 'all_labs_list_component_model.dart';
export 'all_labs_list_component_model.dart';

class AllLabsListComponentWidget extends StatefulWidget {
  const AllLabsListComponentWidget({
    super.key,
    this.parameter1,
  });

  final List<DocumentReference>? parameter1;

  @override
  State<AllLabsListComponentWidget> createState() =>
      _AllLabsListComponentWidgetState();
}

class _AllLabsListComponentWidgetState
    extends State<AllLabsListComponentWidget> {
  late AllLabsListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllLabsListComponentModel());

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
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(-1.0, 0.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Builder(
                builder: (context) {
                  final abListRef =
                      (widget.parameter1?.toList() ?? []).take(8).toList();

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                          List.generate(abListRef.length, (abListRefIndex) {
                        final abListRefItem = abListRef[abListRefIndex];
                        return Builder(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 24.0, 0.0),
                            child: StreamBuilder<LabsRecord>(
                              stream: LabsRecord.getDocument(abListRefItem),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 35.0,
                                      height: 35.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final labCardLabsRecord = snapshot.data!;

                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'ALL_LABS_LIST_COMPONENT_Container_5iqj3h');
                                    if (loggedIn) {
                                    } else {
                                      if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall
                                          ? true
                                          : false) {
                                        logFirebaseEvent(
                                            'LabCard_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          useSafeArea: true,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.7,
                                                child: SignInCompoentWidget(
                                                  loginRequered: true,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      } else {
                                        logFirebaseEvent(
                                            'LabCard_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: Container(
                                                height: 440.0,
                                                width: 610.0,
                                                child: SignInCompoentWidget(
                                                  loginRequered: true,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    }
                                  },
                                  child: wrapWithModel(
                                    model: _model.labCardModels.getModel(
                                      abListRefIndex.toString(),
                                      abListRefIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: LabCardWidget(
                                      key: Key(
                                        'Key5iq_${abListRefIndex.toString()}',
                                      ),
                                      labName: labCardLabsRecord.labName,
                                      isInstitutePage: false,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
