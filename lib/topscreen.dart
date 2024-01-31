import 'package:flutter/material.dart';
import 'function.dart';
import 'widgets.dart';
import 'main.dart';

class TopScreen extends StatefulWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  TopScreenState createState() => TopScreenState();
}

class TopScreenState extends State<TopScreen> {

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
          child: const Icon(Icons.add, size: 50),
          onPressed: (){
            DialogTenp(context,setting_time_text,titleLists.length + 1, setState, titleLists);
          },
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
                      Container(
                        margin: EdgeInsets.only(top: 30, left: 30),
                        child: Text("${titleLists[index].time?.hour}:${titleLists[index].time?.minute}", style: TextStyle(fontSize: 18)),
                      )
                    ]
                  ),
                  onTap: (){
                    ChangeDialog(context, titleLists, setState, index);
                    print(index);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
