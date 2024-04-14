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

// Working Notes:
// Eli: a lot of this is similar to PiratePort, I feel like doing integration there would be good



// packages
import 'package:flutter/material.dart';

// files
import './profile.dart';

// main (comment for cleaner formatting)
void main() {
  runApp(const MainApp());
}

// main app for running/building
class MainApp extends StatelessWidget {
  const MainApp({Key? key}); // constructor; delegates to parent

  // widget builder
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // removes "DEBUG" banner from top left
      title: 'Student Companion', // title used to identify the app
      // default app themeing
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // creates main page
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeNav(title: 'Student Companion Main Page'),
        '/profile': (context) => const ProfileShell(),
      },
    );
  }
}

// Main home page; general workings of the app
class HomeNav extends StatefulWidget {
  const HomeNav({Key? key, required this.title}); // constructor; delegates to parent
  final String title; // title of the widget for Flutter's processing use

  // creates main widget body that requires state
  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  // idex for selected option in the bottom nav bar
  int _selectedIndex = 0;

  // list content widgets for each tab
  // TODO(any): fill with actual widgets
  static const List<Widget> _widgetOptions = <Widget>[
    Text('My Courses Page'),
    Text('Information Board Page'),
    Text('Calendar Page'),
    Text('ToDo List Page'),
  ];

  // when nav bar item is tapped, updates index & reloads page
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // actually builds widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // main top app bar title
        title: const Center(child: Text('Whitworth University')),
        actions: [
          IconButton(
            // action pressing button takes (notification tab)
            // TODO(any): add notification tab functionality
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            // action pressing button takes (account tab)
            // https://docs.flutter.dev/cookbook/navigation/named-routes
            // TODO(any): add account tab functionality
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Center(
        // displays appropriate widget option from list based on current index of bottom nav bar
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
        currentIndex: _selectedIndex, // update display based on current index
        selectedItemColor: Colors.blue, // Set the selected item color to blue
        unselectedItemColor: Colors.black, // Set the unselected item color to black
        onTap: _onItemTapped, // change current index
      ),
    );
  }
}
