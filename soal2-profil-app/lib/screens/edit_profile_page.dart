import 'package:flutter/material.dart';
import '../models/profile.dart';

// Halaman edit profil. Form diisi data yang sekarang, kalau disimpan
// balik ke profil bawa data baru pakai Navigator.pop(context, dataBaru).
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _namaController;
  late final TextEditingController _emailController;
  late final TextEditingController _hpController;
  late final TextEditingController _kelasController;
  late final TextEditingController _bioController;
  late final TextEditingController _githubController;
  Profile _profilLama = Profile.defaultProfile();
  bool _sudahIsi = false;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController();
    _emailController = TextEditingController();
    _hpController = TextEditingController();
    _kelasController = TextEditingController();
    _bioController = TextEditingController();
    _githubController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Isi form dengan data profil yang sekarang, sekali aja.
    if (!_sudahIsi) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is Profile) {
        _profilLama = args;
      }
      _namaController.text = _profilLama.nama;
      _emailController.text = _profilLama.email;
      _hpController.text = _profilLama.hp;
      _kelasController.text = _profilLama.kelas;
      _bioController.text = _profilLama.bio;
      _githubController.text = _profilLama.github;
      _sudahIsi = true;
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _hpController.dispose();
    _kelasController.dispose();
    _bioController.dispose();
    _githubController.dispose();
    super.dispose();
  }

  String? _cekNama(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nama wajib diisi';
    }
    return null;
  }

  String? _cekEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email wajib diisi';
    }
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Format email tidak valid';
    }
    return null;
  }

  String? _cekHp(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nomor HP wajib diisi';
    }
    // Cuma angka, 10-13 digit.
    final hpRegex = RegExp(r'^[0-9]{10,13}$');
    if (!hpRegex.hasMatch(value.trim())) {
      return 'Nomor HP harus angka 10-13 digit';
    }
    return null;
  }

  void _simpan() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final profilBaru = _profilLama.copyWith(
      nama: _namaController.text.trim(),
      email: _emailController.text.trim(),
      hp: _hpController.text.trim(),
      kelas: _kelasController.text.trim(),
      bio: _bioController.text.trim(),
      github: _githubController.text.trim(),
    );
    Navigator.pop(context, profilBaru);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _namaController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Lengkap',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    validator: _cekNama,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    validator: _cekEmail,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _hpController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Nomor HP',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                    validator: _cekHp,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _kelasController,
                    decoration: const InputDecoration(
                      labelText: 'Kelas',
                      prefixIcon: Icon(Icons.group),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _githubController,
                    decoration: const InputDecoration(
                      labelText: 'Akun GitHub',
                      prefixIcon: Icon(Icons.code),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _bioController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Bio Singkat',
                      prefixIcon: Icon(Icons.short_text),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _simpan,
                      child: const Text('Simpan'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Batal'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
