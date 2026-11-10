
import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Mahasiswa"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.blueAccent,
      ),
       body: SingleChildScrollView(
        child: Padding( 
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Color.fromARGB(255, 34, 192, 255),
              child: Icon(Icons.person, size: 60, color: Colors.cyanAccent),
            ),
            const SizedBox(height: 16),
            const Text(
              'Rico Adi Pratama',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              '1124160054',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ],
          ), )
      )
    );
  }
}