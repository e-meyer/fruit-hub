import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/components/product_basket_card.dart';
import 'package:fruithub/data/products.dart';
import 'package:fruithub/data/user.dart';
import 'package:fruithub/screens/home_screen.dart';
import 'package:fruithub/screens/product_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ComboCard extends StatefulWidget {
  const ComboCard({
    super.key,
    required this.comboAssetPath,
    required this.comboName,
    required this.comboPrice,
    required this.usuario,
    required this.comboContains,
    required this.comboBrief,
  });

  final String comboAssetPath;
  final String comboName;
  final double comboPrice;
  final User usuario;
  final List<String> comboContains;
  final String comboBrief;

  @override
  State<ComboCard> createState() => ComboCardState();
}

class ComboCardState extends State<ComboCard> {
  NumberFormat numberFormatter = NumberFormat.decimalPattern('en_us');
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFF808080).withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, 15),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 15),
              child: Image.asset(
                widget.comboAssetPath,
                width: 80,
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
                        "${numberFormatter.format(widget.comboPrice)}",
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 35),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Color(0xFFFFF2E7),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: Icon(
                        Icons.add,
                        size: 20,
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        widget.usuario.addUserProduct(
                          ProductBasketCard(
                            productName: widget.comboName,
                            productAssetPath: widget.comboAssetPath,
                            productPrice: widget.comboPrice,
                            productQuantity: 1,
                          ),
                        );
                      },
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
        onPressed: () {
          // Map args = {
          //   'usuario': usuario,
          //   'product': ComboCard(
          //     comboAssetPath: widget.comboAssetPath,
          //     comboName: widget.comboName,
          //     usuario: widget.usuario,
          //     comboPrice: widget.comboPrice,
          //     comboBrief: widget.comboBrief,
          //     comboContains: widget.comboContains,
          //   ),
          // };
          Navigator.pushNamed(context, '/product', arguments: {
            'usuario': usuario,
            'product': ComboCard(
              comboAssetPath: widget.comboAssetPath,
              comboName: widget.comboName,
              usuario: widget.usuario,
              comboPrice: widget.comboPrice,
              comboBrief: widget.comboBrief,
              comboContains: widget.comboContains,
            ),
          });
        },
      ),
    );
  }
}
