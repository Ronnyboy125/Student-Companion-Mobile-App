// /////////////////////////////////////////////////////////////////
// File Comment
//
// Purpose: file containing widgets and setup for user's profile
// Sources contained in main.dart
//
// /////////////////////////////////////////////////////////////////



// packages
import 'package:flutter/material.dart';
import 'package:profile_photo/profile_photo.dart'; // package used for handling a clickable profile photo

// widget to be called that sets up profile page
class ProfileShell extends StatelessWidget{
  const ProfileShell({Key? key}) : super(key: key); // super delegation taken from https://pub.dev/packages/user_profile_avatar/example

  //
  //= Image(NetworkImage(url))

  @override
  Widget build(BuildContext context){
    // scaffolds main profile page
    return Scaffold(
      appBar: AppBar(
        title: const Text("Whitworth University"),
        actions: [
            ProfilePhoto(
              totalWidth: 31, // sets diameter
              color: Colors.black, // color to show if no image
              image: NetworkImage('https://images.unsplash.com/photo-1602466439270-97a39a1496a4?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFiaXR8ZW58MHx8MHx8fDA%3D'), // sets image to display
              onTap: () => print("aa"), // sets what to do on tap, test rn
            ),
            const Padding(padding: EdgeInsets.all(10)), // adds padding to the right of the icon

        ],
      ),
       
    );
      
  
  
  }

}
