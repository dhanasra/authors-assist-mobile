import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/base/base_viewmodel.dart';
import 'package:mobile/presentation/authentication/bloc/auth_bloc.dart';

class SignInViewModel extends BaseViewModel {

  final BuildContext context;

  SignInViewModel(this.context);

  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initialize() {
    formKey = GlobalKey();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void login(){

    FocusScope.of(context).unfocus();

    if(!formKey.currentState!.validate()){
      return;
    }

    context.read<AuthBloc>().add(
      Login(
        email: emailController.text, 
        password: passwordController.text
      )
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

}