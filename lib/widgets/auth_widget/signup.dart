import 'package:flutter/material.dart';
import 'package:news_app/config/themes/app_text_style.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpState();

  static Future openSignupForm(BuildContext context) {
    return showDialog(
        barrierColor: Colors.white.withOpacity(0),
        context: context,
        builder: (context) => AlertDialog(
              content: const SignUpPage(),
              alignment: Alignment.center,
              actions: [],
            ));
  }
}

class _SignUpState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: height * 0.6),
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
            const TextField(
              decoration: InputDecoration(hintText: 'Email'),
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Mật khẩu'),
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Số điện thoại'),
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

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFBB0712)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
            )
          ],
        ),
      ),
    );
  }
}
