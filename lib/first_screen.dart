import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/home_pages/home_page.dart';
import 'package:image_picker/image_picker.dart';
// Add this import
// import 'package:flutter_application_1/main.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({super.key});
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<File>? selectedImage = [];

  // create an instance of image picker
  ImagePicker imagePicker = ImagePicker();
  // Function to select a image
  Future<void> imageSelector() async {
    // select image and  store image in variable
    List<XFile>? images = await imagePicker.pickMultiImage();

    if (images != null && mounted) {
      setState(() {
        // All Files save in List
        selectedImage!.addAll(
          images.map((toElement) => File(toElement!.path)).toList(),
        );
      });
    }
  }

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
          SizedBox(height: 20),
          selectedImage!.isEmpty
              ? Container(
                color: Colors.grey[200],
                height: 150,
                width: MediaQuery.sizeOf(context).width - 20,
                child: IconButton(
                  onPressed: () {
                    imageSelector();
                  },
                  icon: Icon(Icons.camera_alt),
                ),
              )
              :
              // convert Files in  List to Widget
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      selectedImage!
                          .map(
                            (toElement) => Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Image.file(
                                    toElement,
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedImage!.removeAt(
                                        selectedImage!.indexOf(toElement),
                                      );
                                    });
                                  },
                                  icon: Icon(Icons.cancel, color: Colors.red),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                ),
              ),

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
                  (context) => MyHomePage(
                    title: title.text,
                    body: body.text,
                    image: selectedImage,
                  ),
            ),
          );
        },
      ),
    );
  }
}
