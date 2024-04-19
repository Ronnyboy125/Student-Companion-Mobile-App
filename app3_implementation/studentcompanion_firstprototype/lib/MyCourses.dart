////////
// Purpose: file containing widgets for InfoBoard page
////////

// packages
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// widget to be called that displays events and info
class MyCourses extends StatelessWidget {
  const MyCourses({Key? key}): super(key:key); // super delegation taken from https://pub.dev/packages/user_profile_avatar/example

//again, if Blackboard is implemented, all of this information will be imported from there, for now just hard-coded
@override
Widget build(BuildContext context) {
  return ListView(
    children: [
      Card(
        margin:EdgeInsets.only(top:20, bottom:20, left: 10, right: 10),
        color: const Color.fromARGB(255, 198, 198, 198),
        child: ListTile(
          leading: FractionallySizedBox(
              widthFactor: 0.4,
              heightFactor: 1.6,
              child: Image.asset('assets/book.jpg', fit: BoxFit.fill),
            ),
          contentPadding: EdgeInsets.all(10),
          title: Text('CS-670'),
          titleTextStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 18),
          subtitle: Text('Professor: Dr. Pr. Sir Whitwortian McQuilkin IV\nTime: 4:00 AM - 10:30 AM\nLocation: EJ 401'),
        ),
      ),

      Card(
        margin:EdgeInsets.only(top:20, bottom:20, left: 10, right: 10),
        color: const Color.fromARGB(255, 198, 198, 198),
        child: ListTile(
          leading: FractionallySizedBox(
              widthFactor: 0.4,
              heightFactor: 1.6,
              child: Image.asset('assets/example.jpg', fit: BoxFit.fill),
            ),
          contentPadding: EdgeInsets.all(10),
          title: Text('Example'),
          titleTextStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 18),
          subtitle: Text('Professor: Dr. Example\nTime: 11:00 AM - 12:30 PM\nLocation: Ex. 202'),
        ),
      ),

      Card(
        margin:EdgeInsets.only(top:20, bottom:20, left: 10, right: 10),
        color: const Color.fromARGB(255, 198, 198, 198),
        child: ListTile(
          leading: FractionallySizedBox(
              widthFactor: 0.4,
              heightFactor: 1.6,
              child: Image.asset('assets/example2.jpg', fit: BoxFit.fill),
            ),
          contentPadding: EdgeInsets.all(10),
          title: Text('Example2'),
          titleTextStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 18),
          subtitle: Text('Professor: Dr. Filler\nTime: 2:00 PM - 3:30 PM\nLocation: etc. 303'),
        ),
      ),

      Card(
        margin:EdgeInsets.only(top:20, bottom:20, left: 10, right: 10),
        color: const Color.fromARGB(255, 198, 198, 198),
        child: ListTile(
          leading: FractionallySizedBox(
              widthFactor: 0.4,
              heightFactor: 1.6,
              child: Image.asset('assets/backrooms.jpg', fit: BoxFit.fill),
            ),
          contentPadding: EdgeInsets.all(10),
          title: Text('Example3'),
          titleTextStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 18),
          subtitle: Text('Professor: Dr. LastName\nTime: 2:00 PM - 3:30 PM\nLocation: Backroom 0'),
        ),
      ),
    ],
  );
}
}