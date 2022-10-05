import 'package:flutter/material.dart';
import 'package:fruithub/components/searchbar.dart';
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
                  'assets/icons/shopping-basket.svg',
                ),
              ),
            ),
          ),
        ],
        leading: IconButton(
          splashRadius: 20,
          icon: SvgPicture.asset(
            'assets/icons/menu.svg',
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
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Flexible(
                    child: SearchBar(),
                  ),
                  SizedBox(width: 5),
                  Container(
                    decoration: const ShapeDecoration(
                      color: Color(0xFFF7F7FC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: IconButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                      constraints: BoxConstraints(),
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/filter.svg',
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
