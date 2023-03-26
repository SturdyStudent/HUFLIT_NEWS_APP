import 'package:flutter/material.dart';
import 'package:news_app/config/themes/app_colors.dart';
import 'package:news_app/config/themes/app_text_style.dart';
import 'package:news_app/widgets/saved_news/saved_news_item.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() {
    return SavedPageState();
  }
}

class SavedPageState extends State<SavedPage> {
  bool savedNews = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (savedNews == true) {
      return SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: Text(
                'Tin đã lưu',
                textAlign: TextAlign.center,
                style: AppTextStyle.h0
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            const SavedNewsItem(),
            const SavedNewsItem()
          ],
        ),
      );
    } else {
      return Center(
        child: Wrap(children: <Widget>[
          Column(
            children: [
              const Image(
                image: AssetImage('assets/images/icons/bookmark_plus.png'),
                width: 70,
                height: 90,
                fit: BoxFit.cover,
                alignment: FractionalOffset.center,
              ),
              Text("Chưa tin nào được lưu",
                  style: AppTextStyle.h2.copyWith(fontWeight: FontWeight.w900)),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 280),
                child: const Text("Những tin được lưu sẽ được hiển thị tại đây",
                    textAlign: TextAlign.center, style: AppTextStyle.h3),
              ),
              const SizedBox(height: 20),
              FilledButton.icon(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(AppColors.mainRed),
                      padding: MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.all(20.0))),
                  onPressed: () {
                    setState(() {
                      savedNews = true;
                    });
                  },
                  icon: const ImageIcon(
                    AssetImage('assets/images/icons/feed.png'),
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Quay về trang tin tức",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ]),
      );
    }
  }
}
