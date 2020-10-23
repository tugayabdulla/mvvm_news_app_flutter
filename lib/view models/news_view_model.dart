import 'package:flutter/cupertino.dart';
import 'package:news_app_mvvm/models/News.dart';
import 'package:news_app_mvvm/services/news_service.dart';
import 'package:news_app_mvvm/utils/date_time.dart';

class NewsViewModel extends ChangeNotifier {
  List<News> _searchNews = [];
  List<News> _breakingNews = [];

  final NewsService _newsService = NewsService();

  List<News> get searchNews => _searchNews;

  List<News> get breakingNews => _breakingNews;
  Future<void> getBreakingNews() async {
    _breakingNews = await _newsService.getBreakingNews();
    notifyListeners();
  }

  Future<void> getSearchNews(
      String keyword, DateTime start, DateTime end) async {
    _searchNews = await _newsService.getSearchNews(
        keyword, formatDateForService(start), formatDateForService(end));
    notifyListeners();
  }

}
