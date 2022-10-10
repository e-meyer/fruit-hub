import 'package:flutter/material.dart';
import 'package:fruithub/components/filter_card.dart';

class FilterList extends StatelessWidget {
  FilterList({super.key});

  final List<String> filters = [
    'All',
    'Salad Combo',
    'Berry Combo',
    'Mango Combo'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: const Color(0xFFFAFAFA),
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 20),
          for (var filter in filters) FilterCard(filterName: filter),
        ],
      ),
    );
  }
}
