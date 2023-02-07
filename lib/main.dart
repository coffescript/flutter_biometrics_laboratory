import 'package:biometrics_laboratory/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Biometric Laboratory',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const LoginScreen(),
    );
  }
}
