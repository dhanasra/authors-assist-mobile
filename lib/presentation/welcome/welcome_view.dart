import 'package:flutter/material.dart';
import 'package:mobile/presentation/welcome/welcome_viewmodel.dart';

import '../../constants/colors_const.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  late WelcomeViewModel _viewModel;

  @override
  void initState() {
    _viewModel = WelcomeViewModel(context)..initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _viewModel.builder,
      builder: (_, val, __) {
        return Scaffold(
          appBar: AppBar(
            actions:  [
              Center(
                child: Text('${val+1}/3', style: Theme.of(context).textTheme.bodyMedium),
              ),
              const SizedBox(width: 16,)
            ],
          ),
          
          body: Column(
            children: [

              Expanded(
                child: PageView.builder(
                  itemCount: _viewModel.pageContent.length,
                  controller: _viewModel.controller,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index){

                    var item = _viewModel.pageContent[index];

                    return Column(
                      children: [
                        
                        Expanded(
                          child: Image.asset(item['image'])),

                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 300),
                          child: Text(item['title'], 
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium,
                        )),

                        const SizedBox(height: 12),

                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 320),
                          child: Text(item['content'], 
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall,
                          ),
                        )
                      ],
                    );
                  }),
              ),

              Container(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: val == index ? Theme.of(context).primaryColor : ColorsConst.greyLight,
                    ),
                  ))
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    TextButton(
                      onPressed: (){}, 
                      child: const Text('Skip')
                    ),

                    ElevatedButton(
                      onPressed: (){
                        _viewModel.moveNext();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(val==2 ? 'Start' : 'Next'),
                          const SizedBox(width: 16,),
                          const Icon(Icons.arrow_forward, color: Colors.white,)
                        ],
                      )
                    ),
                  ],
                ),
              )

            ],
          ),
        );
      }
    );
  }
}