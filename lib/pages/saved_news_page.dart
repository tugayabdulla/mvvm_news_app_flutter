import 'package:flutter/material.dart';
import 'package:news_app_mvvm/utils/destinations.dart';

class SavedNewsPage extends StatefulWidget {
  SavedNewsPage(this.dest);

  final Destination dest;

  @override
  _SavedNewsPageState createState() => _SavedNewsPageState();
}

class _SavedNewsPageState extends State<SavedNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.dest.color,
      child: Center(
        child: Text("Saved News"),
      ),
    );
  }
}
