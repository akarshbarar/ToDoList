import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Add Item"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: title,
              decoration: InputDecoration(hintText: 'Enter Title'),
            ),
            TextField(
              controller: description,
              decoration: InputDecoration(hintText: 'Enter Description'),
            ),
            MaterialButton(
                child: Text("Add Item"),
                onPressed: () {
                  http.post(Uri.parse("http://192.168.29.14:3000/addItem"),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "title": title.text,
                        "des": description.text
                      }));
                  Navigator.of(context).pushNamed('/home');
                })
          ],
        ),
      ),
    ));
  }
}
