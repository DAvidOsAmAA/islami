import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryLight = Color(0xFFB7935F);
  static Color black = Color(0xFF242424);
  static Color white = Colors.white;

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: black,
      backgroundColor: primaryLight,
      unselectedItemColor: Colors.white,
      unselectedLabelStyle: TextStyle(color:Colors.white),
      
    ),
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent,
    centerTitle: true,
    titleTextStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: black),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    // Define dark theme colors if needed
  );
}
