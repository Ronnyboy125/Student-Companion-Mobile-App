CS375-1 APP1: Functional Specification & Schedule Document
===========================================================

# Instructions:
* Each group must edit this document to complete each of the Functional/Feature Specifications for their project.
* Note: This specification document should and  will change over the course of the project as you learn more through an iterative development process. 
* You may make changes to your feature list, rankings, etc. Your job is to keep this specification up to date for the life of the project! 
* Each time you make a change you must sync that change to the project Functional Specification sub folder and this document.

# Group Members:
Sophie, Megan, Nick

# Project Title 
Student Companion

# Project Mission/Vision

Aiding students through the college transition by easing the typical problems college students face including social life, academics, and time management. 

# Project Description

The "Student-Companion" Application is designed to streamline the academic and extracurricular activities of students within an educational institution. The application offers a centralized platform where students can manage their schedules, access course information, collaborate on school-wide events, and receive personalized recommendations to enhance their productivity and well-being.

All students activities will have the oppurtunity to be ranked by importance, and will show up as reminders for the students. The events will have detailed descriptions of what time they are, their location, and options to invite friends or add the event to the calendar in a way that fits their organizational choosing (potentially colors). Based on which events are frequently viewed and added to the calendar recomendations will be displayed visually, potentially starring activities that are recommended for the user. 

The hope of this app is to make everything visible in one place while also encompassing an easy to read, easy to use design. The app will include a three page bar system where you can easily move between tabs to find what you need. The tabs will include an announcment page where every event will be posted with ways to invite a friend, add to the calendar, and see if it is recommended. There will be a calendar page that will show the calendar in a view of the users choosing. (daily, weekly, monthly). Finally there will be a profile tab that keeps all the users information including username, year in school, interests, etc. There will be a tab in the upper corner of each page taking the user to their reminders that will be placed by importance. All of this will provide a design that is easy to use and familar to users as it is set up simialr to other apps they already use like Instagram. 


# Target Platforms
In this section, specify which mobile devices your application will  target (e.g. Android, iPad, iPhone, Web, Windows, Mac, etc...) and why you are targeting those devices.

- Android
- iPhone. 
Why: For portability and to make up for the lacking in functionality with mobile Pirate Port and Blackboard. We want to make it accessibility to the majority of the student population as well by making it available to both platforms. 

# Class Design

## List of Likely Classes and Plugins
- Widget Class: https://api.flutter.dev/flutter/widgets/widgets-library.html
- Enum Class: 
- Flutter Form Building Package: https://pub.dev/packages/flutter_form_builder
- Local Notifications: https://pub.dev/packages/flutter_local_notifications
- URL Launcher: https://pub.dev/packages/url_launcher
- Calendar Widget: 
  - https://pub.dev/packages/table_calendar
  - https://pub.dev/packages/syncfusion_flutter_calendar
  - https://pub.dev/packages/flutter_advanced_calendar
- Profile Picture Widget: https://pub.dev/packages/user_profile_avatar 
- Fonts: https://fonts.google.com/ 
- Alert Dialogues: https://pub.dev/packages/alert_dialog
- Post to Facebook: https://pub.dev/packages/post_to_facebook
- News Toolkit: https://github.com/flutter/news_toolkit

## Custom Classes 
Depending on your project, you may need to design custom class hierarchies to manage the data for your custom application. For example, in the example asteroids game there are class hierarchies for Ships, Bullets, etc.

It will take some research to determine what class hierarchies you can re-use from Flutter and what you will need to design from scratch. 

- Student
  - ID
  - Email
  - Name
  - Dorm
  - Other Information 
  - Add to To-Do List
  - Add to Calendar
  - Post to Discussion Board
  - Input information with classes and syllabi and integrate it to the calendar
- Recommendations
  - Notify User Based on their activity, to-do list, and calendar

## UML Diagrams
You must use UML diagrams to illustrate any of your group designed class hierarchies and you must include those diagrams in this section of this file.



# Ranked List of Proposed Features 
List all the features that you hope your app will have.
For each feature give it a short name (e.g. high score histories, splash page, settings menu, etc...)
For each feature write a short description of that feature.
For each feature give two rank values: necessity and difficulty.
Sort the list by necessity first and difficulty second. Thus the most necessary features that are the easiest to implement should be listed first, etc.

1. Account: 
   - 
2. Blackboard/Pirate Port Connectivity: 
   - The app will connect to the student's personal Blackboard and Pirate Port to access the courses they are in, what assignments they have due, and what is on their schedule. 
3. Courses: 
   - The app will take whatever courses the student is enrolled in and create different categories for each course. 
4. Calendar
   - The app will take what is in the student's BlackBoard and Pirate Port calendar and create two different calendars: a personal and public. The personal will only contain the students classes, meetings, clubs, etc. while the public will contain university-wide events. 
5. To-Do List & Reminders
   - The app will take what is put into BlackBoard and transfer it into a to-do list for the student. The student can then check things off and add new things that maybe aren't on BB. 
6. Forum/Bulletin Board
   - Students and Clubs can post about social events on this forum. Other students will be able to see when and where it's taking place and join in on the fun. 
7. Recommendations
   - The app will analyze your usage, calendar, and to-do list and determine study tips, i.e. "You should study [subject] for [number] hours".

# Proposed Schedule
Here you will put a proposed schedule of when you plan to complete each feature described in the previous section. You should have major milestones with dates as well in this schedule.

3/18 - Start Specifications and Flutter Libraries
3/22 - Finish Specifications, Give Rough Mock-Up of Main Pages
4/8 - Rough Mock-Up of all pages, Begin Prototyping
4/12 - Prototyping Finished
4/14 - Begin Coding Login Page, Research BB and PP connectivity
4/20 - finalize BB connectivity, begin parsing information into courses, calendar, and to-do
4/24 - Create forum
4/26 - Create recommendations alerts
4/30 - Finish up visual/UI design, bug fixing
5/3 - Beta Version Finished
5/8 - Final Version Finished
