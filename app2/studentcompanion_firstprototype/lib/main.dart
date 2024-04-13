// /////////////////////////////////////////////////////////////////
// Project/File Comment
//
// Name: Student Companion App
// Purpose <WIP>
// Creators: Ethan Wagner, Kiernan Martin, Eli Chapman
// Colaborators: Dr. P. Tucker
// 
// Sources: <WIP>
//
// /////////////////////////////////////////////////////////////////

// packages
import 'package:flutter/material.dart';

// main (comment for cleaner formatting)
void main() {
  runApp(const MainApp());
}

// main app for running/building/navigating
class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // removes "DEBUG" banner from top left - Eli
      title: 'Whitworth University',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeNav(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomeNav extends StatefulWidget {
  const HomeNav({Key? key, required this.title});

  final String title;

  @override
  State<HomeNav> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeNav> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('My Courses Page'),
    Text('Information Board Page'),
    Text('Calendar Page'),
    Text('ToDo List Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Whitworth University')),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        selectedItemColor: Colors.blue, // Set the selected item color to blue
        unselectedItemColor: Colors.black, // Set the unselected item color to black
        onTap: _onItemTapped,
      ),
    );
  }
}
