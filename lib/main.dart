import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      theme: AppTheme.lightTheme, // Applying light theme here
      darkTheme: AppTheme.darkTheme,
      initialRoute: HomeScreen.routeName,
    );
  }
}