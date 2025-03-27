import 'dart:async';

import 'package:animationtest/list.dart';
import 'package:animationtest/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool showScrenn = true;

  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      setState(() {
        showScrenn = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showScrenn ? Screen() : ListScreen()
    );
  }
}