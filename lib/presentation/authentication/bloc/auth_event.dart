part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class CreateAccount extends AuthEvent {
  final String email;
  final String password;
  final String fName;
  final String lName;

  CreateAccount({
    required this.email,
    required this.password,
    required this.fName,
    required this.lName
  });
}

class Login extends AuthEvent {
  final String email;
  final String password;

  Login({
    required this.email,
    required this.password
  });
}

class SignInWithGoogle extends AuthEvent {}

class SignInWithFacebook extends AuthEvent {}

class SignInWithGithub extends AuthEvent {}