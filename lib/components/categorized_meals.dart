import 'package:flutter/material.dart';
import 'package:fruithub/components/categorized_meals_labels.dart';
import 'package:fruithub/components/categorized_menu.dart';
import 'package:fruithub/components/categorized_product_card.dart';
import 'package:fruithub/components/recom_combo_card.dart';
import 'package:fruithub/data/products.dart';
import 'package:fruithub/data/user.dart';
import 'package:fruithub/screens/home_screen.dart';

class CategorizedMeals extends StatefulWidget {
  const CategorizedMeals({super.key, required this.user});

  final User user;

  @override
  State<CategorizedMeals> createState() => _CategorizedMealsState();
}

class _CategorizedMealsState extends State<CategorizedMeals> {
  final List<bool> _selectedMenu = <bool>[true, false, false];

  //Product prodList = Product();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategorizedMenu(
                    // prodList: prodList,
                    notifyParent: refresh),
                Transform.translate(
                  offset: Offset(0, -6),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor),
                    width: 40,
                    height: 2,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 170,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 20),
                ProductCard(
                  productName: 'Quinoa fruit salad',
                  productAssetPath: 'assets/foods/quinoa-fruit-salad.png',
                  productPrice: 10000,
                  productColor: Color.fromRGBO(255, 255, 0, 0.06),
                  user: widget.user,
                ),
                ProductCard(
                  productName: 'Tropical fruit salad',
                  productAssetPath: 'assets/foods/bread-eggs.png',
                  productPrice: 10000,
                  productColor: Color.fromRGBO(255, 0, 0, 0.06),
                  user: widget.user,
                ),
                ProductCard(
                  productName: 'Fruit mix combo',
                  productAssetPath: 'assets/foods/fruit-mix-1.png',
                  productPrice: 10000,
                  productColor: Color.fromRGBO(0, 0, 255, 0.06),
                  user: widget.user,
                ),
                ProductCard(
                  productName: 'Cooked fruit salad',
                  productAssetPath: 'assets/foods/fruit-mix-2.png',
                  productPrice: 10000,
                  productColor: Color.fromRGBO(0, 255, 0, 0.06),
                  user: widget.user,
                ),
                // for (var product in prodList.getCurrProductList()) product,
              ],
            ),
          ),
        ],
      ),
    );
  }

  refresh() {
    setState(() {});
  }
}
