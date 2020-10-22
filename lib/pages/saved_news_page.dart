import 'package:flutter/material.dart';
import 'package:news_app_mvvm/utils/destinations.dart';
import 'package:news_app_mvvm/view%20models/news_db_view_model.dart';
import 'package:news_app_mvvm/widgets/news_list.dart';
import 'package:provider/provider.dart';

class SavedNewsPage extends StatefulWidget {
  @override
  _SavedNewsPageState createState() => _SavedNewsPageState();
}

class _SavedNewsPageState extends State<SavedNewsPage> {
  @override
  void initState() {
    Provider.of<NewsDBViewModel>(context, listen: false).getSavedNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsDBViewModel>(builder: (context, vm, child) {
      return NewsList(
          newsList: vm.newsList,
          dismissible: true,
          backgroundColor: allDestinations[1].color.shade100);
    });
  }
}
