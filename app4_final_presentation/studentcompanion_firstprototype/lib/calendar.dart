import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'event.dart';

//using the table calendar package within flutter.

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now(); //todays date selected everytime
  DateTime? _selectedDay; //other selected days
  Map<DateTime, List<Event>> events = {}; //allows multiple events per day
  late TextEditingController _userinput; //event title input by user
  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _userinput = TextEditingController();
    _selectedDay = today;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      _selectedDay = day;
      _selectedEvents.value = _getEventsForDay(day);
    });
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];//display event for that day
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: calendar(),
      floatingActionButton: FloatingActionButton( //plus button
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add Events", textAlign: TextAlign.center),
                content: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: _userinput),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      final newEvent = Event(_userinput.text);
                      events.putIfAbsent(_selectedDay!, () => []).add(newEvent);
                      Navigator.of(context).pop();
                      _selectedEvents.value = _getEventsForDay(_selectedDay!);
                      _userinput.clear();
                    },
                    child: const Text("Submit"),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget calendar() {
    return Column(
      children: [
        TableCalendar( //calendar widget
          locale: "en_US",
          focusedDay: today,
          firstDay: DateTime.utc(2012, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          availableGestures: AvailableGestures.all,
          onDaySelected: _onDaySelected,
          eventLoader: _getEventsForDay,
          selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarStyle: const CalendarStyle( //added to match our theme
          defaultTextStyle: TextStyle(color: Colors.blue), 
          weekendTextStyle: TextStyle(color: Colors.blue), 
          selectedTextStyle: TextStyle(color: Colors.white),
          todayTextStyle: TextStyle(color: Colors.blue), 
          outsideTextStyle: TextStyle(color: Colors.grey),
          outsideDaysVisible: false, 
          todayDecoration: BoxDecoration(
            color: Colors.black, 
            shape: BoxShape.circle, 
          ),
                    selectedDecoration: BoxDecoration(
            color: Colors.blue, 
            shape: BoxShape.circle, 
          ),
        ),
      ),
        Expanded(
          child: ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      onTap: () => print(""),
                      title: Text(value[index].title), //pulls the info from event.dart for the title event
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
