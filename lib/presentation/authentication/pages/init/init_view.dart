import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/constants/assets_const.dart';
import 'package:mobile/extensions/context_exten.dart';
import 'package:mobile/routes/routes.dart';

import 'bloc/init_bloc.dart';

class InitView extends StatefulWidget {
  const InitView({super.key});

  @override
  State<InitView> createState() => _InitViewState();
}

class _InitViewState extends State<InitView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitBloc, InitState>(
      listener: (context, state) {
        if(state is Initialized){
          context.navigateTo(Routes.home);
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
