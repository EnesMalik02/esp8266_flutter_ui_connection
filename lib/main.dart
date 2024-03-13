// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'pages/dataVisulationPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String butonName = "Hello World";
  final databaseReference = FirebaseDatabase.instance.reference();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ref = databaseReference.child('test');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent[400],
          title: Text(
            ref.toString(),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromARGB(255, 159, 20, 172),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 54, 244, 63),
                    foregroundColor: Color.fromARGB(255, 0, 4, 255),
                  ),
                  onPressed: () {
                    setState(
                      () {
                        print("Printed from the button press.");
                        if (butonName == "Hello World") {
                          butonName = "Merhaba";
                        } else
                          butonName = "Hello World";
                      },
                    );
                  },
                  child: Text(
                    butonName,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        print("Printed from the button press.");
                        if (butonName == "Hello World") {
                          butonName = "Merhaba";
                        } else
                          butonName = "Hello World";
                      },
                    );
                  },
                  child: Text(
                    butonName,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   fixedColor: Colors.purpleAccent[400],
        //   items: const [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.business),
        //       label: 'Business',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.school),
        //       label: 'School',
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
