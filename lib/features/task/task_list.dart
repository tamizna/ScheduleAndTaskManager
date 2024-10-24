import 'package:flutter/material.dart';

import 'add_new_task.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  // Dummy list of tasks
  List<Map<String, String>> tasks = [
    {"title": "Task 1", "dueDate": "Tue, 23 10:00pm"},
    {"title": "Task 2", "dueDate": "Wed, 24 8:45am"},
    {"title": "Task 3", "dueDate": "Fri, 26 12:00pm"},
    {"title": "Task 4", "dueDate": "Sun, 27 10:00am"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tasks',
          style: TextStyle(
            color: Colors.brown[900], // Match the brown color in your UI
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.filter_alt_rounded, color: Colors.brown[900]),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tasks[index]["title"]!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Due: ${tasks[index]["dueDate"]}',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.brown[900]),
                        onPressed: () {
                          // Edit task logic here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddNewTaskPage(isEditTask: true,)),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.brown[900]),
                        onPressed: () {
                          // Delete task logic here
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddNewTaskPage(isEditTask: false,)),
          );
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.add, size: 30),
      ),
    );
  }
}