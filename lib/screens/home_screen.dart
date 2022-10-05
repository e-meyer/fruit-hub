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
    // recieves argument from last screen and stories it in user
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
        leading: Icon(
          Icons.menu,
          color: Color(0xFF070648),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
    );
  }
}
