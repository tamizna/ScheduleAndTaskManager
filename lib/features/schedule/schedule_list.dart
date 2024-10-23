import 'package:flutter/material.dart';
import 'package:task_manager/features/task/add_new_task.dart';
import 'package:task_manager/models/schedule.dart';

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
          title: Text('Schedule'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to the Home page
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddNewTaskPage()),
            );
          },
          backgroundColor: Colors.green.shade500,
          child: Icon(Icons.add, size: 30),
        ),
        body:
        ListView.builder(
          itemCount: dummySchedule.length,
          itemBuilder: (context, index) {
            return customListItem(dummySchedule[index]);
          },
        )
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