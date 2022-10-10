import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterCard extends StatelessWidget {
  const FilterCard({super.key, required this.filterName});

  final String filterName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 8, 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {},
        child: Text(
          filterName,
          style: GoogleFonts.poppins(
            color: const Color(0xFF333333),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
