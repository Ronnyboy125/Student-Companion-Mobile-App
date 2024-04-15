////////
// Purpose: file containing widgets for Calendar page
////////

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime _today; // Variable to store the current date
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
    return TableCalendar(
      // Set the first selectable day for the calendar
      firstDay: DateTime.utc(2020, 1, 1),
      // Set the last selectable day for the calendar
      lastDay: DateTime.utc(2030, 12, 31),
      // Set the initially focused day for the calendar
      focusedDay: _today,
      // Function to load events for each day in the calendar
      eventLoader: (day) {
        // Check if the day is a week from now
        if (day.day == _aWeekFromNow.day &&
            day.month == _aWeekFromNow.month &&
            day.year == _aWeekFromNow.year) {
          // Return a list with an event for that day
          return ['Event on this day'];
        }
        // Return an empty list if no event for this day
        return [];
      },
    );
  }
}
