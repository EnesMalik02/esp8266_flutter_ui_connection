// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';


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
      backgroundColor: Color.fromARGB(198, 93, 164, 198),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 24, 37, 86),
        title: Text("New Testing Page"),
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
      body: Stack(
        children: [
          Positioned(
            left: horizontalPadding,
            top: verticalPadding,
            child: Container(
              height: 200,
              width: 200,
              color: Color.fromARGB(255, 41, 86, 134),
            ),
          ),
          Positioned(
            right: horizontalPadding,
            top: verticalPadding,
            child: Container(
              height: 200,
              width: 200,
              color: Color.fromARGB(255, 41, 86, 134),
            ),
          ),
          Positioned(
            left: horizontalPadding,
            bottom: verticalPadding,
            child: Container(
              height: 200,
              width: 200,
              color: Color.fromARGB(255, 41, 86, 134),
            ),
          ),
          Positioned(
            right: horizontalPadding,
            bottom: verticalPadding,
            child: Container(
              height: 200,
              width: 200,
              color: Color.fromARGB(255, 41, 86, 134),
            ),
          ),
        ],
      ),
    );
  }
}
