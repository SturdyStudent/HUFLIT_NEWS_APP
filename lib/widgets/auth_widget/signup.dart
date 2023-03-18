import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
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
            const Text(
              'Mật khẩu cần phải chứa...',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF040404), // Fix color code
              ),
            ),
            const SizedBox(height: 20), // Add some vertical space

            const Text(
              'Ít nhất 1 chữ cái',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF040404), // Fix color code
              ),
            ),
            const SizedBox(height: 10), // Add some vertical space
            const Text(
              'Ít nhất 1 chữ cái hay 1 kí tự',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF040404), // Fix color code
              ),
            ),
            const SizedBox(height: 10), // Add some vertical space

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                  onPressed: () {
                    // Function to execute when button is pressed
                  },
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
