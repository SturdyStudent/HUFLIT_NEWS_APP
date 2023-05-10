import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/themes/app_text_style.dart';
import 'package:news_app/models/article.dart';

import 'bloc/bloc.dart';
import 'topic_select_page.dart';

class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  int initialIndex = 0;
  int imageIndex = 0;
  int textIndex = 0;
  List<String> listImages = [
    'assets/images/icons/clock_border_15_min.png',
    'assets/images/icons/clock_border_30_min.png',
    'assets/images/icons/clock_border_45_min.png',
    'assets/images/icons/clock_border_60_min.png'
  ];
  List<String> listText = ['15 phút', '30 phút', '45 phút', '60 phút'];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      onPressed: () {
        BlocProvider.of<ExploreBloc>(context)
            .add(const NavigatePreviewArticle());
      },
      allowNext: true,
      title: 'Bạn có thể dành ra bao nhiêu thời gian để đọc?',
      child: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (initialIndex < 3) {
                    initialIndex++;
                    imageIndex = textIndex = initialIndex;
                  } else {
                    initialIndex = 0;
                    imageIndex = textIndex = initialIndex;
                  }
                });
              },
              child: Stack(children: [
                Center(
                  child: SizedBox(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image(
                        image: AssetImage(listImages[imageIndex]),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 250,
                    height: 250,
                    child: Center(
                      child: Text(listText[textIndex],
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h2.copyWith(color: Colors.white)),
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
