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
            ProfilePhoto(
              totalWidth: 31, // sets diameter
              cornerRadius: 21, // sets corner curvature
              color: Colors.black, // color to show if no image
              image: user_image, // sets image to display
              // TODO(any): add profile editing functionality by tapping photo
              //onTap: // sets what to do on tap
            ),
            const Padding(padding: EdgeInsets.all(10)), // adds padding to the right of the icon
        ],
      ),
      // TODO(any): integrate storage & modification of user data
      body: const Column(
        children: [
          // TODO(any): replace text widgets with more complex display widgets
          Text("atest"), // User's username (assumedly of form atest11)
          Text("atest11@my.whitworth.edu"), // User's email
          Text("555-555-5555"), // User's phone number
          Text("Whitworth CS, Example, Etc"), // list of user's interests
        ],
      )
    );
  }
}
