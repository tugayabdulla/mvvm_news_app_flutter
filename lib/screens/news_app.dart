import 'package:flutter/material.dart';
import 'package:news_app_mvvm/pages/breaking_news_page.dart';
import 'package:news_app_mvvm/pages/saved_news_page.dart';
import 'package:news_app_mvvm/pages/search_news_page.dart';
import 'package:news_app_mvvm/utils/destinations.dart';

class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        backgroundColor: allDestinations[_selectedIndex].color,
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            BreakingNewsPage(),
            SavedNewsPage(),
            SearchNewsPage(),
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
