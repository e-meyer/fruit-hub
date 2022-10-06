import 'package:flutter/material.dart';
import 'package:fruithub/components/category_menu_label.dart';
import 'package:fruithub/data/products.dart';

class CategoryMenu extends StatefulWidget {
  const CategoryMenu({super.key});

  @override
  State<CategoryMenu> createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  final List<bool> _selectedMenu = <bool>[true, false, false];

  Product prodList = Product();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        ToggleButtons(
          renderBorder: false,
          direction: Axis.horizontal,
          onPressed: (int index) {
            for (int i = 0; i < _selectedMenu.length; i++) {
              _selectedMenu[i] = i == index;
            }

            switch (index) {
              case 0:
                prodList.setCurrProductList(prodList.hotProductList);
                break;
              case 1:
                prodList.setCurrProductList(prodList.populProductList);
                break;
              case 2:
                prodList.setCurrProductList(prodList.newComboProductList);
                break;
            }
            setState(() {
              prodList.getCurrProductList();
            });
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
            MenuLabel(label: 'Hottest'),
            MenuLabel(label: 'Popular'),
            MenuLabel(label: 'New Combo'),
          ],
        ),
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
}
