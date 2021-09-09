import 'package:flutter/material.dart';

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
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text("Todo List Title"),
                        subtitle: Text("Desciption"),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {},
                        ),
                      );
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
