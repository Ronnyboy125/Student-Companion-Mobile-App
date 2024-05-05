import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/material/ExpansionTile-class.html
//website used to help with expanded menus
//https://stackoverflow.com/questions/43583411/how-to-create-a-hyperlink-in-flutter-widget
//used for reference on how to implement hyperlinks

class ResourceScreen extends StatelessWidget {
  const ResourceScreen({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Student Resources')),
        body: const StuResources(),
      )
    );
  }
}

class StuResources extends StatefulWidget {
  const StuResources({super.key});

  @override
  State<StuResources> createState() => _StuResources();
}

class _StuResources extends State<StuResources> {

  @override
  Widget build(BuildContext context){
    return  Column(
      children: <Widget>[
        const ExpansionTile(
          title: Text('Incase of Academic Difficulty'),
          children: <Widget>[
            ListTile(title: Text('Center for Career & Professional Development: 509.777.3272')),
            ListTile(title: Text('Tracy Mouser(Director, Center for Career & Professional Development) : tmouser@whitworth.edu')),
          ]
        ),
        const ExpansionTile(
          title: Text('Academic Tutoring & Resources'),
          children: <Widget>[
            ListTile(title: Text('See Whitworth resources page for live updates each semester')),
          ]
        ),
        ExpansionTile(
          title: Text('Mental, Physical & Emotional Health Resources'),
          children: <Widget>[
            const ListTile(title: Text('Incase of medical emergency call 911 immediately')),
            const ListTile(title: Text('In a non-emergency situation, contact the Whitworth Health & Counseling Center, located in Schumacher Hall.')),
            const ListTile(title: Text('Medical Appointments: 509.777.3259')),
            const ListTile(title: Text('Counseling Appointments: 509.777.3259')),
            const ListTile(title: Text('Molly Dewalt, Director, Counseling Services: 509.777.3259')),
            const ListTile(title: Text('Kristiana Holmes, Director, Health Center: 509.777.3259')),
            ListTile(title: Text('www.whitworth.edu/health&counselingcenter'),
            )
          ]
        )
      ]
    );
  }
}