import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComboContains extends StatelessWidget {
  const ComboContains({super.key, required this.ingredient});

  final String ingredient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          ingredient,
          style: GoogleFonts.poppins(
            color: const Color(0xFF403E3E),
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
