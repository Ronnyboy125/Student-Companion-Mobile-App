////////
// Purpose: file containing widgets for Calendar page
////////

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_event_calendar/flutter_event_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
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
    return EventCalendar(
      calendarType: CalendarType.GREGORIAN,
      calendarLanguage: 'en',
      events: [
        Event(
          child: const Text('Laravel Event'),
          dateTime: CalendarDateTime(
            year: 2024,
            month: 04,
            day: 19,
            calendarType: CalendarType.JALALI,
          ),
        ),
      ],
    );
  }
}
