// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:teknofest/pages/first_page.dart';
import 'package:teknofest/pages/real_time_data_page.dart';
import 'package:teknofest/pages/settings_page.dart';
import 'package:teknofest/pages/counter_page.dart';
import 'package:teknofest/pages/todo_page.dart';


class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    // Ekran boyutunu al
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    // Ekran boyutunun bir yüzdesini kullanarak padding hesapla
    double horizontalPadding = width * 0.1; // Ekran genişliğinin %10'u
    double verticalPadding = height * 0.1; // Ekran yüksekliğinin %10'u

    return Scaffold(
      backgroundColor: Color.fromARGB(197, 142, 164, 175),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 51, 67, 125),
        title: Text("New Testing Page"),
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Icon(
                Icons.favorite,
                size:48,
                ),
              ),
              ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home Page"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/firstpage');
                  },
              ),
               ListTile(
                  leading: Icon(Icons.keyboard_option_key_outlined),
                  title: Text("Real Time Datas"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/realtimedatapage');
                  },
              ),
               ListTile(
                  leading: Icon(Icons.timelapse),
                  title: Text("Previous Datas Page"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/previousdatapage');
                  },
              ),
               ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/settingspage');
                  },
                  
              ),
              ListTile(
                  leading: Icon(Icons.countertops),
                  title: Text("Counter Page"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/counterpage');
                  },
                  
              ),
                ListTile(
                  leading: Icon(Icons.folder),
                  title: Text("New Page"),
                  onTap: () {
                    Navigator.pop(context);
                    //Navigator.pushNamed(context, '/newpage');
                  },
                  
              ),
              
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // İlk satırda iki grafik
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLineChartContainer(width),
                _buildLineChartContainer(width),
              ],
            ),
            // İkinci satırda iki grafik
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBarChartContainer(width),
                _buildBarChartContainer(width), // Örneğinizi takip ederek ikinci bir bar chart ekledim.
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLineChartContainer(double width) {
    return Container(
      padding: EdgeInsets.all(10),
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
    );
  }

  Widget _buildBarChartContainer(double width) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 300,
      width: width * 0.45,
      child: BarChart(
        BarChartData(
          borderData: FlBorderData(show: false),
          barGroups: [
            BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 8, color: Colors.lightBlue)]),
            BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 10, color: Colors.lightBlue)]),
            BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 14, color: Colors.lightBlue)]),
            BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 15, color: Colors.lightBlue)]),
          ],
        ),
      ),
    );
  }
}