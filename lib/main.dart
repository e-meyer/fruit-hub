import 'package:flutter/material.dart';
import 'package:fruithub/screens/auth_screen.dart';
import 'package:fruithub/screens/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit ',
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const WelcomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/auth': (context) => const AuthScreen(),
      },
    );
  }
}
