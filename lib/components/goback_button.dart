import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/data/user.dart';
import 'package:google_fonts/google_fonts.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print(user.userProducts);
        Navigator.popAndPushNamed(
          context,
          '/home',
          arguments: user,
        );
      },
      style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        backgroundColor: Colors.white,
        elevation: 0,
        minimumSize: Size.zero, // Set this
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/go-back.svg',
          ),
          SizedBox(width: 5),
          Text(
            "Go back",
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Color(0xFF27214D),
            ),
          ),
        ],
      ),
    );
  }
}
