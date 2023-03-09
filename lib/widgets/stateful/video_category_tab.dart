import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/config/themes/app_colors.dart';
import 'package:news_app/config/themes/app_text_style.dart';

class VideoCategoryTab extends StatelessWidget {
  const VideoCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        ButtonTheme(
            child: Stack(children: [
          Container(
            height: 100,
            width: 100,
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.primaryColor),
            child: const FittedBox(
              fit: BoxFit.cover,
              child: ImageIcon(
                AssetImage("images/icons/vietnam.png"),
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: 90,
            height: 90,
            margin: const EdgeInsets.all(5.0),
            decoration: const BoxDecoration(
                border: Border.fromBorderSide(
                    BorderSide(color: Colors.black, width: 1.5)),
                color: Colors.transparent,
                shape: BoxShape.circle),
          ),
        ])),
        const SizedBox(height: 10.0),
        Text('Việt Nam', style: AppTextStyle.h4.copyWith(color: Colors.white))
      ],
    );
  }
}
