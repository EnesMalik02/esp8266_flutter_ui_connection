// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAORoyd1LxZT4mcUpUnko0WCL1LyVUjbb8", // Gerçek API anahtarınızı buraya yazın
      appId: "1:497587841810:web:9bc0c0cddf6a34beb5e1cb", // Gerçek App ID'nizi buraya yazın
      messagingSenderId: "497587841810", // Gerçek Messaging Sender ID'nizi buraya yazın
      projectId: "flutterwebproject-b5da1", // Gerçek Project ID'nizi buraya yazın
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final databaseRef = FirebaseDatabase.instance.ref(); // Firebase Database referansını al

  // Firebase'e veri gönderme fonksiyonu
  Future<void> sendData() async {
    int randomData = DateTime.now().millisecondsSinceEpoch; // Rastgele veri olarak geçerli zamanı kullan
    await databaseRef.child('test').set({'random_number': randomData});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Demo'),
      ),
      body: Center(
        child: Text('Butona basarak Firebase\'e veri gönder'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendData, // Butona basıldığında veri gönderme fonksiyonunu çağır
        tooltip: 'Send Data',
        child: const Icon(Icons.send),
      ),
    );
  }
}
