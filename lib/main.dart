import 'package:flutter/material.dart';
import 'widgets/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Using statelessWidget
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // using Materiapp with title and theme
    return MaterialApp(
      title: 'Recruiting App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // using homeScreen to home
      home: const HomeScreen(),
    );
  }
}
