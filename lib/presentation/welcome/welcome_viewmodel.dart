import "package:flutter/material.dart";

import "../../base/base_viewmodel.dart";
import "../../constants/assets_const.dart";

class WelcomeViewModel extends BaseViewModel {
  final BuildContext context;

  WelcomeViewModel(this.context);
  
  late PageController controller;

  late List pageContent;
  late ValueNotifier<int> builder;
  int _currentPage = 0;


  @override
  void initialize() {
    controller = PageController();
    
    pageContent = [
      {
        "image": AssetsConst.welcomeImage1,
        "title": "Unleash AI Power for Next-Level Writing",
        "content": "Discover AI-powered app to overcome writer's block and fuel endless inspiration!",
      },
      {
        "image": AssetsConst.welcomeImage2,
        "title": "Transform Writing with AI Content App",
        "content": "Experience the perfect blend of human creativity and AI technology in our content app",
      },
      {
        "image": AssetsConst.welcomeImage3,
        "title": "Boost Your Creativity, Revolutionize with AI",
        "content": "Enhance your writing efficiency with smart suggestions using AI technology.",
      },
    ];
    
    builder = ValueNotifier(_currentPage);

  }

  void moveNext(){
    if(_currentPage<2){
      _currentPage++;
      controller.animateToPage(_currentPage, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      builder.value = _currentPage;
    }else{
      // context.navigateTo(Routes.signup);
    }
  }

  @override
  void dispose() {
    builder.dispose();
    controller.dispose();
  }
}
