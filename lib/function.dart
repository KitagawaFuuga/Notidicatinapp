import 'dart:math';

import 'package:flutter/material.dart';
import 'topscreen.dart';
import 'widgets.dart';
import 'main.dart';

void GetTime(BuildContext context,List<ListItems> titleLists,  Function(void Function()) setStateCallback) async{
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


