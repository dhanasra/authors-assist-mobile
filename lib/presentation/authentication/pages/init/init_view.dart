import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/constants/assets_const.dart';
import 'package:mobile/extensions/context_exten.dart';
import 'package:mobile/routes/routes.dart';

class InitView extends StatefulWidget {
  const InitView({super.key});

  @override
  State<InitView> createState() => _InitViewState();
}

class _InitViewState extends State<InitView> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), (){
      context.navigateTo(Routes.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Lottie.asset(AssetsConst.working, width: 100),

          Container(
            alignment: Alignment.center,
            child: Text('Initializing...',
                    style: Theme.of(context).textTheme.titleSmall),
          )

        ],
      ),
    );
  }
}