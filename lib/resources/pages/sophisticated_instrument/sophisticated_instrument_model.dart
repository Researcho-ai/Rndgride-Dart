import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bars/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/nav_bars/drawer/drawer_widget.dart';
import '/nav_bars/top_nav_bar/top_nav_bar_widget.dart';
import '/resources/components/sophisticated_instrument_component/sophisticated_instrument_component_widget.dart';
import 'sophisticated_instrument_widget.dart'
    show SophisticatedInstrumentWidget;
import 'package:flutter/material.dart';

class SophisticatedInstrumentModel
    extends FlutterFlowModel<SophisticatedInstrumentWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> allLabsRefList = [];
  void addToAllLabsRefList(DocumentReference item) => allLabsRefList.add(item);
  void removeFromAllLabsRefList(DocumentReference item) =>
      allLabsRefList.remove(item);
  void removeAtIndexFromAllLabsRefList(int index) =>
      allLabsRefList.removeAt(index);
  void insertAtIndexInAllLabsRefList(int index, DocumentReference item) =>
      allLabsRefList.insert(index, item);
  void updateAllLabsRefListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      allLabsRefList[index] = updateFn(allLabsRefList[index]);

  List<String> labFilterCitiesOptions = [];
  void addToLabFilterCitiesOptions(String item) =>
      labFilterCitiesOptions.add(item);
  void removeFromLabFilterCitiesOptions(String item) =>
      labFilterCitiesOptions.remove(item);
  void removeAtIndexFromLabFilterCitiesOptions(int index) =>
      labFilterCitiesOptions.removeAt(index);
  void insertAtIndexInLabFilterCitiesOptions(int index, String item) =>
      labFilterCitiesOptions.insert(index, item);
  void updateLabFilterCitiesOptionsAtIndex(
          int index, Function(String) updateFn) =>
      labFilterCitiesOptions[index] = updateFn(labFilterCitiesOptions[index]);

  List<String> instrumentTestList = [
    'Nuclear Magnetic Resonance (NMR)- 400 MHz (NMR(400))',
    '2D Nuclear Magnetic Resonance (2D NMR)'
  ];
  void addToInstrumentTestList(String item) => instrumentTestList.add(item);
  void removeFromInstrumentTestList(String item) =>
      instrumentTestList.remove(item);
  void removeAtIndexFromInstrumentTestList(int index) =>
      instrumentTestList.removeAt(index);
  void insertAtIndexInInstrumentTestList(int index, String item) =>
      instrumentTestList.insert(index, item);
  void updateInstrumentTestListAtIndex(int index, Function(String) updateFn) =>
      instrumentTestList[index] = updateFn(instrumentTestList[index]);

  dynamic sophisticatedInstruments;

  bool shoSophisticated = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Sophisticated Instruments Tests)] action in SophisticatedInstrument widget.
  ApiCallResponse? sophisticatedInstrumentDesktop;
  // Model for TopNavBar component.
  late TopNavBarModel topNavBarModel;
  // Models for SophisticatedInstrumentComponent dynamic component.
  late FlutterFlowDynamicModels<SophisticatedInstrumentComponentModel>
      sophisticatedInstrumentComponentModels;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;
  // Model for Drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    topNavBarModel = createModel(context, () => TopNavBarModel());
    sophisticatedInstrumentComponentModels =
        FlutterFlowDynamicModels(() => SophisticatedInstrumentComponentModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    topNavBarModel.dispose();
    sophisticatedInstrumentComponentModels.dispose();
    bottomNavBarModel.dispose();
    drawerModel.dispose();
  }
}
