import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                  child: Icon(Icons.person, size: 200),
                  backgroundColor: Colors.blue,
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
                                      ),
                                      options(
                                        title: "Image",
                                        icon: Icons.image,
                                      ),
                                      options(
                                        title: "delete",
                                        icon: Icons.delete,
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
  final IconData icon;

  const options({required this.title, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [IconButton(onPressed: () {}, icon: Icon(icon)), Text(title)],
    );
  }
}
