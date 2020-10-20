import 'package:flutter/material.dart';
import 'package:news_app_mvvm/models/News.dart';

class NewsList extends StatelessWidget {
  NewsList(this.newsList);

  final List<News> newsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return NewsPreview(newsList[index]);
        });
  }
}

class NewsPreview extends StatelessWidget {
  NewsPreview(this.news);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Image.network(news.urlToImage),
                  Text(news.publishedAt),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(news.title),
                  Text(news.description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
