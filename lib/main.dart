import 'package:flutter/material.dart';
import 'package:project_music/pages/home_page.dart';
import 'package:project_music/theme/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: darkMode,
    );
  }
}
