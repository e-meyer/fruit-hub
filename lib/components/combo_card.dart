import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ComboCard extends StatefulWidget {
  const ComboCard(
      {super.key,
      required this.comboAssetPath,
      required this.comboName,
      required this.comboPrice});

  final String comboAssetPath;
  final String comboName;
  final String comboPrice;

  @override
  State<ComboCard> createState() => ComboCardState();
}

class ComboCardState extends State<ComboCard> {
  NumberFormat numberFormatter = NumberFormat.decimalPattern('en_us');
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 15),
              child: Image.asset(
                widget.comboAssetPath,
              ),
            ),
            Text(
              widget.comboName,
              style: GoogleFonts.poppins(
                color: Color(0xFF27214D),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/money-sign.svg'),
                      SizedBox(width: 5),
                      Text(
                        "${numberFormatter.format(int.parse(widget.comboPrice))}",
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Color(0xFFFFF2E7),
                    child: Icon(
                      Icons.add,
                      size: 22,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
