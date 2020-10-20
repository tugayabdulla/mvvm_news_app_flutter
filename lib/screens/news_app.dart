import 'package:flutter/material.dart';
import 'package:news_app_mvvm/pages/breaking_news_page.dart';
import 'package:news_app_mvvm/pages/saved_news_page.dart';
import 'package:news_app_mvvm/pages/search_news_page.dart';
import 'package:news_app_mvvm/utils/destinations.dart';
import 'package:news_app_mvvm/widgets/destination_view.dart';

class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Provider.of<NewsViewModel>(context, listen: false).getBreakingNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Text"),
      // ),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _selectedIndex,
          children:<Widget>[
            BreakingNewsPage(),
            SavedNewsPage(allDestinations[_selectedIndex]),
            SearchNewsPage(allDestinations[_selectedIndex]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        // backgroundColor: allDestinations[_selectedIndex].color,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
            icon: Icon(destination.icon),
            backgroundColor: destination.color,
            label: destination.title,
          );
        }).toList(),
      ),
    );
  }
}
