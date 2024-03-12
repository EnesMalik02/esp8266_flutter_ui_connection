// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:teknofest/pages/first_page.dart';
import 'package:teknofest/pages/real_time_data_page.dart';
import 'package:teknofest/pages/settings_page.dart';

class PreviousDataPage extends StatefulWidget {
  const PreviousDataPage({super.key});

  @override
  State<PreviousDataPage> createState() => _PreviousDataPage();
}

class _PreviousDataPage extends State<PreviousDataPage> {
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
      //   title: Text("Previous Datas"),
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
                color: Colors.white,
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
                Navigator.pushNamed(context, '/realtimedatapage');
              },
            ),
            ListTile(
              leading: Icon(Icons.timelapse),
              title: Text("Previous Datas Page"),
              textColor: Colors.white,
                  iconColor: Colors.white,
              onTap: () {
                Navigator.pop(context);
                //Navigator.pushNamed(context, '/previousdatapage');
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
                _buildLineChartContainer(width, "Sıcaklık"),
                _buildLineChartContainer(width, "Nem"),
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

  Widget _buildLineChartContainer(double width, String text) {
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
                  FlSpot(0, 1),
                  FlSpot(1, 3),
                  FlSpot(2, 10),
                  FlSpot(3, 7),
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
                  BarChartRodData(toY: 20, color: Colors.lightBlue)
                ]),
                //BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 10, color: Colors.lightBlue)]),
                //BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 14, color: Colors.lightBlue)]),
                //BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 15, color: Colors.lightBlue)]),
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
