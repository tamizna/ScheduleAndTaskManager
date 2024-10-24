import 'package:flutter/material.dart';
import 'package:task_manager/const/app_color.dart';
import 'package:task_manager/models/schedule.dart';

import 'add_new_course.dart';

class ScheduleListPage extends StatefulWidget {
  const ScheduleListPage({super.key});

  @override
  State<ScheduleListPage> createState() => _ScheduleListPageState();
}

class _ScheduleListPageState extends State<ScheduleListPage> {
  List<Schedule> dummySchedule = [
    Schedule(namaMatkul: 'Pemrograman Dasar', hari: 'Senin', jamMulai: '09.00', jamSelesai: '10.30', kelas: 'A', ruang: 'E535', dosen: 'Tukiyem'),
    Schedule(namaMatkul: 'Pemrograman Lanjut', hari: 'Senin', jamMulai: '09.00', jamSelesai: '10.30', kelas: 'A', ruang: 'E535', dosen: 'Tukiyem'),
    Schedule(namaMatkul: 'Pemrograman Mahir', hari: 'Selasa', jamMulai: '09.00', jamSelesai: '10.30', kelas: 'A', ruang: 'E535', dosen: 'Suminem'),
    Schedule(namaMatkul: 'Struktur Data', hari: 'Rabu', jamMulai: '09.00', jamSelesai: '10.30', kelas: 'A', ruang: 'E535', dosen: 'Tukiyem'),
    Schedule(namaMatkul: 'Pemrograman Dasar', hari: 'Kamis', jamMulai: '09.00', jamSelesai: '10.30', kelas: 'A', ruang: 'E535', dosen: 'Suminem'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: darkPrimaryColor,
          title: Text('Schedule'),
        ),
        backgroundColor: whiteColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to the Home page
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddNewCoursePage()),
            );
          },
          backgroundColor: Colors.green.shade500,
          child: Icon(Icons.add, size: 30),
        ),
        body:
        ListView.builder(
          itemCount: dummySchedule.length,
          itemBuilder: (context, index) {
            return buildScheduleCard(dummySchedule[index]);
          },
        )
    );
  }


  Widget buildScheduleCard(Schedule item) {
    return Card(
      color: backgroundColor, // Dark card background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subject Name
            Text(
              item.namaMatkul,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: primaryTextColor,
              ),
            ),
            SizedBox(height: 8),
            // Time, Class, Room Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Time and Class
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${item.hari}, ${item.jamMulai} - ${item.jamSelesai}',
                      style: TextStyle(
                        fontSize: 14,
                        color: secondaryTextColor,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Kelas: ${item.kelas}',
                      style: TextStyle(
                        fontSize: 14,
                        color: secondaryTextColor,
                      ),
                    ),
                  ],
                ),
                // Room Icon and Room Number
                Row(
                  children: [
                    Icon(
                      Icons.room_rounded,
                      color: accentColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      item.ruang,
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            // Professor Name
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: darkPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  item.dosen,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // This function defines the custom layout for each list item.
  Widget customListItem(Schedule item) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            // Custom leading icon or image
            /*CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue[(index % 9 + 1) * 100],
              child: Text(
                item[5], // Display the last digit of the "Item" text
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),*/

            // Task icon
            imageTask(),

            SizedBox(width: 15),
            // Main content of the list item
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.namaMatkul,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    //  'Description for $item',
                    item.dosen,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            // Trailing widget (e.g., an icon button)
           /* IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                // TODO: Navigate to detail matkul page
                print('Tapped on ${item.namaMatkul}');
              },
            ),*/


          ],
        ),
      ),
    );
  }

  Widget imageTask() {
    return Container(
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('images/notes.png'), fit: BoxFit.cover),
      ),
    );
  }


}