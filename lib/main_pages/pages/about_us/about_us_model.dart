import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/components/icon_component/icon_component_widget.dart';
import '/nav_bars/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/nav_bars/drawer/drawer_widget.dart';
import '/nav_bars/footer/footer_widget.dart';
import '/nav_bars/footer_mobile/footer_mobile_widget.dart';
import '/nav_bars/top_nav_bar/top_nav_bar_widget.dart';
import 'about_us_widget.dart' show AboutUsWidget;
import 'package:flutter/material.dart';

class AboutUsModel extends FlutterFlowModel<AboutUsWidget> {
  ///  Local state fields for this page.

  bool activeSearch = false;

  bool analysisbool = false;

  bool solventbool = false;

  ///  State fields for stateful widgets in this page.

  // Model for TopNavBar component.
  late TopNavBarModel topNavBarModel;
  // Model for IconComponent component.
  late IconComponentModel iconComponentModel1;
  // Model for IconComponent component.
  late IconComponentModel iconComponentModel2;
  // Model for IconComponent component.
  late IconComponentModel iconComponentModel3;
  // Model for IconComponent component.
  late IconComponentModel iconComponentModel4;
  // Model for Footer component.
  late FooterModel footerModel;
  // Model for FooterMobile component.
  late FooterMobileModel footerMobileModel;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;
  // Model for Drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    topNavBarModel = createModel(context, () => TopNavBarModel());
    iconComponentModel1 = createModel(context, () => IconComponentModel());
    iconComponentModel2 = createModel(context, () => IconComponentModel());
    iconComponentModel3 = createModel(context, () => IconComponentModel());
    iconComponentModel4 = createModel(context, () => IconComponentModel());
    footerModel = createModel(context, () => FooterModel());
    footerMobileModel = createModel(context, () => FooterMobileModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    topNavBarModel.dispose();
    iconComponentModel1.dispose();
    iconComponentModel2.dispose();
    iconComponentModel3.dispose();
    iconComponentModel4.dispose();
    footerModel.dispose();
    footerMobileModel.dispose();
    bottomNavBarModel.dispose();
    drawerModel.dispose();
  }
}
