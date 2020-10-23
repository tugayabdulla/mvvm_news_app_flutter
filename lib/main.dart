import 'package:flutter/material.dart';
import 'package:news_app_mvvm/screens/news_app.dart';
import 'package:news_app_mvvm/view%20models/news_db_view_model.dart';
import 'package:news_app_mvvm/view%20models/news_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsViewModel()),
        ChangeNotifierProvider(create: (_) => NewsDBViewModel())
      ],
      child: MaterialApp(
        home: NewsApp(),
      ),
    ),
  );
}
