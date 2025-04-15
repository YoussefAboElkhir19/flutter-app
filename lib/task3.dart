import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/mobile_phone.dart';

class task3 extends StatefulWidget {
  task3({super.key});

  @override
  State<task3> createState() => _task3State();
}

class _task3State extends State<task3> {
  bool isChange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Title and icon
            Text(
              "Portofoliooo",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            // Menu Icon
            Icon(Icons.menu, size: 30.0),
          ],
        ),
        backgroundColor: Colors.blueAccent,
        // Line under the AppBar
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: const Color.fromARGB(255, 24, 24, 24),
            thickness: .8,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // First Text
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
              child: Text(
                "Hey There , I Am Youssef",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            // Decsription about me
            Padding(
              padding: const EdgeInsets.fromLTRB(
                16.0,
                8.0,
                16.0,
                4.0,
              ), // Reduced top padding
              child: Text(
                "I am a programmerr , Mobile Developer",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            // IconButton
            IconButton(
              onPressed: () {
                setState(() {
                  isChange = !isChange;
                });
              },
              icon: Icon(Icons.favorite),
            ),
            // Image
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0), //
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0), // Border radius
                child: Container(
                  child: Image.asset(
                    isChange ? "assets/cat1.jpg" : "assets/photo2.jpg",
                  ),
                ),
              ),
            ),
            // Button Contact Us
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactUsPage()),
                  );
                },
                child: Text("contact us"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Contact us
class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "How to Contact Me",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Social Media Name
            Icon(Icons.social_distance),
            Text("Social Media"),
            Text("Youssef Essam"),

            // Email
            SizedBox(height: 20),
            Icon(Icons.email),
            Text("Email"),
            Text("essamy688@gmail.com"),

            SizedBox(height: 20),
            // Phone
            Icon(Icons.phone),
            Text("phone Number"),
            Text("01143752219"),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
