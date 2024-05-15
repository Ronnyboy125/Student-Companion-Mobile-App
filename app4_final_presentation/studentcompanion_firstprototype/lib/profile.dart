import 'package:flutter/material.dart';
import 'package:profile_photo/profile_photo.dart'; 
    
// ignore: must_be_immutable
class ProfileShell extends StatelessWidget{
  ProfileShell(this.user_image, this.user_info_map, {Key? key,});

  NetworkImage user_image; 
  Map<String, dynamic> user_info_map; 

  @override
  Widget build(BuildContext context) {
    
    // scaffolds main profile page``
    return Scaffold(
      appBar: AppBar(
        title: const Text("Whitworth University"),
        actions: [
            IconButton(
              onPressed: () => print("WIP"), //working in progress
              icon: const Icon(Icons.edit),
            ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)), 
            ProfilePhoto(
                totalWidth: 300, 
                cornerRadius: 300,
                color: Colors.black,
                image: user_image, 
                ),
            const Padding(padding: EdgeInsets.all(10)), 
            Text(user_info_map["username"]!), // User's username
            Text(user_info_map["email"]!), // User's email
            Text(user_info_map["phone"]!), // User's phone number
            Text(user_info_map["interests"]!), // list of user's interests
          ],
        ),
      ),
    );
  }
}
