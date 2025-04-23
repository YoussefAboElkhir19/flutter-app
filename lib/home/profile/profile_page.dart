// libraray to input and output
import 'dart:io';

import 'package:flutter/material.dart';
// import library to select image
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // create variable to store image as File
  File? selectedImage;

  // create an instance of image picker
  ImagePicker imagePicker = ImagePicker();
  // Function to select a image
  Future<void> imageSelector(ImageSource source) async {
    // select image and  store image in variable
    XFile? image = await imagePicker.pickImage(source: source);

    if (image != null && mounted) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile', style: TextStyle(fontSize: 25))),

      body: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 120,
                  backgroundColor:
                      Colors.grey[200], // Optional: Add a background color
                  child:
                      selectedImage == null
                          ? Icon(Icons.person, size: 200)
                          : ClipOval(
                            child: Image.file(
                              selectedImage!,
                              // Style for image Selected
                              width: 240, // Double the radius
                              height: 240, // Double the radius
                              fit:
                                  BoxFit
                                      .cover, // Ensures the image covers the circle
                            ),
                          ),
                ),
                CircleAvatar(
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder:
                            (context) => SizedBox(
                              height: 150,
                              child: Column(
                                children: [
                                  Text("Profile"),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      options(
                                        title: "Camera",
                                        icon: Icons.camera_alt,
                                        onPressed: () {
                                          imageSelector(ImageSource.camera);
                                        },
                                      ),
                                      options(
                                        title: "Image",
                                        icon: Icons.image,
                                        onPressed: () {
                                          imageSelector(ImageSource.gallery);
                                        },
                                      ),
                                      if (selectedImage != null)
                                        options(
                                          selectedImage: selectedImage,
                                          title: "Delete",
                                          icon: Icons.delete,
                                          onPressed: () {
                                            // ensure the screen is mounted before calling setState
                                            if (mounted) {
                                              setState(() {
                                                selectedImage = null;
                                              });
                                            }
                                            Navigator.pop(context);
                                          },
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                      );
                    },
                    icon: Icon(Icons.camera_alt),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class options extends StatelessWidget {
  final String title;

  Colors? color;
  final IconData icon;
  File? selectedImage;
  VoidCallback onPressed;
  options({
    // this.color,
    this.selectedImage,
    required this.onPressed,
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          color: selectedImage != null ? Colors.red : Colors.grey,
          onPressed: onPressed,
          icon: Icon(icon),
        ),
        Text(
          title,
          style: TextStyle(
            color: selectedImage != null ? Colors.red : Colors.grey,
          ),
        ),
      ],
    );
  }
}
