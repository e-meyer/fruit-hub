import 'package:flutter/material.dart';
import 'package:fruithub/screens/auth_screen.dart';
import 'package:fruithub/screens/checkout_screen.dart';
import 'package:fruithub/screens/home_screen.dart';
import 'package:fruithub/screens/product_screen.dart';
import 'package:fruithub/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Hub',
      theme: ThemeData(
        primaryColor: Color(0xFFFFA451),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/auth': (context) => const AuthScreen(),
        '/home': (context) => const HomeScreen(),
        '/product': (context) => const ProductScreen(),
        '/checkout': (context) => const CheckoutScreen(),
      },
    );
  }
}
