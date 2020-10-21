import 'package:flutter/cupertino.dart';
import 'package:news_app_mvvm/db/app_database.dart';
import 'package:news_app_mvvm/models/News.dart';

class NewsDBViewModel extends ChangeNotifier {
  var db = AppSqliteDb();
  List<News> newsList = [];

  void getSavedNews() async {
    newsList = await db.getNews();
    notifyListeners();
  }

  Future insertNews(News news) async{
    await db.insertNews(news);
    getSavedNews();
    notifyListeners();
  }

  Future deleteNews(News news) async{
    await db.deleteNews(news);
    getSavedNews();
    notifyListeners();
  }
}
