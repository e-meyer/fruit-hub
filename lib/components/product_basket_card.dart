import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/data/product.dart';
import 'package:fruithub/data/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductBasketCard extends StatelessWidget {
  ProductBasketCard({
    super.key,
    required this.productAssetPath,
    required this.productName,
    required this.productPrice,
    required this.productAmount,
  });

  final String productAssetPath;
  final String productName;
  double productPrice;
  int productAmount;

  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
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
                    productAssetPath,
                    height: 40,
                    width: 44,
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
                      productName,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        color: const Color(0xFF333333),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${productAmount}packs",
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w500,
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
                          numberFormatter.format(productPrice * productAmount),
                          style: GoogleFonts.nunito(
                            color: const Color(0xFF27214D),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
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
              constraints: const BoxConstraints(),
              icon: const Icon(
                Icons.remove,
                size: 24,
              ),
              onPressed: () {
                user.removeUserProduct(productName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
