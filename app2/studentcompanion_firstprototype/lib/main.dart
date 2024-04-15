// /////////////////////////////////////////////////////////////////
// Project/File Comment
//
// Name: Student Companion App
// Purpose: An app meant to help college students organize the multiple types of events/activities/assignments of college life
// App2 Creators: Ethan Wagner, Kiernan Martin, Eli Chapman
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
// 07 | https://api.flutter.dev/flutter/material/ListTile-class.html| ListTile class for displaying events on Info Board page
// 08 | https://api.flutter.dev/flutter/widgets/Column-class.html   | MyCourses and InfoBoard
// 09 | https://docs.flutter.dev/ui/assets/assets-and-images        | Help with using image assets
// 10 | https://stackoverflow.com/questions/53824755/flutter-dart-how-to-access-a-single-entry-in-a-map-object | help with maps
// 11 | https://pub.dev/packages/safe_local_storage                 | used for local storage
// 12 | https://stackoverflow.com/questions/65458903/socketexception-connection-failed-os-error-operation-not-permitted-errno-1 | used for figuring out how to give runner files appropriate permissions on devices
//
// /////////////////////////////////////////////////////////////////

// TODO: change app icon & title in runners

// packages
import 'package:flutter/material.dart'; // general helpful material components for flutter
import 'package:table_calendar/table_calendar.dart'; // Import table_calendar package
import 'package:profile_photo/profile_photo.dart'; // package used for handling a clickable profile photo
//import 'package:json_cache/json_cache.dart'; // copied from https://pub.dev/packages/json_cache/install; unused
import 'package:safe_local_storage/safe_local_storage.dart'; // copied from https://pub.dev/packages/safe_local_storage

// files
import './profile.dart'; // profile widget
import './InfoBoard.dart'; // import custom class
import './MyCourses.dart'; // import custom class

// TODO(any): create better storage practices
// TODO(any): confirm storage works on all devices
// sets storage location for user data
// this should be changed to be more clean, potentially iterative based on user's login credentials
// also network storage should be looked at (for safety and effecientcy)
final storage = SafeLocalStorage('storage_test.json');

// main (comment for cleaner/consistent formatting)
void main() {
  runApp(const MainApp());
}

// this is curently where the user's photo is, this should be changed to be safer/more effective
// TODO(any): have better pfp storage integration
// TODO(any): handle photo formatting
NetworkImage _userPhoto = const NetworkImage('https://images.unsplash.com/photo-1602466439270-97a39a1496a4?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFiaXR8ZW58MHx8MHx8fDA%3D');
// alt images for testing
//NetworkImage _userPhoto = const NetworkImage('https://images.unsplash.com/photo-1712928247899-2932f4c7dea3?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
//NetworkImage _userPhoto = const NetworkImage('https://images.unsplash.com/photo-1712928244444444444447899-2932f4c7dea3?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');

// TODO(any): load user info from file
// TODO(any): handle user info non-publically
// sets user_info to defaults to avoid some null errors, should probably be dealt with more cleanly,
// and these should be loaded from a saved file, as opposed to just saving to file
// Map of user info to be locally saved
Map<String, dynamic> user_info = {
  "username" : "username",
  "email" : "email",
  "phone" : "phone",
  "interests" : "interests",
};

// function to handle storing data in a file for multiple uses
InWidgetStorageWrite(String username, String email, String phone, String interests, Map<String, dynamic> info) async {
  // writes to storage
  storage.write (
    {
      "username" : username,
      "email" : email,
      "phone" : phone,
      "interests" : interests,
    }
  );
  // returns modified map to be copied over original
  return info = await storage.read();
}

// MainApp widget
class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context){
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
        '/profile': (context) => ProfileShell(_userPhoto, user_info), // profile route
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

    // Info on courses(similar to blackboard info)
    MyCourses(),

    ///////
    //School Events
    //Club Events
    //Personal Events
    ///////
    InfoBoard(),

    // Calendar page with TableCalendar widget
    TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1), // Set the first selectable day
      lastDay: DateTime.utc(2030, 12, 31), // Set the last selectable day
      focusedDay: DateTime.now(), // Set the initially focused day
    ),

    // TODO(any): implement ToDo List page
    // Placeholder for ToDo List page
    Text('ToDo List Page'),
  ];

  // Function to handle when a bottom nav bar item is tapped
  void _onItemTapped(int index) async {
    // TODO(any): create specific function/widget for handling profile information updating
    // currently this just updates user info to test when a button is pushed, 
    // in future this should most likely be in its own stateful widget
    // TODO(any): get this working on all devices
    // currently this works on my mac, but not my iphone, b/c of security permissions. uncomment to test/fix
    // user_info = 
    //   await InWidgetStorageWrite(
    //     "test",
    //     "test",
    //     "test",
    //     "test",
    //     user_info
    //   ); 
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