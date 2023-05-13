import 'package:news_app/models/article.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "SaveArticles.db";

  static Future<Database> _getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async => await db.execute(
          "CREATE TABLE SaveArticles(author TEXT, title TEXT PRIMARY KEY, description TEXT, url TEXT, urlToImage TEXT, publishedAt DATE, content TEXT);"),
      version: _version,
    );
  }

  static Future<int> addArticle(Save save) async {
    final db = await _getDB();
    return await db.insert("SaveArticles", save.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteArticle(Save save) async {
    final db = await _getDB();
    return await db
        .delete("SaveArticles", where: "title = ?", whereArgs: [save.title]);
  }

  static Future<List<Save>?> getAllArticle() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("SaveArticles");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Save.fromJson(maps[index]));
  }

  static Future<void> toggleFavorite(Save save) async {
    final db = await _getDB();
    final check = await db
        .query("SaveArticles", where: "title = ?", whereArgs: [save.title]);

    if (check.isNotEmpty) {
      DatabaseHelper.deleteArticle(save);
    } else {
      DatabaseHelper.addArticle(save);
    }
  }

  static Future<void> cleanDatabase() async {
    try {
      final db = await _getDB();
      await db.transaction((txn) async {
        var batch = txn.batch();
        // batch.delete("source");
        batch.delete("author");
        batch.delete("title");
        batch.delete("description");
        batch.delete("url");
        batch.delete("urlToImage");
        batch.delete("publishedAt");
        batch.delete("content");
        await batch.commit();
      });
    } catch (error) {
      throw Exception('DbBase.cleanDatabase: $error');
    }
  }
}
