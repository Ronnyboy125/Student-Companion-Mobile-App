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
        Event(
            child: const Text('LM4'),
            dateTime: CalendarDateTime(
                year: 2024,
                month: 04,
                day: 10,
                calendarType: CalendarType.GREGORIAN)),
        Event(
            child: const Text('Final Exam'),
            dateTime: CalendarDateTime(
                calendarType: CalendarType.GREGORIAN,
                year: 2024,
                month: 04,
                day: 29)),
        Event(
          child:const Text('Presentation Day'),
          dateTime: CalendarDateTime(
            calendarType: CalendarType.GREGORIAN,
            year: 2024,
            month: 04,
            day: 29))        
      ],
    );
  }
}
