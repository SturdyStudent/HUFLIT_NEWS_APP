// ignore_for_file: unnecessary_import, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:news_app/models/article.dart';
import 'package:news_app/resources/database_helper.dart';

class BookmarkNews extends StatefulWidget {
  final Article article;

  const BookmarkNews({super.key, required this.article});

  @override
  _BookmarkNewsState createState() => _BookmarkNewsState();
}

class _BookmarkNewsState extends State<BookmarkNews> {
  @override
  void initState() {
    //implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final author = widget.article.author;
    final title = widget.article.title;
    final description = widget.article.description;
    final url = widget.article.url;
    final urlToImage = widget.article.urlToImage;
    final publishedAt = widget.article.publishedAt;
    final content = widget.article.content;

    final Save model = Save(
        author: author,
        title: title,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content);

    Icon loveIcon = const Icon(
      Icons.bookmark_added,
      color: Colors.redAccent,
    );
    Icon unloveIcon = const Icon(
      Icons.bookmark_add_outlined,
      color: Colors.redAccent,
    );

    return FutureBuilder<List<Save>?>(
        future: DatabaseHelper.getAllArticle(),
        builder: (context, AsyncSnapshot<List<Save>?> snapshot) {
          return IconButton(
              onPressed: () async {
                await DatabaseHelper.toggleFavorite(model);
                // await DatabaseHelper.addArticle(model);
                // await DatabaseHelper.deleteArticle(model);
                // await DatabaseHelper.cleanDatabase();
                print('oh ${snapshot.data?.length}');
                setState(() {
                  // bookmark error
                  snapshot.data?.contains(model);
                });
              },
              icon: snapshot.data?.contains(model) == null
                  ? Image.asset('assets/images/icons/bookmark_plus.png')
                  : Image.asset('assets/images/icons/bookmark_checked.png'));
        });
  }
}
