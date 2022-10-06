import 'package:flutter/material.dart';
import 'package:fruithub/components/categorized_meals_labels.dart';
import 'package:fruithub/components/categorized_menu.dart';
import 'package:fruithub/data/products.dart';

class CategorizedMeals extends StatefulWidget {
  const CategorizedMeals({super.key});

  @override
  State<CategorizedMeals> createState() => _CategorizedMealsState();
}

class _CategorizedMealsState extends State<CategorizedMeals> {
  final List<bool> _selectedMenu = <bool>[true, false, false];

  Product prodList = Product();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        CategorizedMenu(prodList: prodList, notifyParent: refresh),
        Container(
          height: 160,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 20),
              for (var product in prodList.getCurrProductList()) product,
            ],
          ),
        ),
      ],
    );
  }

  refresh() {
    setState(() {});
  }
}
