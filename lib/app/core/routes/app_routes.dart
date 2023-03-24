import 'package:auth_app/app/pages/error/error_page.dart';
import 'package:auth_app/app/pages/login/view/register_login_page.dart';
import 'package:auth_app/app/pages/login/view/sign_in_login_page.dart';
import 'package:auth_app/app/pages/login/view/start_login_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = '/';
  static const String startlogin = '/startlogin';
  static const String signInlogin = '/signinlogin';
  static const String registerlogin = '/registerlogin';
  static const String error = '/error';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const StartLoginPage());
      case "/startlogin":
        return MaterialPageRoute(builder: (context) => const StartLoginPage());
      case "/signinlogin":
        return MaterialPageRoute(builder: (context) => const SignInLoginPage());
      case "/registerlogin":
        return MaterialPageRoute(builder: (context) => const RegisterLoginPage());
      default:
        return MaterialPageRoute(builder: (context) => const ErrorPage());
    }
  }
}
