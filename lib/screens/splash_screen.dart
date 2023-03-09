import 'package:flutter/material.dart';
import 'package:news_app/config/themes/app_colors.dart';
import 'package:news_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainRed,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 180,
                    width: 200,
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.roundedColor,
                    )),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 80,
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      child: const FittedBox(
                        fit: BoxFit.cover,
                        child: ImageIcon(
                          AssetImage("assets/images/icons/app_logo_white.png"),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    ConstrainedBox(
                        constraints: const BoxConstraints(
                            minHeight: 50,
                            minWidth: 70,
                            maxHeight: 75,
                            maxWidth: 150),
                        child: const Text("NEWS",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w100,
                                decoration: TextDecoration.none))),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 0), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }
}
