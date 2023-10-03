import 'package:flutter/material.dart';

class TopScreen extends StatefulWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  _TopScreenState createState() => _TopScreenState();
}

class ListItems {
  final String title;
  final IconData icon;
  final TimeOfDay time;

  ListItems(this.title, this.icon, this.time);
}

class _TopScreenState extends State<TopScreen> {
  List<ListItems> titleLists = [
    ListItems("タイトル", Icons.star, TimeOfDay.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("通知アプリ"),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: titleLists.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0),
                  bottom: BorderSide(width: 1.0),
                ),
                color: Colors.white,
              ),
              child: ListTile(
                title: Text(
                  titleLists[index].title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: Icon(titleLists[index].icon)
              ),
            );
          },
        ),
      ),
    );
  }
}
