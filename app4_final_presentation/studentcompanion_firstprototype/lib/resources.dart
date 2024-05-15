import 'dart:ffi';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//https://api.flutter.dev/flutter/material/ExpansionTile-class.html
//website used to help with expanded menus
//https://stackoverflow.com/questions/76071870/how-i-can-attach-a-link-to-listtile-which-opens-up-a-link-on-browser
//used for reference on how to implement hyperlinks
//

Future<void> launchLink(String url, {bool isNewTab = true}) async {
    await launchUrl(
        Uri.parse(url),
        webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
}

class ResourceScreen extends StatelessWidget {
  const ResourceScreen({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () =>Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
          ),
            title: const Text('Student Resources'),
          ),
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
          title: const Text('Mental, Physical & Emotional Health Resources'),
          children: <Widget>[
            const ListTile(title: Text('Incase of medical emergency call 911 immediately')),
            const ListTile(title: Text('In a non-emergency situation, contact the Whitworth Health & Counseling Center, located in Schumacher Hall.')),
            const ListTile(title: Text('Medical Appointments: 509.777.3259')),
            const ListTile(title: Text('Counseling Appointments: 509.777.3259')),
            const ListTile(title: Text('Molly Dewalt, Director, Counseling Services: 509.777.3259')),
            const ListTile(title: Text('Kristiana Holmes, Director, Health Center: 509.777.3259')),
            ListTile(leading: const Icon(Icons.link, color: Colors.blue, size: 30,),
                    title: const Text('www.whitworth.edu/health&counselingcenter'),
                    onTap: (){
                      launchLink('www.whitworth.edu/health&counselingcenter', isNewTab: true);
                    },
            ),
          ]
        ),
        const ExpansionTile(
          title: Text('Financial Difficulty'),
          children: <Widget>[
            ListTile(title: Text('Please refer to Whitworth website to locate your financial director')),
          ],
        ),
      ]
    );
  }
}