import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/resources/components/all_labs_list_component/all_labs_list_component_widget.dart';
import '/resources/components/data_not_found_c_omponent/data_not_found_c_omponent_widget.dart';
import '/resources/components/instruments_details/instruments_details_widget.dart';
import 'institute_specific_labs_widget.dart' show InstituteSpecificLabsWidget;
import 'package:flutter/material.dart';

class InstituteSpecificLabsModel
    extends FlutterFlowModel<InstituteSpecificLabsWidget> {
  ///  Local state fields for this component.

  DocumentReference? defaultLabRef;

  bool isAlreadySearched = false;

  bool searchResultEmpty = false;

  List<DocumentReference> initialLabInstruments = [];
  void addToInitialLabInstruments(DocumentReference item) =>
      initialLabInstruments.add(item);
  void removeFromInitialLabInstruments(DocumentReference item) =>
      initialLabInstruments.remove(item);
  void removeAtIndexFromInitialLabInstruments(int index) =>
      initialLabInstruments.removeAt(index);
  void insertAtIndexInInitialLabInstruments(
          int index, DocumentReference item) =>
      initialLabInstruments.insert(index, item);
  void updateInitialLabInstrumentsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      initialLabInstruments[index] = updateFn(initialLabInstruments[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in instituteSpecificLabs widget.
  List<InstrumentsTestsRecord>? instrumentTestREf;
  // Model for allLabsListComponent component.
  late AllLabsListComponentModel allLabsListComponentModel;
  // Models for InstrumentsDetails dynamic component.
  late FlutterFlowDynamicModels<InstrumentsDetailsModel>
      instrumentsDetailsModels;
  // Model for DataNotFoundCOmponent component.
  late DataNotFoundCOmponentModel dataNotFoundCOmponentModel;

  @override
  void initState(BuildContext context) {
    allLabsListComponentModel =
        createModel(context, () => AllLabsListComponentModel());
    instrumentsDetailsModels =
        FlutterFlowDynamicModels(() => InstrumentsDetailsModel());
    dataNotFoundCOmponentModel =
        createModel(context, () => DataNotFoundCOmponentModel());
  }

  @override
  void dispose() {
    allLabsListComponentModel.dispose();
    instrumentsDetailsModels.dispose();
    dataNotFoundCOmponentModel.dispose();
  }
}
