import 'package:flutter/material.dart';
import 'package:task_manager/const/app_color.dart';

class AddNewCoursePage extends StatefulWidget {
  const AddNewCoursePage({super.key});

  @override
  State<AddNewCoursePage> createState() => _AddNewCoursePageState();
}

class _AddNewCoursePageState extends State<AddNewCoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: darkPrimaryColor,
          title: Text('Add New Course'),
        )
    );
  }
}