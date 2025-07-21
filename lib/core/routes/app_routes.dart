import 'package:event_app_c15_mon/core/routes/page_routes_name.dart';
import 'package:event_app_c15_mon/modules/authentication/pages/forget_password_view.dart';
import 'package:event_app_c15_mon/modules/authentication/pages/login_view.dart';
import 'package:event_app_c15_mon/modules/authentication/pages/register_view.dart';
import 'package:event_app_c15_mon/modules/splash/pages/splash_view.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(
          builder: (_) => SplashView(),
          settings: settings,
        );

      case PageRoutesName.login:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
          settings: settings,
        );
      case PageRoutesName.register:
        return MaterialPageRoute(
          builder: (_) => RegisterView(),
          settings: settings,
        );
      case PageRoutesName.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => SplashView());
    }
  }
}
