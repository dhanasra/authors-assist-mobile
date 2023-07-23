import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/global.dart';
import 'package:mobile/network/models/template.dart';
import 'package:mobile/network/models/user.dart';
import 'package:mobile/network/services/common_service.dart';
import 'package:mobile/network/services/user_service.dart';

import '../../../db/local_db.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<InitApp>(_onInitApp);
  }

  void _onInitApp(InitApp event, Emitter emit)async{
    emit(Loading());
    try{

      var accessToken = LocalDB.getAccessToken();

      if(accessToken!=null){

        var response = await Future.wait([
          CommonService().getTemplates(),
          UserService().getUser(),
        ]);
        Global.user = User.fromMap(response[1]);
        Global.templates = (response[0] as List).map((e) => Template.fromMap(e)).toList();
        Global.categories = Global.templates.map((e) => e.category).toSet().toList();

        emit(Authenticated());
      }else{
        emit(UnAuthenticated());
      }
    }catch(err){
      if (kDebugMode) {
        print(err);
      }
    }
  }
}
