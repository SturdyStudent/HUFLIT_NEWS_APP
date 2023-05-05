import 'package:equatable/equatable.dart';
import 'package:news_app/models/user.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class Login extends AuthEvent {
  final User user;

  const Login({required this.user});

  @override
  String toString() => 'Login for user ${user.userName} ';
}
