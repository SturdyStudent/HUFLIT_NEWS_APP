import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBB0712),
        title: const Text('Change password'),
        elevation: 0,
        leading: IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 20),
        child: Column(
          children: [
            // Wrap the Text widget with a Center widget

            const Center(
              child: Text(
                'Đổi mật khẩu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFBB0712),
                ),
              ),
            ),
            const SizedBox(height: 10), // Add some vertical space

            const TextField(
              decoration: InputDecoration(hintText: 'Mật khẩu mới'),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                  onPressed: () {
                    // Function to execute when button is pressed
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFBB0712)),
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
                          'Lưu ',
                          style: TextStyle(fontSize: 18),
                        ),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
