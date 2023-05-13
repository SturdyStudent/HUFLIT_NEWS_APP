import 'package:flutter/material.dart';
import 'package:news_app/config/themes/app_colors.dart';
import 'package:news_app/config/themes/app_text_style.dart';

import 'package:news_app/models/article.dart';
import 'package:news_app/resources/database_helper.dart';
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
    // if (savedNews == true) {
    //   return SafeArea(
    //     child: Column(
    //       children: [
    //
    //         const SavedNewsItem(),
    //         const SavedNewsItem()
    //       ],
    //     ),
    //   );
    // } else {
    //
    // }

    return FutureBuilder<List<Save>?>(
        future: DatabaseHelper.getAllArticle(),
        builder: (context, AsyncSnapshot<List<Save>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Đang hiển thị các tin đã lưu"));
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    'Tin đã lưu',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.h0.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      return ItemList(item: snapshot.data![index]);
                    })),
              ],
            );
          }
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
                      style: AppTextStyle.h2
                          .copyWith(fontWeight: FontWeight.w900)),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 280),
                    child: const Text(
                        "Những tin được lưu sẽ được hiển thị tại đây",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.h3),
                  ),
                  const SizedBox(height: 20),
                  FilledButton.icon(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              AppColors.mainRed),
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
        });
  }
}

class ItemList extends StatefulWidget {
  final Save item;

  const ItemList({super.key, required this.item});

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  void initState() {
    //implement initState
    super.initState();
  }

  Icon loveIcon = const Icon(
    Icons.bookmark_added,
    color: Colors.redAccent,
  );
  Icon unloveIcon = const Icon(
    Icons.bookmark_add_outlined,
    color: Colors.redAccent,
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width * 0.4,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.network(
                widget.item.urlToImage ?? '',
                height: 7,
                width: 11,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.item.title ?? '',
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
                      children: <TextSpan>[
                        TextSpan(text: widget.item.publishedAt.toString()),
                        const TextSpan(text: ' | '),
                        TextSpan(
                          text: widget.item.author,
                          style: const TextStyle(color: AppColors.mainRed),
                        ),
                      ]),
                )
              ],
            ),
          )
        ],
      ),
      Positioned(
          left: width * 0.34,
          top: -13,
          child: FutureBuilder<List<Save>?>(
              future: DatabaseHelper.getAllArticle(),
              builder: (context, AsyncSnapshot<List<Save>?> snapshot) {
                return IconButton(
                    onPressed: () async {
                      await DatabaseHelper.toggleFavorite(widget.item);
                      setState(() {
                        // bookmark error
                        snapshot.data?.contains(widget.item);
                      });
                    },
                    icon: snapshot.data?.contains(widget.item) != null
                        ? Image.asset(
                            'assets/images/icons/bookmark_checked.png')
                        : Image.asset('assets/images/icons/bookmark_plus.png'));
              }))
    ]);
  }
}
