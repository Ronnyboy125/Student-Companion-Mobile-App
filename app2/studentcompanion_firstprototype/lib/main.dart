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
// 03 | https://stackoverflow.com/questions/76789221/how-to-add-padding-to-the-leading-and-action-icons-on-the-appbar | used to remeber padding, help with user icon spacing
// 04 | https://docs.flutter.dev/ui/assets/assets-and-images        | used for remembering how images work
// 05 | https://pub.dev/packages/profile_photo                      | package for handling profile photo
// 06 | https://pub.dev/packages/user_profile_avatar/example        | used code for handling super delegation
//
// /////////////////////////////////////////////////////////////////

// Working Notes:
// Eli: a lot of this is similar to PiratePort, I feel like doing integration there would be good



// packages
import 'package:flutter/material.dart'; // general helpful material components for flutter
import 'package:table_calendar/table_calendar.dart'; // Import table_calendar package
import 'package:profile_photo/profile_photo.dart'; // package used for handling a clickable profile photo
//import 'package:json_cache/json_cache.dart'; // copied from https://pub.dev/packages/json_cache/install
import 'package:safe_local_storage/safe_local_storage.dart'; // copied from https://pub.dev/packages/safe_local_storage

// files
import './profile.dart'; // profile widget

// attempted storage below, due to security clearnace couldnt get it working
// // sets storage location for user data
// // currently this is set to a SPECIFIC place on my SPECIFC mac -- should be changed in future
// final storage = SafeLocalStorage('storage_test.json');

// main (comment for cleaner/consistent formatting)
void main() {
  runApp(const MainApp());
}

// this is curently where the user's photo is, this should be changed to be safer/more effective
// TODO(any): have better pfp integration
// TODO(any): handle photo formatting
//NetworkImage _userPhoto = const NetworkImage('https://images.unsplash.com/photo-1602466439270-97a39a1496a4?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFiaXR8ZW58MHx8MHx8fDA%3D');
// alt images for testing
NetworkImage _userPhoto = const NetworkImage('https://images.unsplash.com/photo-1712928247899-2932f4c7dea3?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
//NetworkImage _userPhoto = const NetworkImage('https://images.unsplash.com/photo-1712928244444444444447899-2932f4c7dea3?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');

// MainApp widget
class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    
    // attempted storage below, due to security clearnace couldnt get it working
    // // edited runner files to give permission https://stackoverflow.com/questions/65458903/socketexception-connection-failed-os-error-operation-not-permitted-errno-1
    // // writes to storage
    // storage.write (
    //   {
    //     "egg" : "burg"
    //   }
    // );
    
    return MaterialApp(
      debugShowCheckedModeBanner: false, // removes "DEBUG" banner from top right of app
      title: 'Student Companion',
      // overarching data for the theme of the application
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // creates main page
      // due to the simplicity of the nature of pages of this application, routes was chosen to be used 
      // (as opposed to a more complex navigator)
      routes: {
        '/': (context) => const HomeNav(title: 'Student Companion Main Page'), // homepage route
        '/profile': (context) => ProfileShell(_userPhoto), // profile route
      },
    );
  }
}

// HomeNav widget; holds most of the main functionality of the app
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
          // action pressing button takes (account tab)
          // TODO(any): add account tab functionality
          ProfilePhoto(
              totalWidth: 31, // sets diameter
              cornerRadius: 20, // sets how curved the corners are
              color: Colors.black, // color to show if no image
              image: _userPhoto, // sets image to display
              // sets what to do on tap, switched to profile page
              onTap: () {
                  Navigator.pushNamed(context, '/profile'); 
                }
            ),
          const Padding(padding: EdgeInsets.all(10)), // provides padding so profile photo is not on edge of screen
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