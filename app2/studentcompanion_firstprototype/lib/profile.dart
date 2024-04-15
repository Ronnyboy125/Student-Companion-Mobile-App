// /////////////////////////////////////////////////////////////////
// File Comment
//
// Purpose: file containing widgets and setup for user's profile
// Sources contained in main.dart
//
// /////////////////////////////////////////////////////////////////

//temp sources
//https://pub.dev/packages/json_cache

// packages
import 'package:flutter/material.dart';
import 'package:profile_photo/profile_photo.dart'; // package used for handling a clickable profile photo
    
// widget to be called that sets up profile page
class ProfileShell extends StatelessWidget{
  ProfileShell(this.user_image, {Key? key,});

  NetworkImage user_image; // user profile photo to be used throught the program

  @override
  Widget build(BuildContext context) {
    
    // scaffolds main profile page
    return Scaffold(
      appBar: AppBar(
        title: const Text("Whitworth University"),
        actions: [
            IconButton(
              onPressed: () => print("WIP"), // WIP for editing icon
              icon: const Icon(Icons.edit),
            ),
        ],
      ),
      // TODO(any): integrate storage & modification of user data
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)), // adds padding to the top of the icon
            ProfilePhoto(
                totalWidth: 300, // sets diameter
                cornerRadius: 300, // sets corner curvature
                color: Colors.black, // color to show if no image
                image: user_image, // sets image to display
                // TODO(any): add profile editing functionality by tapping photo
                //onTap: // sets what to do on tap
              ),
            // TODO(any): replace text widgets with more complex display widgets
            const Padding(padding: EdgeInsets.all(10)), // adds padding to the bottom of the icon
            Text("atest"), // User's username
            Text("atest11@my.whitworth.edu"), // User's email
            Text("555-555-5555"), // User's phone number
            Text("Whitworth CS, Example, Etc"), // list of user's interests
          ],
        ),
      ),
    );
  }
}
