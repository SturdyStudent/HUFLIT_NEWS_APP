class User {
  String userName;
  String email;
  String phoneNumber;
  String password;
  static bool isLogin = false;

  User(this.userName, this.email, this.phoneNumber, this.password);

  static void login(User user) {
    isLogin = true;
  }

  static void logout() {
    isLogin = false;
  }

  bool authState() {
    return isLogin;
  }
}
