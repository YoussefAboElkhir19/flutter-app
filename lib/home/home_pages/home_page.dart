import 'package:flutter/material.dart';
import 'package:flutter_application_1/first_screen.dart';
import 'package:flutter_application_1/home/profile/profile_page.dart';

// import Widgets
import '../home_widget/home_widget.dart';

class MyHomePage extends StatelessWidget {
  // Constractor
  // ? means that the value can be null
  final String? title;
  final String? body;
  const MyHomePage({this.title, this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("The ${title ?? " Tree"}"),
        // Navigate to ProfilePage
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),

      body: Column(
        children: [
          Image.asset("assets/cat1.jpg"),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              FavoriteWadgit(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.justify,
              //?? meas if body == null
              body ?? "This is My Bodyyyy",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyPhotos(url: "assets/about1.jpg", text: "About1"),
              MyPhotos(url: "assets/about1.jpg", text: "About2"),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FirstScreen()),
          );
        },
        child: Icon(Icons.next_plan),
      ),
    );
  }
}
