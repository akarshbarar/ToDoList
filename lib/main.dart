import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      routes: {},
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
                                  onPressed: () {},
                                ),
                              );
                            });
                      } else {
                        return CircularProgressIndicator();
                      }
                    }))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
