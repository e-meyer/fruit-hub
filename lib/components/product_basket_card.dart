import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/data/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ProductBasketCard extends StatefulWidget {
  const ProductBasketCard({
    super.key,
    required this.product,
    // required this.productAssetPath,
    // required this.productQuantity,
    // required this.productName,
    // required this.productPrice,
  });

  final Product product;
  // final String productAssetPath;
  // final String productName;
  // final double productPrice;
  // final int productQuantity;

  @override
  State<ProductBasketCard> createState() => _ProductBasketCardState();
}

class _ProductBasketCardState extends State<ProductBasketCard> {
  NumberFormat numberFormatter = NumberFormat.decimalPattern('en_us');
  @override
  Widget build(BuildContext context) {
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
                    widget.product.productAssetPath,
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
                      widget.product.productName,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.product.productAmount.toString() + 'packs',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/money-sign.svg',
                          color: Color(0xFF27214D),
                          height: 12,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          numberFormatter.format(widget.product.productPrice),
                          style: GoogleFonts.poppins(
                            color: Color(0xFF27214D),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
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
            backgroundColor: Color(0xFFFFF2E7),
            foregroundColor: Color(0xFFFFA451),
            radius: 20,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: const Icon(
                Icons.remove,
                size: 24,
              ),
              onPressed: () {
                // widget.product.user
                //     .removeUserProduct(widget.product.productName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
