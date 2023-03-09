import 'package:flutter/material.dart';
import 'package:news_app/models/news_item.dart';

class NewsManager extends ChangeNotifier {
  final _newsItem = <NewsItem>[];
  List<NewsItem> get newsItems => List.unmodifiable(_newsItem);

  void deleteItem(int index) {
    _newsItem.removeAt(index);
  }
}
