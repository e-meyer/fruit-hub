import 'package:flutter/material.dart';
import 'package:fruithub/components/categ_combo_labels.dart';
import 'package:fruithub/components/categ_combo_menu.dart';
import 'package:fruithub/components/categ_combo_card.dart';
import 'package:fruithub/components/recom_combo_card.dart';
import 'package:fruithub/data/product.dart';
import 'package:fruithub/data/user.dart';
import 'package:fruithub/screens/home.dart';

class CategorizedCombo extends StatefulWidget {
  const CategorizedCombo({super.key, required this.user});

  final User user;

  @override
  State<CategorizedCombo> createState() => _CategorizedComboState();
}

class _CategorizedComboState extends State<CategorizedCombo> {
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
                CategorizedComboCard(
                  productName: 'Quinoa fruit salad',
                  productAssetPath: 'assets/foods/quinoa-fruit-salad.png',
                  productPrice: 10000,
                  productColor: Color.fromRGBO(255, 255, 0, 0.06),
                  user: widget.user,
                ),
                CategorizedComboCard(
                  productName: 'Tropical fruit salad',
                  productAssetPath: 'assets/foods/bread-eggs.png',
                  productPrice: 10000,
                  productColor: Color.fromRGBO(255, 0, 0, 0.06),
                  user: widget.user,
                ),
                CategorizedComboCard(
                  productName: 'Fruit mix combo',
                  productAssetPath: 'assets/foods/fruit-mix-1.png',
                  productPrice: 10000,
                  productColor: Color.fromRGBO(0, 0, 255, 0.06),
                  user: widget.user,
                ),
                CategorizedComboCard(
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