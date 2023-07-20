import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/extensions/context_exten.dart';
import 'package:mobile/presentation/authentication/bloc/auth_bloc.dart';
import 'package:mobile/presentation/authentication/pages/signup/signup_viewmodel.dart';

import '../../../../constants/assets_const.dart';
import '../../../../constants/colors_const.dart';
import '../../../../routes/routes.dart';
import '../../../../widgets/text_input.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  late SignUpViewModel _viewModel;

  @override
  void initState() {
    _viewModel = SignUpViewModel(context)..initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is SignupSuccess || state is AuthSuccess){
          context.navigateTo(Routes.init);
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _viewModel.formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              Text('Create an account',
                  style: Theme.of(context).textTheme.headlineMedium),
              Row(
                children: [
                  Text('Already have an account ?',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 15, color: ColorsConst.text)),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: ()=>context.navigateTo(Routes.signin),
                    child: Text('Login',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 15, color: ColorsConst.primary)),
                  )
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: ()=>context.read<AuthBloc>().add(SignInWithGoogle()),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 32),
                      decoration: BoxDecoration(
                          border: const Border.fromBorderSide(
                            BorderSide(color: ColorsConst.greyLight, width: 2),
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Image.asset(
                        AssetsConst.google,
                        width: 26,
                        height: 26,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: ()=>context.read<AuthBloc>().add(SignInWithFacebook()),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 32),
                      decoration: BoxDecoration(
                          color: ColorsConst.facebookBlue,
                          border: const Border.fromBorderSide(
                            BorderSide(color: ColorsConst.greyLight, width: 2),
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Image.asset(
                        AssetsConst.facebook,
                        width: 26,
                        height: 26,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: ()=>context.read<AuthBloc>().add(SignInWithGithub()),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 32),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: const Border.fromBorderSide(
                            BorderSide(color: ColorsConst.greyLight, width: 2),
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Image.asset(
                        AssetsConst.github,
                        width: 26,
                        height: 26,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Or',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 13),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextInput(
                    controller: _viewModel.fnameController,
                    hintext: 'First Name',        
                    validatorField: 'First name',
                    capitalize: true,
                  )),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextInput(
                    controller: _viewModel.lnameController,
                    hintext: 'Last Name',
                    validatorField: 'Last name',
                    capitalize: true,
                  ))
                ],
              ),
              const SizedBox(height: 16),
              TextInput(
                controller: _viewModel.emailController,
                hintext: 'Email',
                validatorField: 'Email',
                validateEmail: true,
              ),
              const SizedBox(height: 16),
              TextInput(
                controller: _viewModel.passwordController,
                hintext: 'Password',
                validatorField: 'Password',
                validatePassword: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: ()=>_viewModel.createAccount(), 
                  child: const Text('Create Account')),
              const SizedBox(height: 20),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'By continuing, you agree AI Content Writers',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 14, color: ColorsConst.text)),
                      TextSpan(
                          text: '  Terms of Service  ',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: 14, color: ColorsConst.primary)),
                      TextSpan(
                          text: 'and',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 14, color: ColorsConst.text)),
                      TextSpan(
                          text: '  Privacy Policy  ',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: 14, color: ColorsConst.primary))
                    ]),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}