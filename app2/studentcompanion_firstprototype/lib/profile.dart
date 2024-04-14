// /////////////////////////////////////////////////////////////////
// File Comment
//
// Purpose: file containing widgets and setup for user's profile
// Sources contained in main.dart
//
// /////////////////////////////////////////////////////////////////



// packages
import 'package:flutter/material.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';

// widget to be called that sets up profile page
class ProfileShell extends StatelessWidget{
  const ProfileShell({Key? key}) : super(key: key); // super delegation taken from https://pub.dev/packages/user_profile_avatar/example

  @override
  Widget build(BuildContext context){
    // scaffolds main profile page
    return Scaffold(
      appBar: AppBar(
        title: const Text("Whitworth University"),
        actions: [
          
          //currently throwing an exception, unknown as to why
          // UserProfileAvatar(
          //   avatarUrl: 'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg'
          // ),
        ],
      ),
       
    );
      
  
  
  }

}
