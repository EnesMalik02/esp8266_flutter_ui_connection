// ignore_for_file: prefer_const_constructors, sort_child_properties_last

// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
// import 'package:teknofest/dataBase/firebase.dart';

//import 'pages/dataVisulationPage.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// Replace with your data
final List<FlSpot> sampleData = [
  FlSpot(1, 3),
  FlSpot(2, 4),
  FlSpot(3, 3.5),
  FlSpot(4, 5),
  FlSpot(5, 4.5),
];

LineChart buildLineChart() {
  return LineChart(
    LineChartData(
      backgroundColor: Colors.transparent,
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: true,
        horizontalInterval: 1, // istediğiniz aralığı ayarlayabilirsiniz
        verticalInterval: 1, // istediğiniz aralığı ayarlayabilirsiniz
        checkToShowHorizontalLine: (value) => true,
        checkToShowVerticalLine: (value) => true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey[300],
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.grey[300],
            strokeWidth: 1,
          );
        },
      ),
      minX: 0,
      maxX: 5,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: sampleData, // Replace with your data
          isCurved: true,
          color: Colors.blue,
          barWidth: 2,
        ),
      ],
    ),
  );
}

int _selectedIndex = 0;

class _MyAppState extends State<MyApp> {
  String butonName = "Hello World";
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent[400],
          title: Text(
            'Teknofest',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        drawer: Drawer(
          child: DrawerHeader(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.home,
                    size: 35,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  onTap: () {
                    _onItemTapped(0);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.data_usage),
                  title: Text('Data Visulation'),
                  onTap: () {
                    _onItemTapped(1);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.dataset),
                  title: Text('Previus Data Visulation'),
                  onTap: () {
                    _onItemTapped(2);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text('Contact'),
                  onTap: () {
                    _onItemTapped(3);
                  },
                ),
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            Center(
              child: Text(
                'Home',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Column(
              // Use Column to stack elements vertically
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centers the Column vertically
              children: [
                Row(
                  // Top row with two containers side-by-side
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centers the Row horizontally
                  children: [
                    Container(
                      color: Colors.red,
                      margin: EdgeInsets.all(10.0),
                      width:
                          MediaQuery.of(context).size.width * 0.4, // 40% width
                      height: MediaQuery.of(context).size.height *
                          0.4, // 40% height
                      child: buildLineChart(),
                    ),
                    SizedBox(width: 10.0), // Adds spacing between containers
                    Container(
                      color: Colors.green,
                      margin: EdgeInsets.all(10.0),
                      width:
                          MediaQuery.of(context).size.width * 0.4, // 40% width
                      height: MediaQuery.of(context).size.height *
                          0.4, // 40% height
                    ),
                  ],
                ),
                SizedBox(height: 10.0), // Adds spacing between rows

                Row(
                  // Bottom row with two containers side-by-side
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centers the Row horizontally
                  children: [
                    Container(
                      color: Colors.blue,
                      margin: EdgeInsets.all(10.0),
                      width:
                          MediaQuery.of(context).size.width * 0.4, // 40% width
                      height: MediaQuery.of(context).size.height *
                          0.4, // 40% height
                    ),
                    SizedBox(width: 10.0), // Adds spacing between containers
                    Container(
                      color: Colors.yellow,
                      margin: EdgeInsets.all(10.0),
                      width:
                          MediaQuery.of(context).size.width * 0.4, // 40% width
                      height: MediaQuery.of(context).size.height *
                          0.4, // 40% height
                    ),
                  ],
                ),
              ],
            ),
            Column(
              // Use Column to stack elements vertically
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centers the Column vertically
              children: [
                Row(
                  // Top row with two containers side-by-side
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centers the Row horizontally
                  children: [
                    Container(
                      color: Color.fromARGB(255, 0, 247, 255),
                      margin: EdgeInsets.all(10.0),
                      width:
                          MediaQuery.of(context).size.width * 0.4, // 40% width
                      height: MediaQuery.of(context).size.height *
                          0.4, // 40% height
                    ),
                    SizedBox(width: 10.0), // Adds spacing between containers
                    Container(
                      color: Color.fromARGB(255, 0, 247, 255),
                      margin: EdgeInsets.all(10.0),
                      width:
                          MediaQuery.of(context).size.width * 0.4, // 40% width
                      height: MediaQuery.of(context).size.height *
                          0.4, // 40% height
                    ),
                  ],
                ),
                SizedBox(height: 10.0), // Adds spacing between rows

                Row(
                  // Bottom row with two containers side-by-side
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centers the Row horizontally
                  children: [
                    Container(
                      color: Color.fromARGB(255, 0, 247, 255),
                      margin: EdgeInsets.all(10.0),
                      width:
                          MediaQuery.of(context).size.width * 0.4, // 40% width
                      height: MediaQuery.of(context).size.height *
                          0.4, // 40% height
                    ),
                    SizedBox(width: 10.0), // Adds spacing between containers
                    Container(
                      color: Color.fromARGB(255, 0, 247, 255),
                      margin: EdgeInsets.all(10.0),
                      width:
                          MediaQuery.of(context).size.width * 0.4, // 40% width
                      height: MediaQuery.of(context).size.height *
                          0.4, // 40% height
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Text(
                'Contact',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
