import 'package:news_app/screens/pages/userAuthPage/bloc/auth.dart';

class UserObj {
  String userName;
  String email;
  String phoneNumber;
  String password;
  static bool isLogin = false;
  static bool isRegister = false;

  UserObj(this.userName, this.email, this.phoneNumber, this.password);

  static void login(UserObj user) {
    Auth().login(user).then((value) {
      isLogin = true;
    }).catchError((err) {
      isLogin = false;
    });
  }

  static void register(UserObj user) {
    Auth().register(user);
  }

  static void logout() {
    isLogin = false;
  }

  bool authState() {
    return isLogin;
  }
}
