// /////////////////////////////////////////////////////////////////
// File Comment
//
// Purpose: file containing widgets and setup for user's profile
// Sources contained in main.dart
//
// /////////////////////////////////////////////////////////////////

// unused sources
// https://pub.dev/packages/json_cache

// packages
import 'package:flutter/material.dart';
import 'package:profile_photo/profile_photo.dart'; // package used for handling a clickable profile photo
    
// widget to be called that sets up profile page
// TODO: resolve @immutable formatting issue
class ProfileShell extends StatelessWidget{
  ProfileShell(this.user_image, this.user_info_map, {Key? key,});

  NetworkImage user_image; // user profile photo to be used throught the program
  Map<String, dynamic> user_info_map; // map from main of pertinent user info

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
            // https://stackoverflow.com/questions/53824755/flutter-dart-how-to-access-a-single-entry-in-a-map-object used for reminder of map formatting
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
