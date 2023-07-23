import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../../db/local_db.dart';
import '../../../../../global.dart';
import '../../../../../network/models/template.dart';
import '../../../../../network/models/user.dart';
import '../../../../../network/services/common_service.dart';
import '../../../../../network/services/user_service.dart';

part 'init_event.dart';
part 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  InitBloc() : super(InitInitial()) {
    on<Initialize>(_onInitialize);
  }

  void _onInitialize(Initialize event, Emitter emit)async{
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

        emit(Initialized());
      }
    }catch(err){
      if (kDebugMode) {
        print(err);
      }
    }
  }
}
