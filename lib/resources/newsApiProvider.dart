import 'dart:convert';

import 'package:http/http.dart';

import '../constants/constants.dart';
import '../models/article.dart';
import '../models/news_response_model.dart';

class NewsApiProvider {
  Client client = Client();
  final _apiKey = Constants.api_key;

  Future<List<Article>?> fetchNewsList({String category = ''}) async {
    var url =
        "https://newsapi.org/v2/top-headlines?q=apple&from=2023-05-06&to=2023-05-06&sortBy=popularity&apiKey=b5f249db1f8547168a283f8a1108f927";
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return NewsApiResonse.fromRawJson(response.body).articles;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
