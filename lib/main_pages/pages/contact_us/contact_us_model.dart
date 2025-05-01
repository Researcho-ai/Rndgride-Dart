import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/components/requerment_button/requerment_button_widget.dart';
import '/main_pages/components/user_requirement_copy/user_requirement_copy_widget.dart';
import '/nav_bars/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/nav_bars/footer/footer_widget.dart';
import '/nav_bars/footer_mobile/footer_mobile_widget.dart';
import '/nav_bars/top_nav_bar/top_nav_bar_widget.dart';
import 'contact_us_widget.dart' show ContactUsWidget;
import 'package:flutter/material.dart';

class ContactUsModel extends FlutterFlowModel<ContactUsWidget> {
  ///  Local state fields for this page.

  bool openRequermentForm = true;

  int indexValue = 1;

  String tagValue = 'Testing and Development Facility';

  ///  State fields for stateful widgets in this page.

  // Model for TopNavBar component.
  late TopNavBarModel topNavBarModel;
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
    topNavBarModel = createModel(context, () => TopNavBarModel());
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
    topNavBarModel.dispose();
    requermentButtonModel1.dispose();
    requermentButtonModel2.dispose();
    requermentButtonModel3.dispose();
    userRequirementCopyModel.dispose();
    footerModel.dispose();
    footerMobileModel.dispose();
    bottomNavBarModel.dispose();
  }
}
