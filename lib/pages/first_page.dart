// ignore_for_file: prefer_const_constructors, unused_import, depend_on_referenced_packages

import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:teknofest/pages/first_page.dart';
import 'package:teknofest/pages/real_time_data_page.dart';
import 'package:teknofest/pages/settings_page.dart';
import 'package:teknofest/pages/previous_data_page.dart';
import 'package:teknofest/pages/login_page.dart';
import 'package:teknofest/pages/maps.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final databaseRef = FirebaseDatabase.instance.ref(); // Firebase Database referansını al

  void sendData() async {
    final randomNumber = Random().nextInt(100);
    await databaseRef.child('randomNumbers').push().set({
      'number': randomNumber,
      'timestamp': ServerValue.timestamp,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Random number $randomNumber sent to Firebase!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Press the button to send a random number to Firebase:'),
          ElevatedButton(
            onPressed: sendData,
            child: Text('Send Random Number'),
          ),
        ],
      ),
    );
  }
}






class FirstPage extends StatefulWidget {
  const FirstPage({super.key}); // super.key değişikliği

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
    GoogleMap(),
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
        title: Text("${_pages[_selectedIndex].runtimeType.toString().replaceAll('Page', ' ').trim()}Page"), // Dinamik başlık
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
  backgroundColor: Color.fromARGB(255, 51, 67, 125),
  child: Column(
    children: <Widget>[
      Expanded(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
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
            ListTile(
              leading: Icon(Icons.map),
              title: Text("Maps"),
              textColor: Colors.white,
              iconColor: Colors.white,
              onTap: () => _onSelectPage(4),
            ),
            
          ],
        ),
      ),
      
      ListTile(
        leading: Icon(Icons.logout),
        title: Text("Logout"),
        textColor: Colors.white,
        iconColor: Colors.white,
        onTap: () {
    
              Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginPage()),
              (Route<dynamic> route) => false,
          );
      },
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

class CustomHomePageBody extends StatelessWidget {
  const CustomHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Page Content'),
    );
  }
}
