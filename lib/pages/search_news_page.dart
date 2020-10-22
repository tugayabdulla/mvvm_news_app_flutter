import 'package:flutter/material.dart';
import 'package:news_app_mvvm/utils/destinations.dart';
import 'package:news_app_mvvm/view%20models/news_view_model.dart';
import 'package:news_app_mvvm/widgets/news_list.dart';
import 'package:provider/provider.dart';

class SearchNewsPage extends StatefulWidget {
  @override
  _SearchNewsPageState createState() => _SearchNewsPageState();
}

class _SearchNewsPageState extends State<SearchNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            hintText: "Search...",
          ),
          onSubmitted: (keyword) {
            print(keyword);
            Provider.of<NewsViewModel>(context, listen: false)
                .getSearchNews(keyword);
          },
        ),
        Flexible(
          child: Consumer<NewsViewModel>(builder: (context, vm, child) {
            return NewsList(newsList: vm.searchNews,backgroundColor:allDestinations[2].color.shade100);
          }),
        )
      ],
    );
  }
}
