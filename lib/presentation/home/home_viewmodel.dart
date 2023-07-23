import 'package:flutter/cupertino.dart';
import 'package:mobile/presentation/settings/settings_view.dart';

import '../../base/base_viewmodel.dart';
import '../dashboard/dashboard_view.dart';
import 'cubit/home_cubit.dart';

class HomeViewModel extends BaseViewModel {

  late HomeCubit cubit;
  late PageController pageControllerHome;
  late int currentIndex;
  
  @override
  void initialize() {
    cubit = HomeCubit();
    currentIndex = 0;
    pageControllerHome = PageController(initialPage: 0);
  }

  List<Widget> getPages(BuildContext context) {
    return [
      const DashboardView(),
      const DashboardView(),
      const SettingsView()
    ];
  }

  void onTap(int index) {
    pageControllerHome.jumpToPage(index);
    cubit.onPageChange(index);
  }


  @override
  void dispose() {
    
  }

}