// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:teknofest/pages/first_page.dart';
import 'package:teknofest/pages/real_time_data_page.dart';
import 'package:teknofest/pages/settings_page.dart';
import 'package:teknofest/pages/previous_data_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List actions = ["Current Datas", "Previous Datas", "Other"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/firstpage': (context) => FirstPage(),
        '/realtimedatapage': (context) => RealtimeDataPage(),
        '/settingspage': (context) => SettingsPage(),
        '/previousdatapage': (context) => PreviousDataPage(),
      },
    );
  }
}
