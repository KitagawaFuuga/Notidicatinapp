import 'package:flutter/material.dart';
import 'function.dart';
import 'widgets.dart';
import 'main.dart';

late Future<List<ListItems>> gets;
class TopScreen extends StatefulWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  TopScreenState createState() => TopScreenState();
}

class TopScreenState extends State<TopScreen> {

  @override
  void initState() {
    super.initState();
    gets = getLists();
  }

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
          onPressed: () {
            DialogTenp(context, setState);
          },
        ),
      ),
      body: FutureBuilder<List<ListItems>>(
        future: gets,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
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
                          snapshot.data![index].title,
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 20),
                        ),
                        trailing: Wrap(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 30, left: 30),
                              child: Text(snapshot.data![index].time, style: const TextStyle(fontSize: 18)),
                            )
                          ]
                        ),
                        onTap: () {
                          ChangeDialog(context, snapshot.data!, setState, index);
                          print(snapshot.data![index].id);
                        },
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
