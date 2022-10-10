import 'package:flutter/material.dart';
import 'package:fruithub/components/basket_button.dart';
import 'package:fruithub/components/categ_combo.dart';
import 'package:fruithub/components/filter_list.dart';
import 'package:fruithub/components/navbar.dart';
import 'package:fruithub/components/recom_combo.dart';
import 'package:fruithub/components/searchbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../data/user.dart';

final usuario = User('Chris');

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    usuario.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // recieves argument from last screen and stores it in user
    var user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      drawer: NavBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'Welcome, ${user.name}.',
          style: GoogleFonts.poppins(
            color: const Color(0xFF27214D),
            fontSize: 14,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            splashRadius: 20,
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              color: Colors.black,
            ),
            iconSize: 100,
            color: const Color(0xFF070648),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          BasketButton(
            user: usuario,
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                const Flexible(
                  child: SearchBar(),
                ),
                const SizedBox(width: 5),
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
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 16),
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/filter.svg',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          FilterList(),
          const SizedBox(height: 40),
          RecommendedCombo(user: usuario),
          const SizedBox(height: 40),
          CategorizedCombo(user: usuario),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
