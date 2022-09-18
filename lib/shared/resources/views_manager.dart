import 'package:flutter/material.dart';
import 'routes_maneger.dart';

class ViewsManager {
  // =============== dynamic pages =================

  // screen will show after splash screen
  static homeAfterSplash(context) {
    // todo add on boarding
    // if skip on boarding
    true ? tempHome(context) : null; //openOnBoardingView(context);
    // uncomment if you will use onBoarding
  }

  // check if user login or not
  static void tempHome(context) {
    // todo get value from shared preference when user login
    bool isLogin = false;
    isLogin ? openHomeView(context) : openLoginMain(context);
  }

  // =============== const pages =================
  // ------------ with out back ------------

  // home
  static void openHomeView(context) {
    _openViewNoBack(context, Routes.mainRout);
  }

  // login
  static void openLoginMain(context) {
    _openViewNoBack(context, Routes.loginRout);
  }

  // ------------ with back ------------
  // NOTE : "WB" (with back) in the end of function name that mean you can use back button

  // register
  static void openRegisterWB(context) {
    _openViewWithBack(context, Routes.registerRout);
  }

  // forget password
  static void openForgetPassWB(context) {
    _openViewWithBack(context, Routes.forgotPasswordRout);
  }

  // go back if you can
  static void backIfUCan(context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  // ========== privet methods ==========

  // user can't back to last page
  static void _openViewNoBack(context, nextPage) {
    Navigator.of(context).pushNamedAndRemoveUntil(nextPage, (route) => false);
  }

  // user can back to last page
  static void _openViewWithBack(context, nextPage) {
    Navigator.of(context).pushNamed(nextPage);
  }
}
