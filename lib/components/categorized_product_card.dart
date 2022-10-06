import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/components/product_basket_card.dart';
import 'package:fruithub/data/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:fruithub/components/recom_combo_card.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.productAssetPath,
    required this.productName,
    required this.productPrice,
  });

  final String productAssetPath;
  final String productName;
  final double productPrice;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  NumberFormat numberFormatter = NumberFormat.decimalPattern('en_us');
  Random random = Random();
  final User usuario = User('ed');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 15, 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(
            random.nextInt(255),
            random.nextInt(255),
            random.nextInt(255),
            0.09,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/product',
            arguments: ComboCard(
              usuario: usuario,
              comboAssetPath: widget.productAssetPath,
              comboName: widget.productName,
              comboPrice: widget.productPrice,
              comboBrief:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
              comboContains: [
                'Lorem',
                'Ipsum',
                'Dolor Sit',
                'Amet',
                'Consectetur'
              ],
            ),
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
                  widget.productAssetPath,
                  width: 64,
                ),
              ),
              Text(
                widget.productName,
                style: GoogleFonts.poppins(
                  color: Color(0xFF27214D),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/icons/money-sign.svg',
                  ),
                  SizedBox(width: 5),
                  Text(
                    "${numberFormatter.format(widget.productPrice)}",
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 20),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Color(0xFFFFF2E7),
                    child: IconButton(
                      splashRadius: 20,
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {
                        print(usuario.userProducts.length);
                        usuario.addUserProduct(
                          ProductBasketCard(
                            productName: widget.productName,
                            productAssetPath: widget.productAssetPath,
                            productPrice: widget.productPrice,
                            productQuantity: 1,
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        size: 20,
                      ),
                      color: Theme.of(context).primaryColor,
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
