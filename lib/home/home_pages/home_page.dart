import 'dart:io';

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
  final List<File>? image;
  const MyHomePage({this.image, this.title, this.body, super.key});

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
          image == null || image!.isEmpty
              ? Image.asset("assets/cat1.jpg")
              : Image.file(
                image![0],
                height: 100,
                fit: BoxFit.cover,
                width: double.infinity,
              ),

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
          image == null || image!.isEmpty
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyPhotos(url: "assets/about1.jpg", text: "About1"),
                  MyPhotos(url: "assets/about1.jpg", text: "About2"),
                ],
              )
              : SizedBox(
                height: 500,
                child: GridView.builder(
                  // lenth of the list
                  itemCount: image!.length,
                  // to return the list of images
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(image![index], height: 100, width: 100),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    childAspectRatio: 1,
                  ),
                ),
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
