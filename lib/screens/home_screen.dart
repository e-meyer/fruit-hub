import 'package:flutter/material.dart';
import 'package:fruithub/components/categorized_meals.dart';
import 'package:fruithub/components/filter_card.dart';
import 'package:fruithub/components/filter_list.dart';
import 'package:fruithub/components/product_basket_card.dart';
import 'package:fruithub/components/recom_combo_structure.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'Welcome, ${user.name}.',
          style: GoogleFonts.poppins(
            color: Color(0xFF27214D),
            fontSize: 14,
          ),
        ),
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    color: Colors.grey,
                    spreadRadius: 0,
                    offset: Offset(0, 0.5),
                  )
                ],
              ),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xFFFFFFFF),
                child: IconButton(
                  onPressed: () {
                    print(usuario.userProducts.length);
                    Navigator.pushNamed(
                      context,
                      '/basket',
                      arguments: usuario,
                    );
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/shopping-basket.svg',
                  ),
                ),
              ),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 15),
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
                          EdgeInsets.symmetric(horizontal: 5, vertical: 16),
                      constraints: BoxConstraints(),
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
            RecommendedCombo(user: usuario),
            // CategorizedMeals(user: usuario),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
