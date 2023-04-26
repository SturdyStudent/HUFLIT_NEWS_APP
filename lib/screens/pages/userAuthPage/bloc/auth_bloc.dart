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
        UserObj.login(event.user);

        if (UserObj.isLogin == true) {
          emit(LogInSuccess(user: event.user));
        } else {
          emit(LogInFail());
        }
      } catch (error) {
        log("Error", error: error);
        emit(LogInFail());
      }
    });

    on<LogoutUser>(((event, emit) {
      try {
        UserObj.logout();
        if (UserObj.isLogin == false) {
          emit(LogOut());
        }
      } catch (err) {
        log("Error", error: err);
      }
    }));

    on<SignUp>(
      (event, emit) {
        try {
          emit(RegisteringIn());
          UserObj.register(event.user);
          if (UserObj.isRegister) {
            emit(RegisterSuccess());
          } else {
            emit(RegisterFail());
          }
        } catch (err) {
          log("Error", error: err);
        }
      },
    );
  }
}
