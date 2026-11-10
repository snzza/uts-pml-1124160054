import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soal2_profil_app/main.dart';

void main() {
  testWidgets('halaman login tampil dan validasi jalan', (tester) async {
    await tester.pumpWidget(const MyApp());

    // Halaman login yang muncul pertama
    expect(find.text('Login'), findsWidgets);
    expect(find.text('Masuk'), findsOneWidget);

    // Tekan masuk dengan form kosong -> muncul pesan validasi
    await tester.tap(find.text('Masuk'));
    await tester.pump();
    expect(find.text('Email wajib diisi'), findsOneWidget);
    expect(find.text('Password wajib diisi'), findsOneWidget);
  });

  testWidgets('login berhasil pindah ke halaman profil', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(
      find.byType(TextFormField).first,
      'adipratamarico6@gmail.com',
    );
    await tester.enterText(find.byType(TextFormField).last, 'rahasia123');
    await tester.tap(find.text('Masuk'));
    await tester.pump();
    // Loading jalan dulu
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    // Habis loading, halaman profil tampil
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    expect(find.text('Profil Mahasiswa'), findsOneWidget);
    expect(find.text('Rico Adi Pratama'), findsWidgets);
  });
}
