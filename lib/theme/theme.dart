

import 'package:flutter/material.dart';

class AppTheme {
  static final  lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueAccent,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
    ),
    textTheme: TextTheme( 
      bodyMedium: TextStyle(
        color: Colors.black
      )
    )
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 104, 103, 103),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      color: Colors.white,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
    ),
    textTheme: TextTheme( 
      bodyMedium: TextStyle(
        color: Colors.white
      )
    )
  );
}