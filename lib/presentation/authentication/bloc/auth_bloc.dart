import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile/network/services/auth_service.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<CreateAccount>(_onCreateAccount);
    on<Login>(_onLogin);
  }

  void _onCreateAccount(CreateAccount event, Emitter emit)async{
    emit(Loading());
    try{
      await AuthService().signupUser(event.email, event.password, event.fName, event.lName);
      emit(SignupSuccess());
    }catch(e){
      emit(Failure(message: e.toString()));
    }
  }

  void _onLogin(Login event, Emitter emit)async{
    emit(Loading());
    try{
      await AuthService().loginUser(event.email, event.password);
      emit(LoginSucess());
    }catch(e){
      emit(Failure(message: e.toString()));
    }
  }
}
