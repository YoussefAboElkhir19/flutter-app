import 'package:flutter/material.dart';

class MyPhotos extends StatelessWidget {
  final String url;
  final String text;
  MyPhotos({required this.url, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(height: 100, width: 100, fit: BoxFit.cover, url),
        Text(text, style: TextStyle(color: Colors.blue, fontSize: 25)),
      ],
    );
  }
}
