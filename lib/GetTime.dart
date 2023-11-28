import 'package:flutter/material.dart';
import 'topscreen.dart';

Future<void> GetTime(BuildContext context, int count,List<ListItems> titleLists) async{
  final TimeOfDay? picker = await showTimePicker(
    context: context, 
    initialTime: TimeOfDay.now(),
  );

  if(picker != null){
      titleLists[count].time = picker;
      count++;
  }
}
