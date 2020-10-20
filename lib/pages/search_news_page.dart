import 'package:flutter/material.dart';
import 'package:news_app_mvvm/utils/destinations.dart';

class SearchNewsPage extends StatefulWidget {
  final Destination dest;
  SearchNewsPage(this.dest);
  @override
  _SearchNewsPageState createState() => _SearchNewsPageState();
}

class _SearchNewsPageState extends State<SearchNewsPage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: widget.dest.color,
      child: Center(
        child: Text("Search News"),
      )
      ,);
  }
}
