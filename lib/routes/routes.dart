import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../presentation/splash/splash_view.dart';
import '../presentation/welcome/welcome_view.dart';

class Routes {
  //welcome
  static const String splash = "/";
  static const String welcome = "/welcome";

}

class RouteGenerator {
  final RouteSettings settings;

  RouteGenerator({required this.settings});

  Route<dynamic> getRoute() {
    switch (settings.name) {
      case Routes.splash:
        return getTransistionPage(const SplashView());
      
      case Routes.welcome:
        return getTransistionPage(const WelcomeView());
        
      default:
        return unDefinedRoute();
    }
  }

  getTransistionPage(Widget child) {
    return PageTransition(
      child: child,
      settings: settings,
      type: PageTransitionType.fade,
    );
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Not Found'),
        ),
      ),
    );
  }
}
