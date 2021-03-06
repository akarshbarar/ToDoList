import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todoapp/EditPage.dart';
import 'package:todoapp/ItemPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo-List',
      home: HomePage(),
      routes: {
        '/addItem': (context) => ItemPage(),
        '/home': (context) => HomePage()
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List> getData() async {
    print("Hii");
    var data = await http.get(Uri.parse("http://192.168.29.14:3000/getAll"));
    print(data.body);
    return json.decode(data.body)["data"];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("ToDoList"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Flexible(
                child: TextFormField(
              decoration: InputDecoration(hintText: 'Search'),
            )),
            Expanded(
                flex: 9,
                child: FutureBuilder<List>(
                    future: getData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                title:
                                    Text(snapshot.data![i]["title"].toString()),
                                subtitle:
                                    Text(snapshot.data![i]["des"].toString()),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    var id = snapshot.data![i]["id"].toString();
                                    http.delete(Uri.parse(
                                        "http://192.168.29.14:3000/delete/$id"));
                                    Navigator.of(context).pushNamed('/home');
                                  },
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => EditPage(
                                          title: snapshot.data![i]["title"]
                                              .toString(),
                                          des: snapshot.data![i]["des"]
                                              .toString(),
                                          completed: snapshot.data![i]
                                                  ["completed"]
                                              .toString(),
                                          id: snapshot.data![i]["id"]
                                              .toString())));
                                },
                              );
                            });
                      } else {
                        return CircularProgressIndicator();
                      }
                    }))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/addItem');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
