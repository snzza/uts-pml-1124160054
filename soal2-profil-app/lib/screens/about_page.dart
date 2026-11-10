import 'package:flutter/material.dart';
import '../models/profile.dart';

// Halaman Tentang Saya: keahlian/hobi sama riwayat pendidikan,
// ditampilkan pakai ListView.
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final profile = args is Profile ? args : Profile.defaultProfile();

    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Saya')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Keahlian & Hobi',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          for (final skill in profile.skills)
            Card(
              child: ListTile(
                leading: const Icon(Icons.star),
                title: Text(skill),
              ),
            ),
          const SizedBox(height: 24),
          Text(
            'Riwayat Pendidikan',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          for (final riwayat in profile.pendidikan)
            Card(
              child: ListTile(
                leading: const Icon(Icons.school),
                title: Text(riwayat),
              ),
            ),
        ],
      ),
    );
  }
}
