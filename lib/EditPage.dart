import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Ediit"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Enter Title"),
            ),
            TextField(
              decoration: InputDecoration(hintText: "Enter Description"),
            ),
            TextField(
              decoration: InputDecoration(hintText: "Completed "),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text("Done"),
            )
          ],
        ),
      ),
    ));
  }
}
