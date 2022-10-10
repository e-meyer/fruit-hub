import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/data/product.dart';
import 'package:fruithub/data/user.dart';
import 'package:fruithub/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RecommendedComboCard extends StatefulWidget {
  const RecommendedComboCard({
    super.key,
    required this.product,
    required this.user,
  });

  final User user;
  final Product product;

  @override
  State<RecommendedComboCard> createState() => RecommendedComboCardState();
}

class RecommendedComboCardState extends State<RecommendedComboCard> {
  NumberFormat numberFormatter = NumberFormat.decimalPattern('en_us');
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
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
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 105),
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
                    padding: const EdgeInsets.fromLTRB(25, 25, 25, 15),
                    child: Image.asset(
                      widget.product.productAssetPath,
                      width: 80,
                    ),
                  ),
                ],
              ),
              Text(
                widget.product.productName,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF27214D),
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
                        const SizedBox(width: 5),
                        Text(
                          "${numberFormatter.format(widget.product.productPrice)}",
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 35),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Color(0xFFFFF2E7),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: const Icon(
                          Icons.add,
                          size: 20,
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          bool isInList = false;
                          usuario.userProducts.forEach((item) {
                            if (item.productName ==
                                widget.product.productName) {
                              item.productAmount += 1;
                              item.productPrice += widget.product.productPrice;
                              isInList = true;
                            }
                          });
                          if (!isInList) {
                            widget.user.addUserProduct(widget.product);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              )
            ],
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
        ),
      ),
    );
  }
}
