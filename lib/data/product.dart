import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/data/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Product extends StatefulWidget {
  final String productName;
  final String productAssetPath;
  final String productBrief;
  final List<String> productContains;
  double productPrice;
  int productAmount;
  Color? productColor;

  Product({
    super.key,
    required this.productBrief,
    required this.productContains,
    required this.productAssetPath,
    required this.productPrice,
    required this.productName,
    required this.productAmount,
    this.productColor,
  });

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  // void _removeFromList(String prodName) {
  //   setState(() {
  //     widget.user.removeUserProduct(prodName);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormatter = NumberFormat.decimalPattern('en_us');
    Random random = Random();
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(
                    random.nextInt(255),
                    random.nextInt(255),
                    random.nextInt(255),
                    0.09,
                  ),
                ),
                height: 64,
                width: 64,
                child: Center(
                  child: Image.asset(
                    widget.productAssetPath,
                    height: 40,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                height: 66,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: const Color(0xFF333333),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "${widget.productAmount.toString()}packs",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/money-sign.svg',
                          color: const Color(0xFF27214D),
                          height: 12,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          numberFormatter.format(widget.productPrice),
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF27214D),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          CircleAvatar(
            backgroundColor: const Color(0xFFFFF2E7),
            foregroundColor: const Color(0xFFFFA451),
            radius: 20,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: const Icon(
                Icons.remove,
                size: 24,
              ),
              onPressed: () {
                // _removeFromList(widget.productName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
