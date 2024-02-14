import 'package:flutter/material.dart';
import 'topscreen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

var database;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = await openDatabase(
    join(await getDatabasesPath(), 'notification.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE notification(id AUTOINCREMENT, title TEXT, time TEXT)'
      );
    },
    version: 1
  );

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
  final int? id;
  final String title;
  final String time;

  ListItems({          this.id, 
              required this.title,
              required this.time});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'time': time,
    };
  }
} 