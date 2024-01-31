import 'package:flutter/material.dart';
import 'topscreen.dart';
import 'function.dart';
import 'package:shared_preferences/shared_preferences.dart';


final SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TopScreen()
    );
  }
}

TimeOfDay? Globaltime;

class ListItems {
  String title;
  TimeOfDay? time;

  ListItems(this.title, this.time);
}

List<ListItems> titleLists = [
    ListItems("タイトル", TimeOfDay.now())
];