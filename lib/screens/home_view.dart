import 'package:flutter/material.dart';
import 'package:fruithub/components/basket_button.dart';
import 'package:fruithub/components/categ_combo.dart';
import 'package:fruithub/components/filter_list.dart';
import 'package:fruithub/components/navbar.dart';
import 'package:fruithub/components/recom_combo.dart';
import 'package:fruithub/components/searchbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // recieves argument from last screen and stores it in the string
    var userName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      drawer: NavBar(),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: ((context, innerBoxIsScrolled) => [
              SliverAppBar(
                floating: true,
                titleSpacing: 0,
                title: Text(
                  'Welcome, $userName.',
                  style: GoogleFonts.nunito(
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
                actions: const [BasketButton()],
                elevation: 0,
                backgroundColor: Colors.white,
              ),
            ]),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 16),
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
            const RecommendedCombo(),
            const SizedBox(height: 40),
            const CategorizedCombo(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
