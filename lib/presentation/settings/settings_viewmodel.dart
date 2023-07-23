import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/db/local_db.dart';

import '../../base/base_viewmodel.dart';
import '../common/theme/theme_bloc.dart';

class SettingsViewModel extends BaseViewModel {
  final BuildContext context;

  SettingsViewModel(this.context);

  @override
  void initialize() {
    
  }

  bool getTheme(){
    return LocalDB.getTheme()==null || LocalDB.getTheme() == ThemeVarient.dark.name;
  }

  void changeTheme(bool isDarkTheme){
    context.read<ThemeBloc>().add(ToggleTheme(
      varient: isDarkTheme ? ThemeVarient.dark.name : ThemeVarient.light.name)
    );
  }

  @override
  void dispose() {
    
  }


}