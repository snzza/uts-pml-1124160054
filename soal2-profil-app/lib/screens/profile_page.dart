import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';

// Halaman utama setelah login. Menampilkan foto, nama, NIM, prodi, kelas,
// bio, sama kartu kontak. Ada drawer, bottom nav, sama FAB.
class ProfilePage extends StatefulWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const ProfilePage({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile _profile = Profile.defaultProfile();
  bool _sudahAmbilData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Data profil dikirim dari login lewat arguments, ambil sekali aja.
    if (!_sudahAmbilData) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is Profile) {
        _profile = args;
      }
      _sudahAmbilData = true;
    }
  }

  // Buka halaman edit, terus tampilin data barunya kalau ada.
  Future<void> _bukaEdit() async {
    final hasil = await Navigator.pushNamed(
      context,
      '/edit',
      arguments: _profile,
    );
    if (hasil is Profile) {
      setState(() => _profile = hasil);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          IconButton(
            icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.onToggleTheme,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(_profile.fotoAsset),
                    child: const Icon(Icons.person, size: 28),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _profile.nama,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(_profile.nim),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  '/about',
                  arguments: _profile,
                );
              },
            ),
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text('Mode Gelap'),
              value: widget.isDark,
              onChanged: (_) => widget.onToggleTheme(),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Keluar'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(_profile.fotoAsset),
                  child: const Icon(Icons.person, size: 50),
                ),
                const SizedBox(height: 16),
                Text(
                  _profile.nama,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  _profile.nim,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  '${_profile.prodi} • ${_profile.kelas}',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  _profile.bio,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Card(
                  child: Column(
                    children: [
                      InfoTile(
                        icon: Icons.email,
                        label: 'Email',
                        value: _profile.email,
                      ),
                      InfoTile(
                        icon: Icons.phone,
                        label: 'No. HP',
                        value: _profile.hp,
                      ),
                      InfoTile(
                        icon: Icons.code,
                        label: 'GitHub',
                        value: _profile.github,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _bukaEdit,
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit Profil'),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/about',
                        arguments: _profile,
                      );
                    },
                    icon: const Icon(Icons.info),
                    label: const Text('Tentang Saya'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Terima kasih telah melihat profil saya'),
            ),
          );
        },
        child: const Icon(Icons.thumb_up),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/about', arguments: _profile);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Tentang',
          ),
        ],
      ),
    );
  }
}
