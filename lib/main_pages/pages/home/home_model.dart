import '/backend/api_requests/api_calls.dart';
import '/components/customer_feedback_mobile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/components/customer_feedback_web/customer_feedback_web_widget.dart';
import '/main_pages/components/requerment_button/requerment_button_widget.dart';
import '/main_pages/components/user_requirement_copy/user_requirement_copy_widget.dart';
import '/nav_bars/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/nav_bars/drawer/drawer_widget.dart';
import '/nav_bars/footer/footer_widget.dart';
import '/nav_bars/footer_mobile/footer_mobile_widget.dart';
import '/nav_bars/top_nav_bar/top_nav_bar_widget.dart';
import '/resources/components/data_not_found_c_omponent/data_not_found_c_omponent_widget.dart';
import '/resources/components/instruments_details/instruments_details_widget.dart';
import '/resources/components/sophisticated_instrument_component/sophisticated_instrument_component_widget.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  int count = 6;

  int? indexValue = 1;

  String? tagValue = 'Testing and Development Facility';

  int contactUsButtomIndex = 0;

  bool openRequermentForm = false;

  List<String> instrumentTestLIst = [
    '2D Nuclear Magnetic Resonance (2D NMR)',
    'Nuclear Magnetic Resonance (NMR)- 400 MHz (NMR(400))'
  ];
  void addToInstrumentTestLIst(String item) => instrumentTestLIst.add(item);
  void removeFromInstrumentTestLIst(String item) =>
      instrumentTestLIst.remove(item);
  void removeAtIndexFromInstrumentTestLIst(int index) =>
      instrumentTestLIst.removeAt(index);
  void insertAtIndexInInstrumentTestLIst(int index, String item) =>
      instrumentTestLIst.insert(index, item);
  void updateInstrumentTestLIstAtIndex(int index, Function(String) updateFn) =>
      instrumentTestLIst[index] = updateFn(instrumentTestLIst[index]);

  bool showSophisticated = false;

  dynamic instrumentaTestResult;

  bool searchActive = false;

  dynamic emptyJson;

  int? resultLength = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Sophisticated Instruments Tests)] action in Home widget.
  ApiCallResponse? sophisticatedInstrumentDesktop;
  // Stores action output result for [Backend Call - API (Get Sophisticated Instruments Tests)] action in Home widget.
  ApiCallResponse? sophisticatedInstrumentsMobile;
  // Stores action output result for [Backend Call - API (Get Instruments Tests)] action in Home widget.
  ApiCallResponse? instrumentsFromAPI;
  // Model for Drawer component.
  late DrawerModel drawerModel;
  // Model for TopNavBar component.
  late TopNavBarModel topNavBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textFieldTextController;
  String? Function(BuildContext, String?)? textFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (Search Instrument  Test)] action in TextField widget.
  ApiCallResponse? searchOutput;
  // Models for InstrumentsDetails dynamic component.
  late FlutterFlowDynamicModels<InstrumentsDetailsModel>
      instrumentsDetailsModels1;
  // Models for SophisticatedInstrumentComponent dynamic component.
  late FlutterFlowDynamicModels<SophisticatedInstrumentComponentModel>
      sophisticatedInstrumentComponentModels1;
  // Model for DataNotFoundCOmponent component.
  late DataNotFoundCOmponentModel dataNotFoundCOmponentModel;
  // Models for SophisticatedInstrumentComponent dynamic component.
  late FlutterFlowDynamicModels<SophisticatedInstrumentComponentModel>
      sophisticatedInstrumentComponentModels2;
  // Models for InstrumentsDetails dynamic component.
  late FlutterFlowDynamicModels<InstrumentsDetailsModel>
      instrumentsDetailsModels2;
  // State field(s) for PageView widget.
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  // Model for customerFeedbackWeb component.
  late CustomerFeedbackWebModel customerFeedbackWebModel1;
  // Model for customerFeedbackWeb component.
  late CustomerFeedbackWebModel customerFeedbackWebModel2;
  // Model for customerFeedbackWeb component.
  late CustomerFeedbackWebModel customerFeedbackWebModel3;
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // Model for CustomerFeedbackMobile component.
  late CustomerFeedbackMobileModel customerFeedbackMobileModel1;
  // Model for CustomerFeedbackMobile component.
  late CustomerFeedbackMobileModel customerFeedbackMobileModel2;
  // Model for CustomerFeedbackMobile component.
  late CustomerFeedbackMobileModel customerFeedbackMobileModel3;
  // Model for requermentButton component.
  late RequermentButtonModel requermentButtonModel1;
  // Model for requermentButton component.
  late RequermentButtonModel requermentButtonModel2;
  // Model for requermentButton component.
  late RequermentButtonModel requermentButtonModel3;
  // Model for UserRequirementCopy component.
  late UserRequirementCopyModel userRequirementCopyModel;
  // Model for Footer component.
  late FooterModel footerModel;
  // Model for FooterMobile component.
  late FooterMobileModel footerMobileModel;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    drawerModel = createModel(context, () => DrawerModel());
    topNavBarModel = createModel(context, () => TopNavBarModel());
    instrumentsDetailsModels1 =
        FlutterFlowDynamicModels(() => InstrumentsDetailsModel());
    sophisticatedInstrumentComponentModels1 =
        FlutterFlowDynamicModels(() => SophisticatedInstrumentComponentModel());
    dataNotFoundCOmponentModel =
        createModel(context, () => DataNotFoundCOmponentModel());
    sophisticatedInstrumentComponentModels2 =
        FlutterFlowDynamicModels(() => SophisticatedInstrumentComponentModel());
    instrumentsDetailsModels2 =
        FlutterFlowDynamicModels(() => InstrumentsDetailsModel());
    customerFeedbackWebModel1 =
        createModel(context, () => CustomerFeedbackWebModel());
    customerFeedbackWebModel2 =
        createModel(context, () => CustomerFeedbackWebModel());
    customerFeedbackWebModel3 =
        createModel(context, () => CustomerFeedbackWebModel());
    customerFeedbackMobileModel1 =
        createModel(context, () => CustomerFeedbackMobileModel());
    customerFeedbackMobileModel2 =
        createModel(context, () => CustomerFeedbackMobileModel());
    customerFeedbackMobileModel3 =
        createModel(context, () => CustomerFeedbackMobileModel());
    requermentButtonModel1 =
        createModel(context, () => RequermentButtonModel());
    requermentButtonModel2 =
        createModel(context, () => RequermentButtonModel());
    requermentButtonModel3 =
        createModel(context, () => RequermentButtonModel());
    userRequirementCopyModel =
        createModel(context, () => UserRequirementCopyModel());
    footerModel = createModel(context, () => FooterModel());
    footerMobileModel = createModel(context, () => FooterMobileModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    drawerModel.dispose();
    topNavBarModel.dispose();
    textFieldFocusNode?.dispose();
    textFieldTextController?.dispose();

    instrumentsDetailsModels1.dispose();
    sophisticatedInstrumentComponentModels1.dispose();
    dataNotFoundCOmponentModel.dispose();
    sophisticatedInstrumentComponentModels2.dispose();
    instrumentsDetailsModels2.dispose();
    customerFeedbackWebModel1.dispose();
    customerFeedbackWebModel2.dispose();
    customerFeedbackWebModel3.dispose();
    customerFeedbackMobileModel1.dispose();
    customerFeedbackMobileModel2.dispose();
    customerFeedbackMobileModel3.dispose();
    requermentButtonModel1.dispose();
    requermentButtonModel2.dispose();
    requermentButtonModel3.dispose();
    userRequirementCopyModel.dispose();
    footerModel.dispose();
    footerMobileModel.dispose();
    bottomNavBarModel.dispose();
  }
}
