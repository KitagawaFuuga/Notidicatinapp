import 'package:flutter/material.dart';
import 'function.dart';
import 'main.dart';
import 'topscreen.dart';

Widget? DialogTenp(BuildContext context, Function(void Function()) setStateCallback){

  String Titletext = "";

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
                      setStateCallback((){
                        Titletext = text;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () async{
                  GetTime(context,setStateCallback);
                },
                child: Text('時間設定',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold))
              ),
               SizedBox(
                height: 150,
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
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text('キャンセル',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold))
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

                    onPressed: () {
                      print(Titletext);
                      if (Titletext != null && Globaltime != null) {
                        try {
                          DateTime now = DateTime.now();
                          DateTime get = DateTime(now.year, now.month, now.day, Globaltime!.hour, Globaltime!.minute, 0, 0, 0);
                          String SetText = DatetimeToString(get, "HH:mm");
                          insertUser(ListItems(title: Titletext, time: SetText)).then((_) {
                            setStateCallback(() {
                              Globaltime = null;
                              gets = getLists();
                            });
                          });
                        } catch (e) {
                          print(e);
                        }
                      }
                      Navigator.pop(context);
                    },
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

Widget? ChangeDialog(BuildContext context, List<ListItems> listItem, Function(void Function()) setStateCallback, int index) {
  String titleText = listItem[index].title;
  String pickedTime = listItem[index].time;

  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Center(child: Text("設定", style: TextStyle(fontSize: 30))),
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
              // Align(
              //   alignment: Alignment(0, -0.85),
              //   child: Container(
              //     height: 50,
              //     width: 280,
              //     child: TextField(
              //       decoration: InputDecoration(
              //         labelText: 'テキスト入力',
              //         hintText: 'テキストを入力してください',
              //         border: OutlineInputBorder(),
              //       ),
              //       onChanged: (text) {
              //         setStateCallback(() {
              //           titleText = text;
              //         });
              //       },
              //       controller: TextEditingController(text: titleText),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 25,
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     GetTime(context,setStateCallback);
              //   },
              //   child: Text(
              //     '時間設定',
              //     style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              //   ),
              // ),
              // SizedBox(
              //   height: 50,
              // ),
              ElevatedButton(
                onPressed: (){
                  setStateCallback(() {
                    deleteUser(listItem[index].title);
                    gets = getLists();
                  });
                  Navigator.pop(context);
                }, 
                child: Text(
                  '削除',
                  style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
                ),
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
                          side: BorderSide(color: Colors.black, width: 2.0)),
                      minimumSize: Size(125, 50), // 幅と高さを指定
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'キャンセル',
                      style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Colors.grey.shade400,
                  //     elevation: 10,
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: new BorderRadius.circular(30.0),
                  //         side: BorderSide(color: Colors.black, width: 2.0)),
                  //     minimumSize: Size(125, 50), // 幅と高さを指定
                  //   ),
                  //   onPressed: () {
                  //     if (titleText != null) {
                  //       try {
                  //         setStateCallback(() {
                  //           update(listItem[index]);
                  //         });
                  //       } catch (e) {
                  //         print(e);
                  //       }
                  //     }
                  //     if(pickedTime != null){
                  //       try {
                  //         setStateCallback(() {
                  //           DateTime now = DateTime.now();
                  //           DateTime get = DateTime(now.year, now.month, now.day, Globaltime!.hour, Globaltime!.minute, 0, 0, 0);
                  //           update(listItem[index]);
                  //           Globaltime = null;
                  //         });
                  //       } catch (e) {
                  //         print(e);
                  //       }
                  //     }
                  //     Navigator.pop(context);
                  //   },
                  //   child: Text(
                  //     'OK',
                  //     style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}