// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:teknofest/pages/first_page.dart';
import 'package:teknofest/pages/real_time_data_page.dart';
import 'package:teknofest/pages/settings_page.dart';
import 'package:teknofest/pages/previous_data_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(197, 224, 229, 232),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 51, 67, 125),
        title: Text("Home Page"),
        foregroundColor: Colors.white,
      
      ),
      drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 51, 67, 125),
          child: Column(
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
                    //pop the drawer first
                    Navigator.pop(context);
                    // go to home page
                    //Navigator.pushNamed(context, '/first_page');
                  }),
              ListTile(
                  leading: Icon(Icons.signal_cellular_alt_sharp),
                  title: Text("Real Time Datas"),
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  onTap: () {
                    //pop the drawer first
                    Navigator.pop(context);
                    // go to home page
                    Navigator.pushNamed(context, '/realtimedatapage');
                  }),
              ListTile(
                  leading: Icon(Icons.timelapse),
                  title: Text("Previous Datas"),
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.pushNamed(context, '/previousdatapage');
                  }),
              ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/settingspage');
                  }),
            ],
          )),
      body: Center(),
    );
  }
}
