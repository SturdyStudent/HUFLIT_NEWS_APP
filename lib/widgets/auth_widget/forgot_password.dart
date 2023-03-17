import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 20),
        child: Column(
          children: [
            // Wrap the Text widget with a Center widget

            const Center(
              child: Text(
                'RESET PASSWORD',
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
              decoration: InputDecoration(hintText: 'Your email'),
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
                          'Reset ',
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
