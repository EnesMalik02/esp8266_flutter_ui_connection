// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:teknofest/pages/first_page.dart';
import 'package:teknofest/pages/real_time_data_page.dart';
import 'package:teknofest/pages/settings_page.dart';

class RealtimeDataPage extends StatefulWidget {
  const RealtimeDataPage({super.key});

  @override
  State<RealtimeDataPage> createState() => _RealtimeDataPageState();
}

class _RealtimeDataPageState extends State<RealtimeDataPage> {
   Map<String, dynamic>? data;

   @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref('test');
  DataSnapshot snapshot = await databaseRef.get();
  
  if (snapshot.exists) {
    final fetchedData = Map<String, dynamic>.from(snapshot.value as Map);
    setState(() {
      // Her bir anahtar için, eğer veri tek bir sayıysa, bu sayıyı liste içine koyun.
      Map<String, List<double>>data = {
        'distance': [fetchedData['distance']?.toDouble() ?? 0.0],
        'nem': [fetchedData['nem']?.toDouble() ?? 0.0],
        'sicaklik': [fetchedData['sicaklik']?.toDouble() ?? 0.0],
        
      };
    }
    
    );
  } else {
    print("No data available.");
  }
  
}




  @override
  Widget build(BuildContext context) {
    // Ekran boyutunu al
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    double horizontalPadding = width * 0.1;
    double verticalPadding = height * 0.1;

    return Scaffold(
      backgroundColor: Color.fromARGB(197, 224, 229, 232),
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 51, 67, 125),
      //   title: Text("Real Time Data Page"), 
      //   foregroundColor: Colors.white,
      // ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 51, 67, 125),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Icon(
                Icons.person_pin_circle_sharp,
                size: 48,
                
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home Page"),
              textColor: Colors.white,
              iconColor: Colors.white,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/firstpage');
              },
            ),
            ListTile(
              leading: Icon(Icons.signal_cellular_alt_sharp),
              title: Text("Real Time Datas"),
              textColor: Colors.white,
              iconColor: Colors.white,
              onTap: () {
                Navigator.pop(context);
                //Navigator.pushNamed(context, '/realtimedatapage');
              },
            ),
            ListTile(
              leading: Icon(Icons.timelapse),
              title: Text("Previous Datas Page"),
              textColor: Colors.white,
              iconColor: Colors.white,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/previousdatapage');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              textColor: Colors.white,
              iconColor: Colors.white,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settingspage');
              },
            ),
           
         
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 65),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLineChartContainer(width, "Sıcaklık",(data!=null ? data!['sicaklik']:null)),
                _buildLineChartContainer(width, "Nem",(data!=null ? data!['nem']:null)),
              ],
            ),
            SizedBox(height: 65),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBarChartContainer(width, "Basınç"),
                _buildBarChartContainer(width, "Eğim"),
              ],
            ),
          ],
        ),
      ),
      
    );
  }

  Widget _buildLineChartContainer(double width, String text, List<double> data) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          height: 300,
          width: width * 0.45,
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(spots: [
                  FlSpot(0, data != null ? data[0].toDouble() : 0),
                  FlSpot(1, data != null ? data[1].toDouble() : 0),
                  FlSpot(2, data != null ? data[2].toDouble() : 0),
                  FlSpot(3, data != null ? data[3].toDouble() : 0),
                ])
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
 

  Widget _buildBarChartContainer(double width, String text) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          height: 300,
          width: width * 0.45,
          child: BarChart(
            BarChartData(
              borderData: FlBorderData(show: false),
              barGroups: [
                BarChartGroupData(x: 0, barRods: [
                  BarChartRodData(toY: 8, color: Colors.lightBlue)
                ]),
                BarChartGroupData(x: 1, barRods: [
                  BarChartRodData(toY: 10, color: Colors.lightBlue)
                ]),
                BarChartGroupData(x: 2, barRods: [
                  BarChartRodData(toY: 14, color: Colors.lightBlue)
                ]),
                BarChartGroupData(x: 3, barRods: [
                  BarChartRodData(toY: 15, color: Colors.lightBlue)
                ]),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
