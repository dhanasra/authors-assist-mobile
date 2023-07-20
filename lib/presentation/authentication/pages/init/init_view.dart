import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/constants/assets_const.dart';

class InitView extends StatefulWidget {
  const InitView({super.key});

  @override
  State<InitView> createState() => _InitViewState();
}

class _InitViewState extends State<InitView> {
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