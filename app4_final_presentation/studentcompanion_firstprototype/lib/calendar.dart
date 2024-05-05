import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: calendar(),
    );}
      Widget calendar(){
        return Column(
        children: [
          TableCalendar(
            locale: "en_US",
            focusedDay: today,
            firstDay: DateTime.utc(2012, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            headerStyle: const HeaderStyle(formatButtonVisible: false),
            // onDaySelected: (selectedDay, focusedDay) {
            //   setState(() {
            //     _selectedDay = selectedDay;
            //   });
            // },
          ),
          // You can add your event list or other widgets here
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