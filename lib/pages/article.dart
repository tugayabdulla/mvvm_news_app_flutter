import 'package:flutter/material.dart';
import 'package:news_app_mvvm/models/News.dart';
import 'package:news_app_mvvm/view%20models/news_db_view_model.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatelessWidget {
  ArticlePage(this.news);

  final News news;

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsDBViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.open_in_browser),
            onPressed: _launchURL,
            tooltip: 'Open in Browser',
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: _share,
            tooltip: 'Share...',
          )
        ],
      ),
      body: WebView(
        initialUrl: news.url,
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            child: Icon(Icons.favorite),
            onPressed: () async {
              await vm.insertNews(news);
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Article Saved'),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () async {
                    await vm.deleteNews(news);
                  },
                ),
              ));
            },
          );
        },
      ),
    );
  }

  _launchURL() async {
    final url = news.url;
    print('in');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _share() {
    Share.share('check out this article: ${news.url}');
  }
}
