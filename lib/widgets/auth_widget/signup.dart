import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/themes/app_text_style.dart';
import 'package:news_app/screens/pages/userAuthPage/bloc/auth_event.dart';

import '../../models/user.dart';
import '../../screens/pages/userAuthPage/bloc/auth_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpState();

  static Future openSignupForm(BuildContext context) {
    UserObj tempUser = UserObj('', '', '', '');

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const SignUpPage(),
              alignment: Alignment.center,
              actions: [
                Container(
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(SignUp(user: tempUser));
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text('Thông tin hợp lệ!'),
                                    content: const Text(
                                        'Bạn đã đăng ký tài khoản thành công.'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Đóng'),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      )
                                    ],
                                  ));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFBB0712)),
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
                                'Đăng ký',
                                style: TextStyle(fontSize: 18),
                              ),
                            ))),
                  ),
                ),
              ],
            ));
  }
}

class _SignUpState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _phoneNumberController =
        TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: height * 0.5),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Đăng ký tài khoản',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFBB0712),
                ),
              ),
            ),
            const Center(
              child: Text(
                'FNN News',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFBB0712),
                ),
              ),
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(hintText: 'Tên đăng nhập'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(hintText: 'Mật khẩu'),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(hintText: 'Số điện thoại'),
            ),

            const SizedBox(height: 20), // Add some vertical space
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Mật khẩu cần phải chứa...',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF040404), // Fix color code
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                '8 kí tự trở lên',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF040404), // Fix color code
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Ít nhất 1 chữ cái',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF040404), // Fix color code
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Ít nhất 1 chữ cái hay 1 kí tự',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF040404), // Fix color code
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
