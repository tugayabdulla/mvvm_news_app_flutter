import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app_mvvm/models/News.dart';
import 'file:///C:/Users/abdul/AndroidStudioProjects/news_app_mvvm/lib/screens/article.dart';
import 'package:news_app_mvvm/utils/functions.dart';
import 'package:news_app_mvvm/view%20models/news_db_view_model.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {
  NewsList({this.newsList, this.dismissible = false, this.backgroundColor});

  final Color backgroundColor;
  final List<News> newsList;
  final bool dismissible;

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<NewsDBViewModel>(context, listen: false);
    return ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          var news = newsList[index];
          return dismissible
              ? Dismissible(
                  background: Container(
                    color: Colors.red,
                  ),
                  key: Key(news.url),
                  onDismissed: (_) async {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Article Deleted'),
                      action: SnackBarAction(
                        label: "UNDO",
                        onPressed: () async {
                          await vm.insertNews(news);
                        },
                      ),
                    ));
                    await vm.deleteNews(news);
                  },
                  child: NewsPreview(newsList[index], backgroundColor))
              : NewsPreview(newsList[index], backgroundColor);
        });
  }
}

class NewsPreview extends StatelessWidget {
  NewsPreview(this.news, this.color);

  final Color color;
  final News news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticlePage(news),
          ),
        );
      },
      child: Container(
        constraints: BoxConstraints(minHeight: 150.0, maxHeight: 180.0),
        child: Card(
          color: color,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[

                      Image.network(
                        news.urlToImage ??
                            "https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg",
                      ),
                      Text(formatDateForUI(DateTime.parse(news.publishedAt))),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        news.title ?? "Placeholder Title",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        news.description ?? "Placeholder description",
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
