import 'package:flutter/material.dart';

import '../../config/router/routes.dart';
import '../../views/splash/splash_page.dart';
import '../../views/auth/login_page.dart';
import '../../views/home/home_page.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> routingApp = {
    Routes.splashPage: (context) => const SplashPage(),
    Routes.loginPage: (context) => const LoginPage(),
    Routes.homePage: (context) => const HomePage(),
  };
}
