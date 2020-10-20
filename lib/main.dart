import 'package:flutter/material.dart';
import 'package:news_app_mvvm/screens/news_app.dart';
import 'package:news_app_mvvm/view%20models/news_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      title: "News",
      home: ChangeNotifierProvider(
        create: (context) => NewsViewModel(),
        child: NewsApp(),
      ),
    ),
  );
}
