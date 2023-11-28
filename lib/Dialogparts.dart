import 'package:flutter/material.dart';
import 'GetTime.dart';
import 'topscreen.dart';

Widget? DialogTenp(BuildContext context, String setting_time_text, int Count, Function(void Function()) setStateCallback, List<ListItems> titleLists){
  showDialog(
    context: context,
    builder: (_){
      
      return AlertDialog(
        title: Center(child: Text("設定", style: TextStyle(fontSize:30))),
         shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.shade800, //枠線の色
            width: 5, //枠線の太さ
          ),
        ),
        content: Container(
          height: 350,
          width: 300,
          color: Colors.white,
          child: Column(
            children: [
              Align(
                alignment: Alignment(0,-0.85),
                child: Container(
                  height: 50,
                  width: 280,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'テキスト入力',
                      hintText: 'テキストを入力してください',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text){

                    },
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),

              GestureDetector(
                child: Container(
                  height: 50,
                  width: 280,
                  color: Colors.white,
                  child: Text(
                    "${setting_time_text}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                onTap: (){
                  setStateCallback(() {
                    GetTime(context, Count, titleLists);
                  });
                },
              ),
               SizedBox(
                height: 25,
              ),
              Container(
                height: 50,
                width: 280,
                color: Colors.black,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade400,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.black, width: 2.0)
                      ),
                      minimumSize: Size(125, 50), // 幅と高さを指定
                    ),
                    onPressed: (){},
                    child: Text('キャンセル',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold,))
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade400,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.black, width: 2.0)
                      ),
                      minimumSize: Size(125, 50), // 幅と高さを指定
                    ),
                    onPressed: (){},
                    child: Text('OK',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold))
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
  );
}