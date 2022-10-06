import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuLabel extends StatefulWidget {
  const MenuLabel({super.key, required this.label});

  final String label;

  @override
  State<MenuLabel> createState() => _MenuLabelState();
}

class _MenuLabelState extends State<MenuLabel> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.label,
      style: GoogleFonts.poppins(fontSize: 16),
    );
  }
}
