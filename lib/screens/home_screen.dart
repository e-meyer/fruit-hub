import 'package:flutter/material.dart';
import 'package:fruithub/components/combo_card.dart';
import 'package:fruithub/components/filter_list.dart';
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
  final List<String> filters = [
    'All',
    'Salad Combo',
    'Berry Combo',
    'Mango Combo'
  ];

  @override
  Widget build(BuildContext context) {
    // recieves argument from last screen and stores it in user
    var user = ModalRoute.of(context)!.settings.arguments as User;
    double width = MediaQuery.of(context).size.width;

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
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/shopping-basket.svg',
                  ),
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
            const SizedBox(height: 15),
            Container(
              height: 40,
              color: Color(0xFFFAFAFA),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 20),
                  for (var filter in filters) FilterList(filterName: filter),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended Combo',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF27214D),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor),
                    width: 60,
                    height: 2,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      ComboCard(
                        comboAssetPath: 'assets/foods/honey-lime-combo.png',
                        comboName: 'Honey lime combo',
                        comboPrice: '2000',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ComboCard(
                        comboAssetPath: 'assets/foods/berry-mango-combo.png',
                        comboName: 'Berry mango combo',
                        comboPrice: '2000',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
