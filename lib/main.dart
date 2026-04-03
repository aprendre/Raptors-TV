import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const RaptorsTVApp());
}

class RaptorsTVApp extends StatelessWidget {
  const RaptorsTVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raptors TV',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5D4037),
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
