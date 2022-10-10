import 'package:flutter/material.dart';
import 'package:fruithub/screens/auth_view.dart';
import 'package:fruithub/screens/basket_view.dart';
import 'package:fruithub/screens/checkout_view.dart';
import 'package:fruithub/screens/home_view.dart';
import 'package:fruithub/screens/product_view.dart';
import 'package:fruithub/screens/welcome_view.dart';

void main() {
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFffa451),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/auth': (context) => const AuthScreen(),
        '/home': (context) => const HomeScreen(),
        '/product': (context) => const ProductScreen(),
        '/basket': (context) => const BasketScreen(),
        '/checkout': (context) => const CheckoutScreen(),
      },
    );
  }
}
