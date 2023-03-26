import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/config/themes/app_colors.dart';
import 'package:news_app/config/themes/app_text_style.dart';

class VideoCategoryTab extends StatelessWidget {
  final String title;
  final String assetImage;
  const VideoCategoryTab(
      {super.key, required this.title, required this.assetImage});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          ButtonTheme(
              child: Stack(children: [
            Container(
              height: width / 4.5,
              width: width / 4.5,
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: AppColors.primaryColor),
              child: FittedBox(
                fit: BoxFit.cover,
                child: ImageIcon(
                  AssetImage(assetImage),
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: (width / 4.5) - 10,
              height: (width / 4.5) - 10,
              margin: const EdgeInsets.all(5.0),
              decoration: const BoxDecoration(
                  border: Border.fromBorderSide(
                      BorderSide(color: Colors.black, width: 1.5)),
                  color: Colors.transparent,
                  shape: BoxShape.circle),
            ),
          ])),
          const SizedBox(height: 10.0),
          Text(title, style: AppTextStyle.h4.copyWith(color: Colors.white))
        ],
      ),
    );
  }
}
