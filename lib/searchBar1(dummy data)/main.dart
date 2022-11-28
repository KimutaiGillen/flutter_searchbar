import 'package:flutter/material.dart';
import 'package:listview_search/search_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SearchList(),
    );
  }
}
