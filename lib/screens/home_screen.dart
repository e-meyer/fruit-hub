import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../data/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // recieves argument from last screen and stores it in user
    var user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Welcome, ${user.name}.',
          style: GoogleFonts.poppins(
            color: Color(0xFF27214D),
            fontSize: 14,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Color(0xFFFFFFFF),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/shopping-basket.svg',
                ),
              ),
            ),
          ),
        ],
        leading: IconButton(
          splashRadius: 20,
          icon: SvgPicture.asset(
            'assets/menu.svg',
            color: Colors.black,
          ),
          iconSize: 100,
          color: Color(0xFF070648),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          children: [
            TextFormField(
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Color(0xFF5D577E),
                fontWeight: FontWeight.w600,
              ),
              maxLength: 16,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                hintText: 'Search for fruit salad combos',
                hintStyle: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFB4B4C0),
                ),
                counterText: "",
                filled: true,
                fillColor: Color(0xFFF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
