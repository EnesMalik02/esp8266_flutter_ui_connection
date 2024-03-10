// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  //Text editing controller to get acces to what the user typed
  TextEditingController myController = TextEditingController();

  // greetingMessage
  String greetingMessage="";

  //greet User
  void greetUser(){
    
    setState(() {
      greetingMessage="Hello "+myController.text;
      
    });
  }

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(greetingMessage),
            //TextField
            TextField(
            controller:myController ,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText:"Type your name..",
            ),
          ),
          
          //button
          ElevatedButton(onPressed: greetUser, child: Text("Tap!"),
          ),
          
          ],
          ),
        ),
      ),
    );
  }
}