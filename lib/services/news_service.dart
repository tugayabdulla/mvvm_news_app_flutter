import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app_mvvm/models/News.dart';

const API_KEY = "8a21d3f212ee43f8a400d89642ad37f1";

class NewsService {
  Future<List<News>> getBreakingNews() async {
    List<News> newsList = [];
    Response response = await get(
        "http://newsapi.org/v2/top-headlines?language=en&apiKey=$API_KEY");
    print(response.statusCode);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      for (dynamic article in body["articles"]) {

        final news = News.newsFromJson(article);

        newsList.add(news);
      }
      return newsList;
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  Future<List<News>> getSearchNews(String keyword) async {
    Response response = await get(
        "http://newsapi.org/v2/everything?q=$keyword&apiKey=$API_KEY");
    print(response.statusCode);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      final Iterable json = body['articles'];
      return json.map((news) => News.newsFromJson(news));
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
