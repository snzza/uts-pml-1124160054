import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Profil Mahasiswa',
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
        title: Text('Profil Saya'),
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
              backgroundColor: Colors.deepOrange,
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
            const SizedBox(height: 16),
            const Card(
              child: ListTile(
                leading: Icon(Icons.email,color: Colors.blueAccent),
                title: Text('email'),
                subtitle: Text('adipratamarico@gmai.com'),

              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.phone,color: Colors.blueAccent),
                title: Text('phone'),
                subtitle: Text('088294832594'),

              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.location_on,color: Colors.blueAccent),
                title: Text('lokasi'),
                subtitle: Text('Tangerang'),

              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.school,color: Colors.blueAccent),
                title: Text('Kampus'),
                subtitle: Text('Global Institute'),

              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}