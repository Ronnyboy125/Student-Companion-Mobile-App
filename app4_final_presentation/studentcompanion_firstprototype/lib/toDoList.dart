import 'package:flutter/material.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List<String> toDoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your To-Do List'),
      ),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final String item = toDoList.removeAt(oldIndex);
            toDoList.insert(newIndex, item);
          });
        },
        children: toDoList
            .asMap()
            .entries
            .map(
              (entry) => ToDoItem(
                key: Key(entry.key.toString()),
                text: entry.value,
                onDelete: () {
                  setState(() {
                    toDoList.removeAt(entry.key);
                  });
                },
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();

        return AlertDialog(
          title: Text("Add New Item"),
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
}

class ToDoItem extends StatelessWidget {
  final String text;
  final VoidCallback onDelete;

  const ToDoItem({
    Key? key,
    required this.text,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: key,
      leading: Icon(Icons.drag_handle),
      title: Text(text),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}
