import 'package:flutter/material.dart';
import 'package:news_app/config/themes/app_colors.dart';

class HeaderDrawer extends StatefulWidget {
  const HeaderDrawer({super.key});

  @override
  State<HeaderDrawer> createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      width: double.infinity,
      height: 180,
      padding: const EdgeInsets.only(top: 20.0, left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/profile.jpg"))),
              )),
          const Text("Violet Is Blue",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
          const Text(
            "lisaViolet@gmail.com",
            style: TextStyle(color: Colors.white, fontSize: 14),
          )
        ],
      ),
    );
  }
}
