import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/constants/assets_const.dart';
import 'package:mobile/constants/colors_const.dart';
import 'package:mobile/extensions/context_exten.dart';
import 'package:mobile/routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), (){
      context.navigateTo(Routes.welcome);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetsConst.appLogo, width: 30, height: 30),

              const SizedBox(width: 12,),

              Text("Authors Assist", style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ColorsConst.primary
              ))
            ],
          ),

          

        ],
      ),
    );
  }
}