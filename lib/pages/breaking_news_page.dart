import 'package:flutter/material.dart';
import 'package:news_app_mvvm/utils/destinations.dart';
import 'package:news_app_mvvm/view%20models/news_view_model.dart';
import 'package:news_app_mvvm/widgets/news_list.dart';
import 'package:provider/provider.dart';

class BreakingNewsPage extends StatefulWidget {
  @override
  _BreakingNewsPageState createState() => _BreakingNewsPageState();
}

class _BreakingNewsPageState extends State<BreakingNewsPage> {
  @override
  void initState() {
    Provider.of<NewsViewModel>(context, listen: false).getBreakingNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsViewModel>(builder: (context, vm, child) {
      return vm.breakingNews.length != 0? RefreshIndicator(
        onRefresh: vm.getBreakingNews,
        child: NewsList(
            newsList: vm.breakingNews,
            backgroundColor: allDestinations[0].color.shade100),
      ):Center(child: CircularProgressIndicator());
    });
  }

}