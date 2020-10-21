import 'package:flutter/material.dart';
import 'package:news_app_mvvm/models/News.dart';
import 'package:news_app_mvvm/pages/article.dart';
import 'package:news_app_mvvm/view%20models/news_db_view_model.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  NewsList({this.newsList, this.dismissible = false});

  final List<News> newsList;
  final dismissible;

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.newsList.length,
        itemBuilder: (context, index) {
          return widget.dismissible
              ? Dismissible(
                  background: Container(
                    color: Colors.red,

                  ),
                  key: Key(widget.newsList[index].url),
                  onDismissed: (direction) {
                    Provider.of<NewsDBViewModel>(context, listen: false)
                        .deleteNews(widget.newsList[index]);
                    setState(() {
                      widget.newsList.removeAt(index);
                    });
                  },
                  child: NewsPreview(widget.newsList[index]))
              : NewsPreview(widget.newsList[index]);
        });
  }
}

class NewsPreview extends StatelessWidget {
  NewsPreview(this.news);

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
      child: Card(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Image.network(news.urlToImage ??
                        "https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg"),
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
                    Text(news.title ?? "Placeholder Title"),
                    Text(news.description ?? "Placeholder description"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
