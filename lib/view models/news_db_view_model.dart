import 'package:flutter/cupertino.dart';
import 'package:news_app_mvvm/db/app_database.dart';
import 'package:news_app_mvvm/models/News.dart';

class NewsDBViewModel extends ChangeNotifier {
  var _db = AppSqliteDb();
  List<News> _newsList = [];

  Future getSavedNews() async {
    _newsList = await _db.getNews();
    notifyListeners();
  }

  List<News> get newsList => _newsList;

  Future insertNews(News news) async{
    news.setInsertTime();

    await _db.insertNews(news);
    await getSavedNews();

    notifyListeners();
  }

  Future deleteNews(News news) async{
    await _db.deleteNews(news);
    _newsList.remove(news);
    notifyListeners();
  }
}
