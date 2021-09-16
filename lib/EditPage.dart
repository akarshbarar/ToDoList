import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    title.text = widget.title;
    description.text = widget.des;
    completed.text = widget.completed;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Ediit"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              // initialValue: widget.title,
              controller: title,
              decoration: InputDecoration(hintText: 'Enter title'),
            ),
            TextFormField(
              // initialValue: widget.des,
              controller: description,
              decoration: InputDecoration(hintText: "Enter Description"),
            ),
            TextFormField(
              // initialValue: widget.completed,
              controller: completed,
              decoration: InputDecoration(hintText: "Completed "),
            ),
            MaterialButton(
              onPressed: () {
                var id = widget.id;
                http.put(Uri.parse("http://192.168.29.14:3000/edit/$id"),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "title": title.text,
                      "des": description.text,
                      "completed": completed.text
                    }));
                Navigator.of(context).pushNamed('/home');
              },
              child: Text("Done"),
            )
          ],
        ),
      ),
    ));
  }
}
