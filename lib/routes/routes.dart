import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/presentation/authentication/bloc/auth_bloc.dart';
import 'package:mobile/presentation/authentication/pages/init/bloc/init_bloc.dart';
import 'package:mobile/presentation/authentication/pages/init/init_view.dart';
import 'package:mobile/presentation/authentication/pages/signin/signin_view.dart';
import 'package:mobile/presentation/authentication/pages/signup/signup_view.dart';
import 'package:mobile/presentation/home/cubit/home_cubit.dart';
import 'package:mobile/presentation/home/home_view.dart';
import 'package:mobile/presentation/textgen/bloc/text_gen_bloc.dart';
import 'package:mobile/presentation/textgen/pages/textgen_view.dart';
import 'package:page_transition/page_transition.dart';

import '../presentation/splash/bloc/splash_bloc.dart';
import '../presentation/splash/splash_view.dart';
import '../presentation/welcome/welcome_view.dart';

class Routes {
  //welcome
  static const String splash = "/";
  static const String welcome = "/welcome";

  //auth
  static const String signin = "/signin";
  static const String signup = "/signup";
  static const String init = "/init";

  //home
  static const String home = "/home";
  static const String textgen = "/textgen";

}

class RouteGenerator {
  final RouteSettings settings;

  RouteGenerator({required this.settings});

  Route<dynamic> getRoute() {
    switch (settings.name) {
      case Routes.splash:
        return getTransistionPage(BlocProvider(
          create: (context) => SplashBloc()..add(InitApp()),
          child: const SplashView(),
        ));

      case Routes.welcome:
        return getTransistionPage(const WelcomeView());

      case Routes.signup:
        return getTransistionPage(BlocProvider(
          create: (context) => AuthBloc(),
          child: const SignUpView(),
        ));

      case Routes.signin:
        return getTransistionPage(BlocProvider(
          create: (context) => AuthBloc(),
          child: const SignInView(),
        ));

      case Routes.init:
        return getTransistionPage(BlocProvider(
          create: (context) => InitBloc()..add(Initialize()),
          child: const InitView(),
        ));

      case Routes.home:
        return getTransistionPage(BlocProvider(
          create: (context) => HomeCubit(),
          child: const HomeView(),
        ));
      
      case Routes.textgen:
        return getTransistionPage(BlocProvider(
          create: (context) => TextGenBloc(),
          child: const TextGenView(),
        ));

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
