
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/presentation/authentication/bloc/auth_bloc.dart';

import '../../../../base/base_viewmodel.dart';

class SignUpViewModel extends BaseViewModel {

  final BuildContext context;

  SignUpViewModel(this.context);

  late GlobalKey<FormState> formKey;
  late TextEditingController fnameController;
  late TextEditingController lnameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initialize() {
    formKey = GlobalKey();
    fnameController = TextEditingController();
    lnameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void createAccount(){

    FocusScope.of(context).unfocus();

    if(!formKey.currentState!.validate()){
      return;
    }

    context.read<AuthBloc>().add(
      CreateAccount(
        email: emailController.text, 
        password: passwordController.text, 
        fName: fnameController.text,
        lName: lnameController.text
      )
    );
  }

  @override
  void dispose() {
    fnameController.dispose();
    lnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

}