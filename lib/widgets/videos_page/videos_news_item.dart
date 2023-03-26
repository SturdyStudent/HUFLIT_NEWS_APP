import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/config/themes/app_colors.dart';
import 'package:news_app/config/themes/app_text_style.dart';

class VideoNewsItem extends StatefulWidget {
  const VideoNewsItem({super.key});

  @override
  State<VideoNewsItem> createState() => _VideoNewsItemState();
}

class _VideoNewsItemState extends State<VideoNewsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Stack(children: [
        const ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Image(
              image: AssetImage('assets/images/icons/test_page_1.jpg'),
              fit: BoxFit.cover,
              height: 220,
              width: double.infinity,
            )),
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 150,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [AppColors.mainRed, Colors.transparent],
                )),
          ),
        ),
        Positioned(
            left: 10,
            right: 0,
            height: 220,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/images/icons/play.png'),
                    fit: BoxFit.fill,
                    height: 60,
                    width: 60,
                    color: Colors.white,
                  ),
                  Text(
                    '2:35',
                    style: AppTextStyle.h5.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 40,
                    child: Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30)
                ],
              ),
            )),
        Positioned(
            bottom: 0,
            left: 10,
            width: 300,
            height: 80,
            child: Text(
              'Tiêu chuẩn kép trong biểu tình tại Mỹ',
              textAlign: TextAlign.left,
              style: AppTextStyle.h3.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.clip),
            )),
        const Positioned(
            right: 0,
            top: 0,
            child: SizedBox(
                height: 55,
                width: 50,
                child: Image(
                    fit: BoxFit.fill,
                    image:
                        AssetImage('assets/images/icons/bookmark_plus.png'))))
      ]),
    );
  }
}
