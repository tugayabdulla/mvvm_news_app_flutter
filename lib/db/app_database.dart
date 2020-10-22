import 'package:news_app_mvvm/models/News.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const dbVersion = 1;

class AppSqliteDb {
  static String sqliteDbName = 'news.db';

  Future<Database> getDb() async => openDatabase(
        join(await getDatabasesPath(), sqliteDbName),
        version: dbVersion,
        onCreate: (Database db, int version) async {
          db.execute('''CREATE TABLE IF NOT EXISTS ${News.TABLE_NAME} (
          insert_time ,
         author TEXT,
         title TEXT,
         description TEXT,
         url TEXT  PRIMARY KEY,
         urlToImage TEXT,
         publishedAt TEXT,            
         content TEXT)
      ''');
        },
      );

  Future insertNews(News news) async {
    final Database db = await getDb();
    await db.insert(News.TABLE_NAME, news.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<List<News>> getNews() async {
    final Database db = await getDb();
    final List<Map<String, dynamic>> map = await db.query(News.TABLE_NAME,orderBy: 'insert_time ASC');
    return List.generate(map.length, (i) => News.newsFromJson(map[i]));
  }

  Future deleteNews(News news) async {
    final Database db = await getDb();
    db.delete(News.TABLE_NAME, where: 'url = ?', whereArgs: [news.url]);
  }
}
