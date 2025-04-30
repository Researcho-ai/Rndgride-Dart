import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/resources/components/tag_component/tag_component_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resource_booking_model.dart';
export 'resource_booking_model.dart';

class ResourceBookingWidget extends StatefulWidget {
  const ResourceBookingWidget({
    super.key,
    this.instrumentTestName,
    this.analysisName,
    this.solventMethodName,
    this.priceRate,
    this.otherDetails,
    this.instrumentDetailJson,
    this.instrumentID,
  });

  final String? instrumentTestName;
  final String? analysisName;
  final String? solventMethodName;
  final int? priceRate;
  final String? otherDetails;
  final dynamic instrumentDetailJson;
  final String? instrumentID;

  @override
  State<ResourceBookingWidget> createState() => _ResourceBookingWidgetState();
}

class _ResourceBookingWidgetState extends State<ResourceBookingWidget> {
  late ResourceBookingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResourceBookingModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('RESOURCE_BOOKING_ResourceBooking_ON_INIT');
      logFirebaseEvent('ResourceBooking_update_component_state');
      _model.sampleQuantity = 1;
      _model.basePrice = widget.priceRate!.toDouble() * 1;
      safeSetState(() {});
      logFirebaseEvent('ResourceBooking_update_component_state');
      _model.plateformFee = (_model.sampleQuantity!) * 50;
      safeSetState(() {});
      logFirebaseEvent('ResourceBooking_update_component_state');
      _model.totalFee =
          (widget.priceRate!.toDouble() * 1) + (_model.plateformFee!);
      safeSetState(() {});
      logFirebaseEvent('ResourceBooking_set_form_field');
      safeSetState(() {
        _model.firstNameTextController?.text =
            _model.sampleQuantity!.toString();
        _model.firstNameMask.updateMask(
          newValue: TextEditingValue(
            text: _model.firstNameTextController!.text,
          ),
        );
      });
    });

    _model.textController1 ??=
        TextEditingController(text: widget.analysisName);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.solventMethodName);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.firstNameTextController ??=
        TextEditingController(text: _model.sampleQuantity?.toString());
    _model.firstNameFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(valueOrDefault<double>(
              () {
                if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                  return 0.0;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointMedium) {
                  return 0.0;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointLarge) {
                  return 8.0;
                } else {
                  return 8.0;
                }
              }(),
              0.0,
            )),
            bottomRight: Radius.circular(valueOrDefault<double>(
              () {
                if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                  return 0.0;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointMedium) {
                  return 0.0;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointLarge) {
                  return 8.0;
                } else {
                  return 8.0;
                }
              }(),
              0.0,
            )),
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        child: Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (responsiveVisibility(
                  context: context,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  SizedBox(
                    width: 100.0,
                    child: Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).accent4,
                    ),
                  ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 12.0, 0.0),
                                  child: Container(
                                    width: valueOrDefault<double>(
                                      () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 60.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 80.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 100.0;
                                        } else {
                                          return 100.0;
                                        }
                                      }(),
                                      100.0,
                                    ),
                                    height: valueOrDefault<double>(
                                      () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 60.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 80.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 100.0;
                                        } else {
                                          return 100.0;
                                        }
                                      }(),
                                      100.0,
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      getJsonField(
                                        widget.instrumentDetailJson,
                                        r'''$.lab_image''',
                                      ).toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: AutoSizeText(
                                              getJsonField(
                                                widget.instrumentDetailJson,
                                                r'''$.lab_name''',
                                              ).toString(),
                                              minFontSize: 22.0,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        font:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium,
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'yho5yuql' /* by  */,
                                              ),
                                              textAlign: TextAlign.start,
                                              minFontSize: 14.0,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Flexible(
                                            child: AutoSizeText(
                                              getJsonField(
                                                widget.instrumentDetailJson,
                                                r'''$.institute_name''',
                                              ).toString(),
                                              minFontSize: 16.0,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: wrapWithModel(
                                                model: _model.tagComponentModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TagComponentWidget(
                                                  text: getJsonField(
                                                    widget
                                                        .instrumentDetailJson,
                                                    r'''$.lab_type''',
                                                  ).toString(),
                                                  tagColor: Color(0xFFFFF1C2),
                                                  textColor: Color(0xFF141B33),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                          ))
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'RESOURCE_BOOKING_Icon_gjcr6x57_ON_TAP');
                                logFirebaseEvent(
                                    'Icon_close_dialog_drawer_etc');
                                Navigator.pop(context);
                              },
                              child: Icon(
                                FFIcons.kcross,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                valueOrDefault<String>(
                                  widget.instrumentTestName,
                                  '-',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (widget.analysisName != null &&
                          widget.analysisName != '')
                        Container(
                          child: TextFormField(
                            controller: _model.textController1,
                            focusNode: _model.textFieldFocusNode1,
                            autofocus: false,
                            readOnly: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: FFLocalizations.of(context).getText(
                                '9ztbrb4r' /* Analysis */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    letterSpacing: 0.0,
                                  ),
                              alignLabelWithHint: false,
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  font: FlutterFlowTheme.of(context).labelLarge,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                            maxLines: null,
                            validator: _model.textController1Validator
                                .asValidator(context),
                          ),
                        ),
                      if (widget.solventMethodName != null &&
                          widget.solventMethodName != '')
                        Container(
                          decoration: BoxDecoration(),
                          child: TextFormField(
                            controller: _model.textController2,
                            focusNode: _model.textFieldFocusNode2,
                            autofocus: false,
                            readOnly: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: FFLocalizations.of(context).getText(
                                '18zrjwbx' /* Solvent / Method */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    letterSpacing: 0.0,
                                  ),
                              alignLabelWithHint: false,
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  font: FlutterFlowTheme.of(context).labelLarge,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                            maxLines: null,
                            validator: _model.textController2Validator
                                .asValidator(context),
                          ),
                        ),
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 24.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'rcl9fhuj' /* Specify the No of Samples : */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  font: FlutterFlowTheme.of(context).labelLarge,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.sampleQuantity! > 1)
                              FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: FaIcon(
                                  FontAwesomeIcons.minus,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 16.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'RESOURCE_BOOKING_COMP_minus_ICN_ON_TAP');
                                  if (_model.sampleQuantity! <= 1) {
                                    logFirebaseEvent('IconButton_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content: Text(
                                              'Sample Quantity Can`t be 0.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    logFirebaseEvent(
                                        'IconButton_update_component_state');
                                    _model.sampleQuantity =
                                        _model.sampleQuantity! + -1;
                                    safeSetState(() {});
                                    if (widget.priceRate! < 50) {
                                      logFirebaseEvent(
                                          'IconButton_update_component_state');
                                      _model.basePrice =
                                          widget.priceRate!.toDouble() *
                                              (_model.sampleQuantity!);
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'IconButton_update_component_state');
                                      _model.totalFee =
                                          (widget.priceRate!.toDouble() *
                                                  (_model.sampleQuantity!)) +
                                              50.0;
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'IconButton_set_form_field');
                                      safeSetState(() {
                                        _model.firstNameTextController?.text =
                                            _model.sampleQuantity!.toString();
                                        _model.firstNameMask.updateMask(
                                          newValue: TextEditingValue(
                                            text: _model
                                                .firstNameTextController!.text,
                                          ),
                                        );
                                      });
                                    } else {
                                      logFirebaseEvent(
                                          'IconButton_update_component_state');
                                      _model.basePrice =
                                          widget.priceRate!.toDouble() *
                                              (_model.sampleQuantity!);
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'IconButton_update_component_state');
                                      _model.totalFee =
                                          (widget.priceRate!.toDouble() *
                                                  (_model.sampleQuantity!)) +
                                              50.0;
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'IconButton_set_form_field');
                                      safeSetState(() {
                                        _model.firstNameTextController?.text =
                                            _model.sampleQuantity!.toString();
                                        _model.firstNameMask.updateMask(
                                          newValue: TextEditingValue(
                                            text: _model
                                                .firstNameTextController!.text,
                                          ),
                                        );
                                      });
                                    }
                                  }
                                },
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Container(
                                width: 50.0,
                                child: TextFormField(
                                  controller: _model.firstNameTextController,
                                  focusNode: _model.firstNameFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.firstNameTextController',
                                    Duration(milliseconds: 100),
                                    () async {
                                      logFirebaseEvent(
                                          'RESOURCE_BOOKING_FirstName_ON_TEXTFIELD_');
                                      if (_model.firstNameTextController.text !=
                                              '') {
                                        logFirebaseEvent(
                                            'FirstName_update_component_state');
                                        _model.sampleQuantity = int.tryParse(
                                            _model
                                                .firstNameTextController.text);
                                        safeSetState(() {});
                                        if (_model.sampleQuantity! >= 1) {
                                          if (!((widget.priceRate! > 50) &&
                                              (_model.plateformFee! > 100.0))) {
                                            logFirebaseEvent(
                                                'FirstName_update_component_state');
                                            _model.plateformFee =
                                                (_model.sampleQuantity!) * 50;
                                            safeSetState(() {});
                                          }
                                          logFirebaseEvent(
                                              'FirstName_update_component_state');
                                          _model.basePrice =
                                              widget.priceRate!.toDouble() *
                                                  (_model.sampleQuantity!);
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'FirstName_update_component_state');
                                          _model.totalFee = (widget.priceRate!
                                                      .toDouble() *
                                                  (_model.sampleQuantity!)) +
                                              (_model.plateformFee!);
                                          safeSetState(() {});
                                          return;
                                        } else {
                                          logFirebaseEvent(
                                              'FirstName_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text(
                                                    'Sample Quantity Can`t be 0'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          logFirebaseEvent(
                                              'FirstName_update_component_state');
                                          _model.sampleQuantity = 1;
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'FirstName_set_form_field');
                                          safeSetState(() {
                                            _model.firstNameTextController
                                                    ?.text =
                                                _model.sampleQuantity!
                                                    .toString();
                                            _model.firstNameMask.updateMask(
                                              newValue: TextEditingValue(
                                                text: _model
                                                    .firstNameTextController!
                                                    .text,
                                              ),
                                            );
                                          });
                                          logFirebaseEvent(
                                              'FirstName_update_component_state');
                                          _model.totalFee =
                                              widget.priceRate!.toDouble() +
                                                  (_model.plateformFee!);
                                          _model.basePrice = widget.priceRate!
                                                  .toDouble() *
                                              _model.sampleQuantity!.toDouble();
                                          safeSetState(() {});
                                          return;
                                        }
                                      } else {
                                        logFirebaseEvent(
                                            'FirstName_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  'Sample Quantity Can`t Be Blank'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        logFirebaseEvent(
                                            'FirstName_update_component_state');
                                        _model.sampleQuantity = 1;
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'FirstName_set_form_field');
                                        safeSetState(() {
                                          _model.firstNameTextController?.text =
                                              _model.sampleQuantity!.toString();
                                          _model.firstNameMask.updateMask(
                                            newValue: TextEditingValue(
                                              text: _model
                                                  .firstNameTextController!
                                                  .text,
                                            ),
                                          );
                                        });
                                        logFirebaseEvent(
                                            'FirstName_update_component_state');
                                        _model.basePrice = widget.priceRate!
                                                .toDouble() *
                                            _model.sampleQuantity!.toDouble();
                                        _model.plateformFee =
                                            (_model.sampleQuantity!) * 50;
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'FirstName_update_component_state');
                                        _model.totalFee =
                                            widget.priceRate!.toDouble() +
                                                (_model.plateformFee!);
                                        safeSetState(() {});
                                        return;
                                      }
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).border,
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  validator: _model
                                      .firstNameTextControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [_model.firstNameMask],
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'RESOURCE_BOOKING_COMP_add_ICN_ON_TAP');
                                logFirebaseEvent(
                                    'IconButton_update_component_state');
                                _model.sampleQuantity =
                                    _model.sampleQuantity! + 1;
                                safeSetState(() {});
                                if (!((widget.priceRate! > 50) &&
                                    (_model.plateformFee! > 100.0))) {
                                  logFirebaseEvent(
                                      'IconButton_update_component_state');
                                  _model.plateformFee = 50.0;
                                  safeSetState(() {});
                                }
                                logFirebaseEvent(
                                    'IconButton_update_component_state');
                                _model.basePrice =
                                    widget.priceRate!.toDouble() *
                                        (_model.sampleQuantity!);
                                _model.totalFee =
                                    (widget.priceRate!.toDouble() *
                                            (_model.sampleQuantity!)) +
                                        (_model.plateformFee!);
                                safeSetState(() {});
                                logFirebaseEvent('IconButton_set_form_field');
                                safeSetState(() {
                                  _model.firstNameTextController?.text =
                                      _model.sampleQuantity!.toString();
                                  _model.firstNameMask.updateMask(
                                    newValue: TextEditingValue(
                                      text:
                                          _model.firstNameTextController!.text,
                                    ),
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'w7v0v5wo' /* Booking Details */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: FlutterFlowTheme.of(context).titleSmall,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 1.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ncsrxrtx' /* Base Fees */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 1.0, 0.0),
                                child: Text(
                                  widget.priceRate != 0
                                      ? '₹ ${((widget.priceRate!) * (_model.sampleQuantity!)).toString()}'
                                      : 'On Request',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 1.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'fl0s2857' /* Platform Fees */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 1.0, 0.0),
                                child: Text(
                                  '₹ ${valueOrDefault<String>(
                                    _model.plateformFee?.toString(),
                                    '-',
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.8,
                          color: FlutterFlowTheme.of(context).line,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ml4dpckd' /* Total */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    1.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  widget.priceRate != 0
                                      ? '₹ ${valueOrDefault<String>(
                                          _model.totalFee?.toString(),
                                          '-',
                                        )}'
                                      : 'On Request Price + ₹ ${_model.plateformFee?.toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: FlutterFlowTheme.of(context)
                                            .titleSmall,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 1.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'msai3psm' /* * GST (18%) & Delivery Charges... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .labelSmall,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'RESOURCE_BOOKING_ConfirmButton_ON_TAP');
                        logFirebaseEvent(
                            'ConfirmButton_close_dialog_drawer_etc');
                        Navigator.pop(context);
                      },
                      text: FFLocalizations.of(context).getText(
                        '1tnpr8xi' /* Confirm Request */,
                      ),
                      options: FFButtonOptions(
                        width: 180.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              font: FlutterFlowTheme.of(context).bodyMedium,
                              color: FlutterFlowTheme.of(context).buttonText,
                              letterSpacing: 0.0,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
