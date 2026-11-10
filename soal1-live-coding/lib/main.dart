import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
        title: const Text("Profile Mahasiswa"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundColor: Color.fromARGB(255, 34, 192, 255),
                child: Icon(Icons.person, size: 60, color: Colors.white),
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
            