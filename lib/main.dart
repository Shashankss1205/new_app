import 'package:flutter/material.dart';

import 'UI/MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter SDG',
      theme: ThemeData(
          brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}




