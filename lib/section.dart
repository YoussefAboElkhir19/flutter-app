import 'package:flutter/material.dart';

class section extends StatefulWidget {
  section({super.key});

  @override
  State<section> createState() => _sectionState();
}

class _sectionState extends State<section> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Column(
        children: [
          Text(isFavorite ? "Yousseffffff" : " Nour "),
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
