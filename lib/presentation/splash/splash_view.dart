import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/constants/assets_const.dart';
import 'package:mobile/extensions/context_exten.dart';
import 'package:mobile/presentation/splash/splash_viewmodel.dart';
import 'package:mobile/routes/routes.dart';

import 'bloc/splash_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    SplashViewModel(context).initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if(state is UnAuthenticated){
          context.navigateTo(Routes.welcome);
        }else if(state is Authenticated){
          context.navigateTo(Routes.home);
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AssetsConst.appLogo, width: 30, height: 30),
                const SizedBox(
                  width: 12,
                ),
                Text("Authors Assist",
                    style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
