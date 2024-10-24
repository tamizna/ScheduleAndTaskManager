import 'package:flutter/material.dart';
import 'package:task_manager/const/app_color.dart';

class AddNewCoursePage extends StatefulWidget {
  const AddNewCoursePage({super.key});

  @override
  State<AddNewCoursePage> createState() => _AddNewCoursePageState();
}

class _AddNewCoursePageState extends State<AddNewCoursePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController courseNameController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController lecturerController = TextEditingController();

  TimeOfDay _selectedTime = TimeOfDay.now(); // Default to current time

  // Function to show the time picker
  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime, // Set the initial time to the current time
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked; // Update the selected time
      });
    }
  }

  // Function to show the time picker
  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime, // Set the initial time to the current time
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked; // Update the selected time
      });
    }
  }

  String dropdownValue = 'Senin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkPrimaryColor,
        title: Text('Add New Course'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: whiteColor,
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: courseNameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Course Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter course name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Row(
                    children: [
                      Text('Day :'),
                      SizedBox(width: 20),
                      spinnerDay()
                    ],
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: datePicker(isStartTime: true)
                ),
                Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: datePicker(isStartTime: false)
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: classController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Class"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter class';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: roomController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Room"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter room number';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: lecturerController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Lecturer"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter lecturer';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Success & Navigate back to schedule list page
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please fill input')),
                          );
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget spinnerDay() {
    return DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_drop_down_rounded),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
            },
          items: <String>['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat']
              .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
        ));
  }

  Widget datePicker({
    required bool isStartTime}) {
    String dropdownValue;
    if(isStartTime) {
      dropdownValue = 'Start Time';
    } else {
      dropdownValue = 'End Time';
    }

    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(
        "$dropdownValue :   ${_selectedTime.format(context)}",
        // Show the selected time
        style: TextStyle(fontSize: 14),
      ),
      SizedBox(width: 20),
      ElevatedButton(
        onPressed: () => {
        if (isStartTime) {
        _selectStartTime(context)
        } else {
          _selectEndTime(context)
        }
        },
        // Show time picker on button press
        child: Text('Pick Time'),
      ),
    ]);
  }
}
