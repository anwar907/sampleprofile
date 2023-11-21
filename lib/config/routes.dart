import 'package:flutter/material.dart';
import 'package:tokosebelah/app/modules/login_pages/view/login_view.dart';
import 'package:tokosebelah/app/modules/profile_page/profile_page.dart';
import 'package:tokosebelah/app/modules/splash_page/view/splash_view.dart';

class AppRouter {
  MaterialPageRoute? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginView.routeName:
        return MaterialPageRoute(
          builder: (context) => LoginView(),
          settings: settings,
        );

      case ProfilePage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ProfilePage(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
    }
  }
}

class Routes {
  static const String app = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String profile = '/profile';
}
