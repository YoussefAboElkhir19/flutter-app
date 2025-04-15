import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/home_pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

// Future<void> fetchData() async {
//   await Future.delayed(Duration(seconds: 10));
//   print("Waiting Method");
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
