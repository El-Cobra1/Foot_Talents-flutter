import 'package:flutter/material.dart';
import 'package:foottalents/screens/home.dart';
import 'package:foottalents/screens/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF141414),
      ),
      home: NavigationScreen(),
    );
  }
}
