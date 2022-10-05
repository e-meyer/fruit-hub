import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterList extends StatefulWidget {
  const FilterList({super.key, required this.filterName});

  final String filterName;

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
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
          widget.filterName,
          style: GoogleFonts.poppins(
            color: Color(0xFF333333),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
