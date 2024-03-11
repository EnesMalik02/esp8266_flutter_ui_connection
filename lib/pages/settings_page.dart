// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(197, 224, 229, 232),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 51, 67, 125),
        title: Text("Settings"),
        foregroundColor: Colors.white,
      ),
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
                //Navigator.pushNamed(context, '/settingspage');
              },
            ),
           
            
          ],
        ),
      ),
    );
    
  }
}