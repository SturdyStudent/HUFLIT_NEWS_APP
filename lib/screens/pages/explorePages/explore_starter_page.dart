import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_app/config/themes/app_colors.dart';
import 'package:news_app/config/themes/app_text_style.dart';
import 'package:news_app/widgets/auth_widget/login.dart';

class ExploreStarter extends StatelessWidget {
  const ExploreStarter({super.key, required BuildContext context});

  @override
  Widget build(context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.blackColor,
      padding: const EdgeInsets.only(top: 50, bottom: 50, left: 40, right: 40),
      child: Wrap(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Column(
            children: [
              Text(
                'Xin chào! Bạn có đang tìm kiếm điều gì không?',
                textAlign: TextAlign.center,
                style: AppTextStyle.h0.copyWith(
                    color: AppColors.mainRed, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: AppTextStyle.h4.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                    children: <TextSpan>[
                      const TextSpan(text: "Đăng nhập hoặc "),
                      TextSpan(
                          text: "Đăng kí",
                          style: TextStyle(
                              color: Colors.blue[700],
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue[700]),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // ignore: avoid_print
                              print('đã đăng kí');
                            }),
                      const TextSpan(
                          text:
                              " để tiếp cận những thông tin được chọn lọc cẩn thận dựa trên thời gian và xu hướng của bạn")
                    ]),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(AppColors.mainRed)),
                  onPressed: () {
                    LoginPage.openLoginForm(context);
                  },
                  child: Text('Đăng nhập ngay!',
                      style: AppTextStyle.h3
                          .copyWith(color: AppColors.normalWhite))),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ]),
    );
  }
}
