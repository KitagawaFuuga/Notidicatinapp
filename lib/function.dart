
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

void GetTime(BuildContext context,  Function(void Function()) setStateCallback) async{
  TimeOfDay? picker = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if(picker != null){
    setStateCallback((){
      Globaltime = picker;
    });
  }
}

String DatetimeToString(DateTime? time, String format){
  final formatter = DateFormat(format);
  final formattedString = formatter.format(time!);
  return formattedString;
}

DateTime StringToDatetime(String time, String format){
  final formatter = DateFormat(format);
  final dateTime = formatter.parse(time);
  return dateTime;
}

Future<void> insertUser(ListItems items) async {
  await database.insert(
    'notification',
    items.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace
  );
}

Future<void> deleteUser(String text) async {
  await database.delete(
    'notification',
    where: "title = ?",
    whereArgs: [text]
  );
}

Future <List<ListItems>> getLists() async{
  final List<Map<String, dynamic>> maps = await database.query("notification");
  return List.generate(
    maps.length, (index){
      return ListItems(
        id: maps[index]["id"],
        title: maps[index]["title"],
        time: maps[index]["time"]
      );
    }
  );
}

// Future<void> update(ListItems items) async {
//   await database.update(
//     'notification',
//     where: "title = ?",
//     items.toMap(),
//     whereArgs: [items.title]
//   );
// }


