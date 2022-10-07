import 'package:flutter/material.dart';
import 'package:fruithub/components/categorized_meals_labels.dart';
import 'package:fruithub/data/products.dart';

final List<bool> _selectedMenu = <bool>[true, false, false];

class CategorizedMenu extends StatefulWidget {
  CategorizedMenu({
    super.key,
    // required this.prodList,
    required this.notifyParent,
  });

  // Product prodList = Product();

  final Function() notifyParent;

  @override
  State<CategorizedMenu> createState() => _CategorizedMenuState();
}

class _CategorizedMenuState extends State<CategorizedMenu> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      renderBorder: false,
      direction: Axis.horizontal,
      onPressed: (int index) {
        for (int i = 0; i < _selectedMenu.length; i++) {
          _selectedMenu[i] = i == index;
        }
        // _setNewCurrList(index);

        widget.notifyParent();
      },
      splashColor: Color(0xFFFFFFFF),
      selectedColor: const Color(0xFF27214D),
      fillColor: Colors.white,
      constraints: BoxConstraints(maxHeight: 30),
      color: const Color(0xFFACB3BC),
      isSelected: _selectedMenu,
      children: const [
        CategoryMealsLabel(label: 'Hottest'),
        CategoryMealsLabel(label: 'Popular'),
        CategoryMealsLabel(label: 'New Combo'),
      ],
    );
  }

  // void _setNewCurrList(int index) {
  //   switch (index) {
  //     case 0:
  //       widget.prodList.setCurrProductList(widget.prodList.hotProductList);
  //       break;
  //     case 1:
  //       widget.prodList.setCurrProductList(widget.prodList.populProductList);
  //       break;
  //     case 2:
  //       widget.prodList.setCurrProductList(widget.prodList.newComboProductList);
  //       break;
  //   }
  // }
}
