import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryMealsLabel extends StatefulWidget {
  const CategoryMealsLabel({super.key, required this.label});

  final String label;

  @override
  State<CategoryMealsLabel> createState() => _CategoryMealsLabelState();
}

class _CategoryMealsLabelState extends State<CategoryMealsLabel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Text(
        widget.label,
        style: GoogleFonts.poppins(fontSize: 16),
      ),
    );
  }
}
