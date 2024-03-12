// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:teknofest/pages/first_page.dart';
import 'package:teknofest/pages/real_time_data_page.dart';
import 'package:teknofest/pages/settings_page.dart';
import 'package:teknofest/pages/previous_data_page.dart';
import 'package:teknofest/pages/login_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key); // super.key değişikliği

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0; // Hangi sayfanın gösterileceğini tutacak

  // Sayfaları burada tanımlıyoruz
  final List<Widget> _pages = [
    HomePageBody(), // Anasayfanın ana gövdesi için bir widget
    RealtimeDataPage(),
    PreviousDataPage(),
    SettingsPage(),
  ];

  void _onSelectPage(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(197, 224, 229, 232),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 51, 67, 125),
        title: Text(_pages[_selectedIndex].runtimeType.toString().replaceAll('Page', ' ').trim() + "Page"), // Dinamik başlık
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 51, 67, 125),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Icon(Icons.person_pin_circle_sharp, size: 48, color: Colors.white),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home Page"),
              textColor: Colors.white,
              iconColor: Colors.white,
              onTap: () => _onSelectPage(0),
              
            ),
            ListTile(
              leading: Icon(Icons.signal_cellular_alt_sharp),
              title: Text("Real Time Datas"),
              textColor: Colors.white,
              iconColor: Colors.white,
              onTap: () => _onSelectPage(1),
            ),
            ListTile(
              leading: Icon(Icons.timelapse),
              title: Text("Previous Datas"),
              textColor: Colors.white,
              iconColor: Colors.white,
              onTap: () => _onSelectPage(2),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              textColor: Colors.white,
              iconColor: Colors.white,
              onTap: () => _onSelectPage(3),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Page Content'),
    );
  }
}
