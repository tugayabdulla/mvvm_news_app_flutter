import 'package:flutter/material.dart';
import 'package:news_app_mvvm/models/News.dart';
import 'package:news_app_mvvm/view%20models/news_db_view_model.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatelessWidget {
  ArticlePage(this.news);

  final News news;
  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Article"),
        // TODO: Add open in browser
      ),
      body: WebView(
        initialUrl: news.url,
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            child: Icon(Icons.favorite),
            onPressed: () async {
              print("onPressed starts");

              await Provider.of<NewsDBViewModel>(context, listen: false)
                  .insertNews(news);
              Scaffold.of(context).showSnackBar(snackBar);
              print("onPressed ends");
            },
          );
        },
      ),
    );
  }
}
