import 'package:flutter/material.dart';
import 'package:news_app/config/themes/app_colors.dart';
import 'package:news_app/config/themes/app_text_style.dart';

class WelcomeBack extends StatelessWidget {
  const WelcomeBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          color: AppColors.mainRed,
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                ConstrainedBox(
                    constraints: const BoxConstraints(
                        minHeight: 50,
                        minWidth: 70,
                        maxHeight: 140,
                        maxWidth: 250),
                    child: Text("Chào mừng trở lại, Sally!",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.h0.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none))),
                const SizedBox(height: 10),
                ConstrainedBox(
                    constraints: const BoxConstraints(
                        minHeight: 50,
                        minWidth: 70,
                        maxHeight: 175,
                        maxWidth: 250),
                    child: Text(
                        "Rất vui khi thấy bạn quay lại, hãy bắt đầu nào",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.h3.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                            decoration: TextDecoration.none))),
                const SizedBox(height: 30),
                Text("Tap màn hình",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.h5.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        decoration: TextDecoration.none))
              ]))),
    ));
  }
}
