// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:teknofest/pages/first_page.dart';
import 'package:teknofest/pages/real_time_data_page.dart';
import 'package:teknofest/pages/settings_page.dart';
import 'package:teknofest/pages/counter_page.dart';
import 'package:teknofest/pages/todo_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("First Page")),
      drawer: Drawer(
        backgroundColor: Colors.purpleAccent,
        child : Column (
          children: [
            DrawerHeader(
              child: Icon(
                Icons.favorite,
                size:48,
              ),
              ),

              ListTile(
                leading: Icon(Icons.keyboard_option_key_outlined),
                title: Text("Real Time Datas"),
                onTap:(){
                  //pop the drawer first
                  Navigator.pop(context);
                  // go to home page
                  Navigator.pushNamed(context, '/realtimedatapage');
                }
              ),
              ListTile(
                leading: Icon(Icons.timelapse),
                title: Text("Previous Datas"),
                onTap:(){
                  

                }
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settingspage');
                }
              ),
               ListTile(
                leading: Icon(Icons.countertops),
                title: Text("Counter Page"),
                onTap:(){
                  //pop the drawer first
                  Navigator.pop(context);
                  // go to home page
                  Navigator.pushNamed(context, '/counterpage');
                }
              ),
              ListTile(
                leading: Icon(Icons.folder),
                title: Text("Todo Page"),
                onTap:(){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/todopage');
                  

                }
              ),

          ],
        )
      ),
      body: Center(
        

      ),
    );
  }
}