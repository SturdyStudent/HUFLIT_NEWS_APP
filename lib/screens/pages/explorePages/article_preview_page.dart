import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:swipe_deck/swipe_deck.dart';

import 'topic_select_page.dart';

class ArticlePreview extends StatelessWidget {
  static const IMAGES = [
    'test_page_1',
    'test_page_2',
    'test_page_3',
    'test_page_4',
    'test_page_1',
    'test_page_2',
    'test_page_3',
    'test_page_4',
    'test_page_1',
    'test_page_2',
  ];
  final borderRadius = BorderRadius.circular(20.0);

  ArticlePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      onPressed: () {
        Navigator.pushNamed(context, '/home');
      },
      allowNext: false,
      title: 'Đây là danh sách những tin được chọn lọc dành cho bạn',
      child: Center(
        child: SizedBox(
          width: 600,
          child: Center(
            child: SwipeDeck(
              startIndex: 3,
              emptyIndicator: Container(
                child: const Center(
                  child: Text("Nothing Here"),
                ),
              ),
              cardSpreadInDegrees: 5, // Change the Spread of Background Cards
              widgets: IMAGES
                  .map((e) => GestureDetector(
                        onTap: () {
                          print(e);
                        },
                        child: ClipRRect(
                            borderRadius: borderRadius,
                            child: Image.asset(
                              "assets/images/icons/$e.jpg",
                              fit: BoxFit.cover,
                            )),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
