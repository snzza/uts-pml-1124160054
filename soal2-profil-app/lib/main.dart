import 'package:flutter/material.dart';
import 'screens/about_page.dart';
import 'screens/edit_profile_page.dart';
import 'screens/login_page.dart';
import 'screens/profile_page.dart';

void main() {
  runApp(const MyApp());
}

// MyApp dibuat StatefulWidget supaya themeMode bisa diganti dari dalam
// aplikasi pakai setState (tombol di AppBar + switch di drawer).
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = _themeMode == ThemeMode.dark;
    return MaterialApp(
      title: 'Profil Rico',
      debugShowCheckedModeBanner: false,
      // Tema terang, warna sendiri (teal)
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      // Tema gelap
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: _themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/profile': (context) => ProfilePage(
              isDark: isDark,
              onToggleTheme: _toggleTheme,
            ),
        '/edit': (context) => const EditProfilePage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}
