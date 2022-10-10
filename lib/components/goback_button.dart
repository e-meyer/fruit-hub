import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        backgroundColor: Colors.white,
        elevation: 0,
        minimumSize: Size.zero, // Set this

        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/go-back.svg',
          ),
          const SizedBox(width: 5),
          Text(
            "Go back",
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: const Color(0xFF27214D),
            ),
          ),
        ],
      ),
    );
  }
}
