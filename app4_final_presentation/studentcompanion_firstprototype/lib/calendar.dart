// Purpose: file containing widgets for Calendar page
// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';


class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Map <DateTime, List <Event>> events = {};
  late DateTime _today; // Variable to store the current date
  // ignore: unused_field
  late DateTime _aWeekFromNow; // Variable to store the date a week from now

  @override
  void initState() {
    super.initState();
    // Initialize the current date
    _today = DateTime.now();
    // Initialize the date a week from now
    _aWeekFromNow = _today.add(const Duration(days: 7));
  }

  @override
  Widget build(BuildContext context) {
    return 
    EventCalendar(
      headerOptions: HeaderOptions(weekDayStringType: WeekDayStringTypes.SHORT),
      calendarType: CalendarType.GREGORIAN,
      calendarLanguage: 'en',
      
      events: [
        Event(
          child: const Text('App2'),
          dateTime: CalendarDateTime(
            year: 2024,
            month: 04,
            day: 19,
            calendarType: CalendarType.GREGORIAN,
          ),
        ),
      ],
    );
  }
}

/*

void addEvent() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();

        return AlertDialog(
          title: Text("Add a new event: "),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Enter item"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  setState(() {
                    toDoList.add(controller.text);
                  });
                  controller.clear();
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                controller.clear();
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
*/