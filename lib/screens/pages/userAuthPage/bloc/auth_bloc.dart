import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/user.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(LoggingIn()) {
    on<Login>((event, emit) async {
      try {
        emit(LoggingIn());
        User.login(event.user);

        if (User.isLogin == true) {
          emit(LogInSuccess(user: event.user));
        } else {
          emit(LogInFail());
        }
      } catch (error) {
        log("Error", error: error);
        emit(LogInFail());
      }
    });
  }
}
