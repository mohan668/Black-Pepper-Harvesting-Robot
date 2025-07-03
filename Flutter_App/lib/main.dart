import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'controller_screen.dart';
import 'dart:io';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(const GameControllerApp());
  });
}

class GameControllerApp extends StatelessWidget {
  const GameControllerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ControllerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
