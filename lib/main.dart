// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_element

import 'package:flutter/material.dart';
import 'package:teknofest/pages/first_page.dart';
import 'package:teknofest/pages/login_page.dart';
import 'package:teknofest/pages/real_time_data_page.dart';
import 'package:teknofest/pages/settings_page.dart';
import 'package:teknofest/pages/previous_data_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
int _selectedIndex = 0;
class _MyAppState extends State<MyApp> {
  String butonName = "Hello World";
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/firstpage': (context) => FirstPage(),
        '/realtimedatapage': (context) => RealtimeDataPage(),
        '/previousdatapage': (context) => PreviousDataPage(),
        '/settingspage': (context) => SettingsPage(),

      },
    );
  }
}
