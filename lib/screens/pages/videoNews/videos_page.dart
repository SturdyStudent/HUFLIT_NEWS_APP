import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/config/themes/app_colors.dart';
import 'package:news_app/config/themes/app_text_style.dart';
import 'package:news_app/widgets/stateful/video_category_tab.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(child: _body(context)));
  }
}

Widget _body(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const VideoCategoryTab(),
          ],
        ),
        const SizedBox(
          height: 30.0,
        ),
        SizedBox(
          width: double.infinity,
          child: Text('Video nóng trong ngày',
              textAlign: TextAlign.left,
              style: AppTextStyle.h0
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        )
      ],
    ),
  );
}
