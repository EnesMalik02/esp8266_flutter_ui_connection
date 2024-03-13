import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(const MyAp());
}

class MyAp extends StatefulWidget {
  const MyAp({super.key});

  @override
  State<MyAp> createState() => _MyAppState();
}

class _MyAppState extends State<MyAp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent[400],
        title: Text(
          "ref.toString()",
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 159, 20, 172),
        ),
      ),
    );
  }
}
