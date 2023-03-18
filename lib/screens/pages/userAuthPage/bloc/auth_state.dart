import 'package:equatable/equatable.dart';
import 'package:news_app/models/user.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class LoggingIn extends AuthState {} //định nghĩa state Loading, loaded,

class LogInSuccess extends AuthState {
  final User user;

  const LogInSuccess({required this.user});

  @override
  String toString() => 'Login user { items: ${user.userName} }';
}

class LogInFail extends AuthState {}
