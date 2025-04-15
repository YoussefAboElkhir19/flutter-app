import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/home_pages/home_page.dart';
// Add this import
// import 'package:flutter_application_1/main.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({super.key});
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    body.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: title,
              decoration: InputDecoration(
                hintText: "Enter Title",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: body,
              minLines: 3,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: "Enter Body",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder:
                  (context) => MyHomePage(title: title.text, body: body.text),
            ),
          );
        },
      ),
    );
  }
}
