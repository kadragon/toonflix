import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headlineMedium: TextStyle(color: Color(0xFF232B55)),
        ),
        cardColor: Color(0xFFF4EBBD),
        scaffoldBackgroundColor: Color(0xFFE7626C),
      ),
      home: HomeScreen(),
    );
  }
}
