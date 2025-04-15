import 'package:flutter/material.dart';

class FavoriteWadgit extends StatefulWidget {
  const FavoriteWadgit({super.key});

  @override
  State<FavoriteWadgit> createState() => _FavoriteWadgitState();
}

class _FavoriteWadgitState extends State<FavoriteWadgit> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(Icons.favorite, color: isFavorite ? Colors.red : Colors.grey),
    );
  }
}
