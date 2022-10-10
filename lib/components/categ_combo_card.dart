import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/data/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CategorizedComboCard extends StatefulWidget {
  const CategorizedComboCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<CategorizedComboCard> createState() => _CategorizedComboCardState();
}

class _CategorizedComboCardState extends State<CategorizedComboCard> {
  NumberFormat numberFormatter = NumberFormat.decimalPattern('en_us');
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 15, 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.product.productColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/product',
            arguments: widget.product,
          );
        },
        child: Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                child: Image.asset(
                  widget.product.productAssetPath,
                  width: 64,
                ),
              ),
              Text(
                widget.product.productName,
                style: GoogleFonts.poppins(
                  color: Color(0xFF27214D),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/icons/money-sign.svg',
                  ),
                  const SizedBox(width: 5),
                  Text(
                    numberFormatter.format(widget.product.productPrice),
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 20),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Color(0xFFFFF2E7),
                    child: IconButton(
                      icon: const Icon(
                        Icons.add,
                        size: 20,
                      ),
                      splashRadius: 20,
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        bool isInList = false;
                        widget.product.user.userProducts.forEach((item) {
                          if (item.productName == widget.product.productName) {
                            item.productAmount += 1;
                            item.productPrice += widget.product.productPrice;
                            isInList = true;
                          }
                        });
                        if (!isInList)
                          widget.product.user.addUserProduct(widget.product);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
