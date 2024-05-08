import 'package:flutter/material.dart';
import 'package:studentcompanion/main.dart';
import 'package:table_calendar/table_calendar.dart';
import 'event.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> events = {};
  late TextEditingController _userinput;
  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _userinput = TextEditingController();
    _selectedDay = today;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    if (isSameDay(_selectedDay, today)) {
      setState(() {
        today = day;
        _selectedDay = today;
        _selectedEvents.value = _getEventsForDay(today);
      });
    }
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: calendar(),
      floatingActionButton: FloatingActionButton(
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
                        events.addAll({
                          _selectedDay!: [Event(_userinput.text)]
                        });
                        storage.write(Event(_userinput.text));
                        Navigator.of(context).pop(); //storing the event
                        _selectedEvents.value = _getEventsForDay(_selectedDay!);
                        _userinput.clear();
                      },
                      child: const Text("Submit"))
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
        TableCalendar(
          locale: "en_US",
          focusedDay: today,
          firstDay: DateTime.utc(2012, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          headerStyle: const HeaderStyle(
              formatButtonVisible: false, titleCentered: true),
          availableGestures: AvailableGestures.all,
          onDaySelected: _onDaySelected,
          eventLoader: _getEventsForDay,
          selectedDayPredicate: (day) => isSameDay(day, today),
          startingDayOfWeek: StartingDayOfWeek.monday,
        ),
        // You can add your event list or other widgets here
        Expanded(
          child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                              onTap: () => print(""),
                              title: Text(
                                value[index].title,
                              )));
                    });
              }),
        )
      ],
    );
  }
}
