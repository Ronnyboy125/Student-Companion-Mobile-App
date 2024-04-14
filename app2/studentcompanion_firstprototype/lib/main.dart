// /////////////////////////////////////////////////////////////////
// Project/File Comment
//
// Name: Student Companion App
// Purpose <WIP>
// Creators: Ethan Wagner, Kiernan Martin, Eli Chapman
// Colaborators: Dr. P. Tucker
// 
// Sources:
// #  | Link                                                        | description of use
// == | =========================================================== |=====================
// 01 | https://docs.flutter.dev/cookbook/navigation/named-routes   | for creating simple account/notification tabs
// 02 | https://pub.dev/packages/user_profile_avatar/example        | for work on creating a working user icon
//
// /////////////////////////////////////////////////////////////////

// Working Notes:
// Eli: a lot of this is similar to PiratePort, I feel like doing integration there would be good



// packages
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart'; // Import table_calendar package

// files
import './profile.dart';

// main (comment for cleaner/consistent formatting)
void main() {
  runApp(const MainApp());
}

// MainApp widget
class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Companion',
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

// HomeNav widget
class HomeNav extends StatefulWidget {
  const HomeNav({Key? key, required this.title});

  final String title;

  @override
  State<HomeNav> createState() => _HomeNavState();
}

// HomeNav state
class _HomeNavState extends State<HomeNav> {
  int _selectedIndex = 0; // Index for selected option in the bottom nav bar

  // List of content widgets for each tab
  static final List<Widget> _widgetOptions = <Widget>[
    // Placeholder for My Courses page
    Text('My Courses Page'),

    // Placeholder for Information Board page
    Text('Information Board Page'),

    // Calendar page with TableCalendar widget
    TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1), // Set the first selectable day
      lastDay: DateTime.utc(2030, 12, 31), // Set the last selectable day
      focusedDay: DateTime.now(), // Set the initially focused day
    ),

    // Placeholder for ToDo List page
    Text('ToDo List Page'),
  ];

  // Function to handle when a bottom nav bar item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Whitworth University')), // App bar title
        actions: [
          IconButton(
            // TODO(any): add notifications tab functionality
            onPressed: () {}, // Functionality for notifications button
            icon: const Icon(Icons.notifications), // Notifications icon
          ),
          IconButton(
            // action pressing button takes (account tab)
            // TODO(any): add account tab functionality
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), // Display the selected widget based on the index
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book), // Icon for My Courses page
            label: 'My Courses', // Label for My Courses page
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info), // Icon for Information Board page
            label: 'Information Board', // Label for Information Board page
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today), // Icon for Calendar page
            label: 'Calendar', // Label for Calendar page
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box), // Icon for ToDo List page
            label: 'ToDo List', // Label for ToDo List page
          ),
        ],
        currentIndex: _selectedIndex, // Current index for the selected item
        selectedItemColor: Colors.blue, // Color for the selected item
        unselectedItemColor: Colors.black, // Color for unselected items
        onTap: _onItemTapped, // Function to handle when an item is tapped
      ),
    );
  }
}