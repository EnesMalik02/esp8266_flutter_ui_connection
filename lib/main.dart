// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_element

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teknofest/pages/first_page.dart';
import 'package:teknofest/pages/real_time_data_page.dart';
import 'package:teknofest/pages/settings_page.dart';
import 'package:teknofest/pages/previous_data_page.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: "AIzaSyAVAx4WmrXw8CpKUc8wqIbW8PJARCqVkTk",
      appId: "1:573751744419:web:0bee881b05a3aefa256c16",
      messagingSenderId: "573751744419",
      projectId: "espdb-8634b",
      databaseURL: "https://espdb-8634b-default-rtdb.firebaseio.com",
    ),

    
    
    );
  }

  await Firebase.initializeApp();
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
      // home: LoginPage(),
      home: FirstPage(),
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
