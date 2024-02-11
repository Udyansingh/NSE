import 'package:flutter/material.dart';
import 'package:nse/views/dashboard.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/d': (BuildContext context) => const DashBoard(),
      },
      initialRoute: '/d',
    );
  }
}
