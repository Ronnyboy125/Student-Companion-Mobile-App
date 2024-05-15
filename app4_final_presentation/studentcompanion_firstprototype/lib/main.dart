import 'package:flutter/material.dart'; // general helpful material components for flutter
// ignore: unused_import
import 'package:table_calendar/table_calendar.dart'; // Import table_calendar package
import 'package:profile_photo/profile_photo.dart'; // package used for handling a clickable profile photo
import 'package:safe_local_storage/safe_local_storage.dart'; // copied from https://pub.dev/packages/safe_local_storage

import './profile.dart'; 
import './InfoBoard.dart';
import './MyCourses.dart';
import './calendar.dart'; 
import './toDoList.dart'; 
import 'resources.dart';

final storage = SafeLocalStorage('storage_test.json');

void main() {
  runApp(const MainApp());
}
NetworkImage _userPhoto = const NetworkImage(
    'https://images.unsplash.com/photo-1602466439270-97a39a1496a4?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFiaXR8ZW58MHx8MHx8fDA%3D');

Map<String, dynamic> user_info = { //future implementation
  "username": "username",
  "email": "email",
  "phone": "phone",
  "interests": "interests",
};

// function to handle storing data in a file for multiple uses
InWidgetStorageWrite(String username, String email, String phone,
    String interests, Map<String, dynamic> info) async {
  // writes to storage
  storage.write({
    "username": username,
    "email": email,
    "phone": phone,
    "interests": interests,
  });
  return info = await storage.read();
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // removes "DEBUG" banner from top right of app
      title: 'Student Companion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.blue, //bottom navigation color change
      ),
      initialRoute: '/', 
      routes: {
        '/': (context) => const HomeNav(title: 'Student Companion Main Page'), 
        '/profile': (context) => ProfileShell(_userPhoto, user_info), 
        '/resources': (context) => ResourceScreen(),

      },
    );
  }
}

class HomeNav extends StatefulWidget {
  const HomeNav({Key? key, required this.title});

  final String title;

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _selectedIndex = 0; // Index for selected option in the bottom nav bar


  // ignore: unused_field
  static final List<Widget> _widgetOptions = <Widget>[
    const MyCourses(),

    const InfoBoard(),

    const Calendar(),

    const ToDoListPage(),
  ];

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:
            const Center(child: Text('Student Companion Prototype')),
        actions: [
          IconButton(
            onPressed: () =>Navigator.pushNamedAndRemoveUntil(context, '/resources', (r) => false),
            icon: const Icon(Icons.help_outline_rounded), 
          ),
          ProfilePhoto(
              totalWidth: 31, 
              cornerRadius: 20, 
              color: Colors.black, 
              image: _userPhoto,
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              }),
          const Padding(
              padding: EdgeInsets.all(
                  10)),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const <Widget>[
          MyCourses(),
          InfoBoard(),
          Calendar(),
          ToDoListPage(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book), 
            label: 'My Courses', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info), 
            label: 'Information Board', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today), 
            label: 'Calendar', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box), 
            label: 'ToDo List', 
          ),
        ],
        currentIndex: _selectedIndex, 
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped, 
      ),
    );
  }
}