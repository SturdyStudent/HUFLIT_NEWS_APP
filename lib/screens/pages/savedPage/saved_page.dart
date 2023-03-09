import 'package:flutter/material.dart';
import 'package:news_app/config/themes/app_colors.dart';
import 'package:news_app/config/themes/app_text_style.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(children: <Widget>[
        Column(
          children: [
            const Image(
              image: AssetImage('images/icons/bookmark_plus.png'),
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
                  Navigator.pushNamed(context, '/home');
                },
                icon: const ImageIcon(
                  AssetImage('images/icons/feed.png'),
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
