import 'package:flutter/cupertino.dart';
import 'package:news_app_mvvm/models/News.dart';
import 'package:news_app_mvvm/services/news_service.dart';

class NewsViewModel extends ChangeNotifier {
  List<News> searchNews = [];
  List<News> breakingNews = [];

  final NewsService newsService = NewsService();

  void getBreakingNews() async {
    breakingNews = await newsService.getBreakingNews();
    notifyListeners();
  }

  void getSearchNews(String keyword) async{
    searchNews = await newsService.getSearchNews(keyword);

    notifyListeners();
  }
}
