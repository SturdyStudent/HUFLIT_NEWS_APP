import 'package:equatable/equatable.dart';
import 'package:news_app/models/user.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class Login extends AuthEvent {
  final UserObj user;

  const Login({required this.user});

  @override
  String toString() => 'Login for user ${user.userName} ';
}

class LogoutUser extends AuthEvent {
  const LogoutUser();
}

class SignUp extends AuthEvent {
  final UserObj user;

  const SignUp({required this.user});

  @override
  String toString() => 'Register for user ${user.userName} ';
}
