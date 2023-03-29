import 'package:auth_app/app/pages/error/error_page.dart';
import 'package:auth_app/app/pages/home/view/home_page.dart';
import 'package:auth_app/app/pages/login/view/register_login_page.dart';
import 'package:auth_app/app/pages/login/view/sign_in_login_page.dart';
import 'package:auth_app/app/pages/login/view/start_login_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = '/';
  static const String startlogin = '/startlogin';
  static const String signInlogin = '/signinlogin';
  static const String registerlogin = '/registerlogin';
  static const String home = '/home';

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
      case "/home":
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return MaterialPageRoute(builder: (context) => const ErrorPage());
    }
  }
}
