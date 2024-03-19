// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';

class RealtimeDataPage extends StatefulWidget {
  const RealtimeDataPage({Key? key});

  @override
  State<RealtimeDataPage> createState() => _RealtimeDataPageState();
}

String _data = '';

class _RealtimeDataPageState extends State<RealtimeDataPage> {
  final databaseReference = FirebaseDatabase.instance
      .ref('test')
      .child("distance"); // Değişiklik yapılacak yolu belirtin

  @override
  void initState() {
    super.initState();
    // Veri değişikliklerini dinle
    databaseReference.onValue.listen((event) {
      setState(() {
        _data = event.snapshot.value?.toString() ?? ''; // null kontrolü eklendi
        print(_data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(197, 224, 229, 232),
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
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 200, // Adjust the height as needed
              child: Row(
                children: [
                  Expanded(
                    child: ChartContainer(_data),
                  ),
                  Expanded(
                    child: ChartContainer(_data),
                  ),
                ],
              ),
            ),
            // Other widgets can be added below if needed
          ],
        ),
      ),
    );
  }
}

class ChartContainer extends StatefulWidget {
  final String data;
  ChartContainer(this.data);

  @override
  _ChartContainerState createState() => _ChartContainerState();
}

class _ChartContainerState extends State<ChartContainer> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;
  late Timer timer;

  @override
  void initState() {
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
    super.initState();
  }

  void dispose() {
    timer.cancel(); // Timer'ı durdurmak için
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SfCartesianChart(
        series: <LineSeries<LiveData, int>>[
          LineSeries<LiveData, int>(
            onRendererCreated: (ChartSeriesController controller) {
              _chartSeriesController = controller;
            },
            dataSource: chartData,
            color: const Color.fromRGBO(192, 108, 132, 1),
            xValueMapper: (LiveData sales, _) => sales.time,
            yValueMapper: (LiveData sales, _) => sales.speed,
          )
        ],
        primaryXAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          interval: 3,
          title: AxisTitle(text: 'Time (seconds)'),
        ),
        primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0),
          title: AxisTitle(text: 'Internet speed (Mbps)'),
        ),
      ),
    );
  }

  num dataAsInt() {
    try {
      return double.parse(widget.data);
    } on FormatException {
      print("Veri int'e dönüştürülemiyor: ${widget.data}");
      // Hata durumunu işle (örneğin varsayılan değer kullan)
      return 0.0; // veya istediğiniz varsayılan değer
    }
  }

  int time = 19;
  void updateDataSource(Timer timer) {
    Future.delayed(Duration(seconds: 1), () {});
    setState(() {
      chartData.add(LiveData(time++, dataAsInt()));
      chartData.removeAt(0);
      _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1,
        removedDataIndex: 0,
      );
    });

  }
  

  List<LiveData> getChartData() {
    return List<LiveData>.generate(
      20,
      (index) => LiveData(index, 0),
    );
  }
}

class LiveData {
  LiveData(this.time, this.speed);
  final int time;
  final num speed;
}
