import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/config/themes/app_colors.dart';
import 'package:news_app/config/themes/app_text_style.dart';

class SavedNewsItem extends StatelessWidget {
  const SavedNewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Stack(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width * 0.4,
              child: const FittedBox(
                fit: BoxFit.cover,
                child: Image(
                  image: AssetImage("assets/images/icons/test_page_3.jpg"),
                  height: 7,
                  width: 11,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: width * 0.5,
              padding: EdgeInsets.all(8),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Bạo lực trong giải Super Bowl giữa 2 đội bắc mỹ',
                      style: AppTextStyle.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          style: AppTextStyle.h4.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                          children: const <TextSpan>[
                            TextSpan(text: "3h "),
                            TextSpan(text: ' | '),
                            TextSpan(
                              text: "Asia",
                              style: TextStyle(color: AppColors.mainRed),
                            ),
                          ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Positioned(
            left: width * 0.35,
            top: 0,
            child: SizedBox(
                height: height / 15,
                width: width / 9,
                child: const Image(
                    fit: BoxFit.fill,
                    image:
                        AssetImage('assets/images/icons/bookmark_plus.png'))))
      ]),
    );
  }
}
