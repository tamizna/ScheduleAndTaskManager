import 'package:flutter/material.dart';
import 'package:task_manager/const/app_color.dart';
import 'package:task_manager/features/schedule/schedule_list.dart';
import 'package:task_manager/features/task/add_new_task.dart';
import 'package:task_manager/models/schedule.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkPrimaryColor,
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First Image Button
            GestureDetector(
              onTap: () {
                print('First button pressed');
                // Navigate to schedule list page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ScheduleListPage()),
                );
              },
              child: Image.asset(
                'images/ic_schedule.png',
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(height: 20),

            // Second Image Button
            GestureDetector(
              onTap: () {
                print('Second button pressed');
              },
              child: Image.asset(
                'images/ic_task.png',
                width: 150,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkPrimaryColor,
        title: Text('Dashboard'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            // Profile Info Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    // Profile picture
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('images/ic_profile.png'),
                    ),
                    SizedBox(width: 20),
                    // User name and email
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Maya',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'maya@gmail.com',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Grid of Options
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    buildOptionCard(
                      icon: Icons.visibility,
                      title: 'View preference',
                      color: Colors.purple[100],
                      onTap: () {

                      }
                    ),
                    buildOptionCard(
                      icon: Icons.download,
                      title: 'Download options',
                      color: Colors.blue[100],
                        onTap: () {

                        }
                    ),
                    buildOptionCard(
                      icon: Icons.play_circle_fill,
                      title: 'Playback options',
                      color: Colors.pink[100],
                        onTap: () {

                        }
                    ),
                    buildOptionCard(
                      icon: Icons.settings,
                      title: 'General option',
                      color: Colors.purple[200],
                        onTap: () {

                        }
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build option cards
  Widget buildOptionCard({
    required IconData icon,
    required String title,
    required Color? color,
    required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child:  Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular icon container
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 30,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 10),
            // Text below icon
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
