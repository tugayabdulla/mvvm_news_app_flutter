import 'package:flutter/material.dart';
import 'package:news_app_mvvm/models/News.dart';
import 'package:news_app_mvvm/view%20models/news_view_model.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsViewModel>(builder: (context, vm, child) {
      return ListView.builder(
          itemCount: vm.breakingNews.length,
          itemBuilder: (context, index) {
            return NewsPreview(vm.breakingNews[index]);
          });
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
