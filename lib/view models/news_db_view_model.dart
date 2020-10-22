import 'package:flutter/cupertino.dart';
import 'package:news_app_mvvm/db/app_database.dart';
import 'package:news_app_mvvm/models/News.dart';

class NewsDBViewModel extends ChangeNotifier {
  var db = AppSqliteDb();
  List<News> newsList = [];

  Future getSavedNews() async {
    newsList = await db.getNews();
    notifyListeners();
  }

  Future insertNews(News news) async{
    news.setInsertTime();

    await db.insertNews(news);
    await getSavedNews();

    notifyListeners();
  }

  Future deleteNews(News news) async{
    await db.deleteNews(news);
    newsList.remove(news);
    notifyListeners();
  }
}
