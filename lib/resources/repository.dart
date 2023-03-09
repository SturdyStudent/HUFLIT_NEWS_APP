import '../models/article.dart';
import 'newsApiProvider.dart';

class Repository {
  final newsApiProvider = NewsApiProvider();
  Future<List<Article>?> fetchAllNews({String category = ''}) =>
      newsApiProvider.fetchNewsList(category: category);
}
