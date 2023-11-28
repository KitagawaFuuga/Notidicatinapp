import 'package:flutter/material.dart';
import 'GetTime.dart';
import 'Dialogparts.dart';
class TopScreen extends StatefulWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  _TopScreenState createState() => _TopScreenState();
}

class ListItems {
  String title;
  IconData icon;
  TimeOfDay time;

  ListItems(this.title, this.icon, this.time);
}

class _TopScreenState extends State<TopScreen> {
  
  List<ListItems> titleLists = [
    ListItems("タイトル", Icons.star, TimeOfDay.now())
  ];

  int Count = 0;
  String setting_time_text = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("通知アプリ"),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          onPressed: (){
            DialogTenp(context,setting_time_text,Count, setState, titleLists);
          },
          child: const Icon(Icons.add,size: 70),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: titleLists.length,
          itemBuilder: (context, index) {
            return Container(
              height: 65,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0),
                  bottom: BorderSide(width: 1.0),
                ),
                color: Colors.white,
              ),
              child: Center(
                child: ListTile(
                  title: Text(
                    titleLists[index].title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 20),
                  ),
                  trailing: Wrap(
                    children: [
                      Icon(titleLists[index].icon,size: 50),
                      Container(
                        margin: EdgeInsets.only(top: 30, left: 30),
                        child: Text("${titleLists[index].time.hour}:${titleLists[index].time.minute}", style: TextStyle(fontSize: 18)),
                      )
                    ]
                  ),
                  onTap: (){},
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> SetTimes(BuildContext context, int count) async{
    await GetTime(context, count, titleLists);
  }

}
