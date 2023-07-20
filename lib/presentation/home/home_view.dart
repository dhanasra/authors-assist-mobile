import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/presentation/home/widgets/bottom_bar_container.dart';

import '../../constants/colors_const.dart';
import 'cubit/home_cubit.dart';
import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel _viewModel;

  @override
  void initState() {
    _viewModel = HomeViewModel()..initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      bloc: _viewModel.cubit,
      builder: (context, currentIndex) {
        return Stack(
          children: [
            Scaffold(
              body: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _viewModel.getPages(context).length,
                controller: _viewModel.pageControllerHome,
                itemBuilder: (_, index) => _viewModel.getPages(context)[index],
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: BottomBarContainer(
                  child: BottomNavigationBar(
                      backgroundColor: ColorsConst.white,
                      onTap: (index) => _viewModel.onTap(index),
                      selectedIconTheme: const IconThemeData(
                        color: ColorsConst.primary,
                        size: 24
                      ),
                      unselectedIconTheme: const IconThemeData(
                        color: ColorsConst.primaryLight,
                        size: 24
                      ),
                      selectedLabelStyle: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorsConst.black
                      ),
                      unselectedLabelStyle: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorsConst.text1
                      ),
                      currentIndex: currentIndex,
                      items: const [
                        BottomNavigationBarItem(
                          icon: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(Icons.dashboard),
                          ),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                            icon: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(Icons.insert_drive_file),
                            ),
                            label: 'Articles'),
                        BottomNavigationBarItem(
                            icon: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(Icons.settings),
                            ),
                            label: 'Settings')
                      ]),
                ),
            )
          ],
        );
      },
    );
  }
}
