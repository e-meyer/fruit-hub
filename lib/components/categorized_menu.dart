import 'package:flutter/material.dart';
import 'package:fruithub/components/categorized_meals_labels.dart';
import 'package:fruithub/data/products.dart';

class CategorizedMenu extends StatefulWidget {
  CategorizedMenu(
      {super.key, required this.prodList, required this.notifyParent});

  Product prodList = Product();

  final Function() notifyParent;

  @override
  State<CategorizedMenu> createState() => _CategorizedMenuState();
}

class _CategorizedMenuState extends State<CategorizedMenu> {
  final List<bool> _selectedMenu = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      renderBorder: false,
      direction: Axis.horizontal,
      onPressed: (int index) {
        for (int i = 0; i < _selectedMenu.length; i++) {
          _selectedMenu[i] = i == index;
        }
        _setNewCurrList(index);

        widget.notifyParent();
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedColor: const Color(0xFF27214D),
      fillColor: Colors.white,
      color: const Color(0xFFACB3BC),
      constraints: const BoxConstraints(
        minHeight: 20.0,
        minWidth: 100.0,
      ),
      isSelected: _selectedMenu,
      children: const [
        CategoryMealsLabel(label: 'Hottest'),
        CategoryMealsLabel(label: 'Popular'),
        CategoryMealsLabel(label: 'Combo'),
      ],
    );
  }

  void _setNewCurrList(int index) {
    switch (index) {
      case 0:
        widget.prodList.setCurrProductList(widget.prodList.hotProductList);
        break;
      case 1:
        widget.prodList.setCurrProductList(widget.prodList.populProductList);
        break;
      case 2:
        widget.prodList.setCurrProductList(widget.prodList.newComboProductList);
        break;
    }
  }
}
