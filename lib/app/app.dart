import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/common/theme/theme_bloc.dart';
import '../resources/app_style.dart';
import '../routes/navigation_service.dart';
import '../routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (_, state) {
          return MaterialApp(
            navigatorKey: NavigationService.navigatorKey,
            debugShowCheckedModeBanner: false,
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            initialRoute: Routes.splash,
            onGenerateRoute: (settings) =>
                RouteGenerator(settings: settings).getRoute(),
            theme: AppStyle.getApplicationTheme(state is CurrentTheme ? state.varient : ThemeVarient.light.name),
          );
        }
      ),
    );
  }
}
