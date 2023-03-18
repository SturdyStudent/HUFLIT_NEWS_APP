import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/themes/app_text_style.dart';
import 'package:news_app/models/user.dart';
import 'package:news_app/screens/pages/userAuthPage/bloc/auth_bloc.dart';

import '../../screens/pages/userAuthPage/bloc/auth_event.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();

  static Future openLoginForm(BuildContext context) {
    User tempUser = User('Jojo', '', '', '');
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const LoginPage(),
              alignment: Alignment.center,
              actions: [
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(Login(user: tempUser));
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, '/explore/welcome',
                              arguments: tempUser.userName);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFBB0712)),
                          alignment: Alignment.center,
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        child: const SizedBox(
                            width: 165,
                            height: 44,
                            child: Center(
                              child: Text(
                                'Đăng nhập',
                                style: TextStyle(fontSize: 18),
                              ),
                            ))),
                  ),
                ),
                const SizedBox(height: 20), // Add some vertical space
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Chưa có tài khoản?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 19,
                      color: Color(0xFF040404), // Fix color code
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Add some vertical space
                Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      // Action to perform when button is pressed
                    },
                    child: Text(
                      'Đăng ký ngay',
                      style: AppTextStyle.h4.copyWith(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue // Fix color code
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ));
  }
}

class _LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: const [
            // Wrap the Text widget with a Center widget
            Center(
              child: Text(
                'Đăng nhập',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFBB0712),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Mật khẩu'),
            ),
          ],
        ),
      ),
    ]);
  }
}
