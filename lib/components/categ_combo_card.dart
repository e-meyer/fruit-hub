import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/data/product.dart';
import 'package:fruithub/data/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CategorizedComboCard extends StatefulWidget {
  const CategorizedComboCard({
    super.key,
    required this.product,
    required this.user,
  });

  final User user;
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
          Map args = {
            'user': widget.user,
            'product': widget.product,
          };
          Navigator.pushNamed(
            context,
            '/product',
            arguments: args,
          );
        },
        child: Container(
          height: 200,
          width: 118,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: SvgPicture.asset(
                        'assets/icons/heart.svg',
                        color: Theme.of(context).primaryColor,
                        height: 16,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Center(
                      child: Image.asset(
                        widget.product.productAssetPath,
                        height: 64,
                        width: 96,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                widget.product.productName,
                style: GoogleFonts.nunito(
                  color: const Color(0xFF27214D),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/money-sign.svg',
                      ),
                      const SizedBox(width: 5),
                      Text(
                        numberFormatter.format(widget.product.productPrice),
                        style: GoogleFonts.nunito(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Color(0xFFFFE3C9),
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
                        _addProductToBasket();
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

  void _addProductToBasket() {
    bool isInList = false;
    for (var item in widget.user.userProducts) {
      if (item.productName == widget.product.productName) {
        item.productAmount += 1;
        item.productPrice += widget.product.productPrice;
        isInList = true;
        print(item.productPrice);
      }
    }
    if (!isInList) {
      widget.user.addUserProduct(widget.product);
    }
  }
}
