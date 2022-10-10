import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.nunito(
        fontSize: 12,
        color: const Color(0xFF5D577E),
        fontWeight: FontWeight.w500,
      ),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(20),
          child: SvgPicture.asset(
            'assets/icons/search.svg',
          ),
        ),
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        hintText: 'Search for fruit salad combos',
        hintStyle: const TextStyle(
          fontSize: 12,
          color: Color(0xFFB4B4C0),
        ),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }
}
