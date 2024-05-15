import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({Key? key}) : super(key: key);

  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class Course {
  String? name;
  String? details;

  Course({required String name, required String details}) {
    this.name = name;
    this.details = details;
  }
}

class _MyCoursesState extends State<MyCourses> {
  List<Course> courses = []; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _addCourseDialog(context);
            },
            child: const Icon(Icons.add),
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
                foregroundColor: MaterialStatePropertyAll(Colors.black)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(index.toString()),
                  onDismissed: (direction) {
                    setState(() {
                      courses.removeAt(index);
                    });
                  },
                  background: Container(color: Colors.red),
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Confirm"),
                          content: Text(
                              "Are you sure you wish to delete ${courses[index].name}?"),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text(
                                  "DELETE",
                                  style: TextStyle(color: Colors.blue),
                                )),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text(
                                "CANCEL",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 10, right: 10),
                    color: const Color.fromARGB(255, 198, 198, 198),
                    child: ListTile(
                      leading: FractionallySizedBox(
                        widthFactor: 0.4,
                        heightFactor: 1.6,
                        child: Image.asset('assets/book.jpg', fit: BoxFit.fill),
                      ),
                      contentPadding: EdgeInsets.all(10),
                      title: Text(courses[index].name!),
                      titleTextStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 18),
                      subtitle: Text(courses[index].details!),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // https://api.flutter.dev/flutter/material/AlertDialog-class.html
  // https://docs.flutter.dev/cookbook/forms/text-field-changes
  Future<void> _addCourseDialog(BuildContext context) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailsController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Course'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    labelText: 'Course Name',
                    hintStyle: TextStyle(color: Colors.blue, fontSize: 18)),
              ),
              TextField(
                controller: detailsController,
                decoration: const InputDecoration(
                    labelText: 'Course Details',
                    hintStyle: TextStyle(color: Colors.blue, fontSize: 18)),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  courses.add(
                    Course(
                      name: nameController.text,
                      details: detailsController.text,
                    ),
                  );
                });
                Navigator.of(context).pop();
              },
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(fontSize: 40, color: Colors.blue),
        );
      },
    );
  }
}
