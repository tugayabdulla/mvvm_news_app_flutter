import 'package:flutter/material.dart';
import 'package:news_app_mvvm/view%20models/news_view_model.dart';
import 'package:news_app_mvvm/widgets/news_list.dart';
import 'package:provider/provider.dart';

class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  int _selectedIndex = 0;


  @override
  void initState() {

    super.initState();
    Provider.of<NewsViewModel>(context,listen: false).getBreakingNews();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      body: NewsList(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
