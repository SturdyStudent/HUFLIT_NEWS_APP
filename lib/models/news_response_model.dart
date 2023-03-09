import 'dart:convert';

import 'article.dart';

class NewsApiResonse {
  String? status;
  int? totalResults;
  List<Article>? articles;

  NewsApiResonse({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory NewsApiResonse.fromRawJson(String str) =>
      NewsApiResonse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsApiResonse.fromJson(Map<String, dynamic> json) => NewsApiResonse(
        status: "ok", //trả về object với status, totalResult, articles
        totalResults: json["totalResults"],
        articles: json["articles"] == null
            ? null
            : List<Article>.from(
                json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}
