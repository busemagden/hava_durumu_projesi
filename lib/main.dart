import 'package:flutter/material.dart';
import 'package:hava_durumu_projesi/screens/loading_screen.dart';
import 'package:hava_durumu_projesi/screens/main.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Flutter Demo',
      home: const MainScreen(),
    );
  }
}
