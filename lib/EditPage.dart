import 'package:flutter/material.dart';
import 'package:todoapp/Model.dart';

class EditPage extends StatefulWidget {
  const EditPage(
      {Key? key,
      required this.title,
      required this.des,
      required this.completed,
      required this.id})
      : super(key: key);
  final String title, des, completed, id;
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.title);
  }

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController completed = TextEditingController();

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
              controller: title,
              decoration: InputDecoration(hintText: "Enter Title"),
            ),
            TextField(
              controller: description,
              decoration: InputDecoration(hintText: "Enter Description"),
            ),
            TextField(
              controller: completed,
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
