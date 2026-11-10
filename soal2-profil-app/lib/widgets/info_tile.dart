import 'package:flutter/material.dart';

// Widget reusable buat satu baris info (ikon + label + isi).
// Dipakai di kartu kontak halaman profil.
class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
