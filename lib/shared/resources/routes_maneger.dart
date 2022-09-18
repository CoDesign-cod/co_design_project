import 'package:codesign_app/pages/forget_password_page.dart';
import 'package:codesign_app/pages/home_page.dart';
import 'package:codesign_app/pages/sign_in_page.dart';
import 'package:codesign_app/pages/sign_up_page.dart';
import 'package:codesign_app/screens/splash_screen.dart';
import 'package:codesign_app/shared/resources/strings_manager.dart';
import 'package:flutter/material.dart';

// to add new page follow that 3 steps
// 1 - add String variable
// 2 - add case and return page
// 3 - add open method in ViewsManager

class Routes {
  static const String splashRout = "/";
  static const String loginRout = "/login";
  static const String registerRout = "/register";
  static const String forgotPasswordRout = "/forgetPassword";
  static const String mainRout = "/main";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRout:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.loginRout:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case Routes.registerRout:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case Routes.forgotPasswordRout:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordPage());
      case Routes.mainRout:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return _unDefinedRout();
    }
  }

  static Route<dynamic> _unDefinedRout() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(StringsManager.noRouteFound),
              ),
              body: const Center(
                child: Text(StringsManager.noRouteFound),
              ),
            ));
  }
}
