import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Breaking News', Icons.new_releases_sharp, Colors.green),
  Destination('Saved News', Icons.save, Colors.cyan),
  Destination('Search', Icons.search, Colors.deepOrange),
];