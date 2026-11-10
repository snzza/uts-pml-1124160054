# UTS Pemrograman Mobile — Aplikasi Profil Mahasiswa

**Nama:** Rico Adi Pratama
**NIM:** 1124160054
**Kelas:** ISI KELAS KAMU
**Program Studi:** Teknik Informatika
**Mata Kuliah:** Pemrograman Mobile (KB1185)
**Dosen:** I Ketut Gunawan

**Link video YouTube:** (isi setelah upload)
**Repository:** https://github.com/snzza/uts-pml-1124160054

## Soal 1 — Live Coding (30%)

Halaman Profil Mahasiswa, StatelessWidget. Dikerjakan di kelas, 90 menit.
Folder: `soal1-live-coding/`

## Soal 2 — Aplikasi Android Profil Mahasiswa (70%)

Aplikasi Flutter di folder `soal2-profil-app/`, dijalankan di HP Android
atau emulator, dipresentasikan lewat video YouTube.

### Fitur

- Halaman Login: Form + validator, loading, pindah ke profil pakai
  `pushReplacement`. Login demo: email berformat valid + password
  minimal 6 karakter (tidak ada server).
- Halaman Profil: foto dari `assets/images/`, nama, NIM, prodi, kelas,
  bio, kartu kontak (email, HP, GitHub) pakai Card + ListTile.
- Halaman Edit Profil: form terisi data sekarang, validasi nama wajib
  diisi, email valid, HP angka 10–13 digit. Tombol Simpan balik ke
  profil bawa data baru (`Navigator.pop(context, dataBaru)`), profil
  langsung berubah (`setState`).
- Halaman Tentang Saya: keahlian/hobi + riwayat pendidikan, pakai
  ListView.
- Scaffold: drawer, bottomNavigationBar, floatingActionButton.
- Tema: theme + darkTheme sendiri, bisa ganti mode gelap dari tombol
  di AppBar atau switch di drawer.
- Nama aplikasi di HP: **Profil Rico**.

### Screenshot

![Login](soal2-profil-app/screenshots/login.png)
![Profil](soal2-profil-app/screenshots/profil.png)
![Edit Profil](soal2-profil-app/screenshots/edit-profil.png)

### Cara menjalankan

```bash
cd soal2-profil-app
flutter pub get
flutter run
```

APK release ada di GitHub Releases (tag `v1.0.0`), dibuat dengan
`flutter build apk --release`. APK tidak di-commit ke repository.

### Kendala yang dihadapi

- (isi setelah demo: tulis 2–3 kendala yang benar-benar ketemu,
  misal foto asset tidak muncul karena belum didaftarkan di pubspec,
  atau data edit tidak balik karena lupa `await`.)
