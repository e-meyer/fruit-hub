import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/components/product_basket_card.dart';
import 'package:fruithub/data/product.dart';
import 'package:fruithub/data/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RecommendedComboCard extends StatelessWidget {
  RecommendedComboCard({
    super.key,
    required this.product,
  });

  final Product product;
  NumberFormat numberFormatter = NumberFormat.decimalPattern('en_us');

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 190,
      width: width * 0.42,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF808080).withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 120),
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
                  padding:
                      EdgeInsets.fromLTRB(width * 0.11, 25, width * 0.11, 10),
                  child: Image.asset(
                    product.productAssetPath,
                    width: 80,
                  ),
                ),
              ],
            ),
            Text(
              product.productName,
              style: GoogleFonts.nunito(
                color: const Color(0xFF27214D),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 8),
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
                        "${numberFormatter.format(product.productPrice)}",
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
                        _addProductToBasket(user);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/product',
            arguments: product,
          );
        },
      ),
    );
  }

  void _addProductToBasket(user) {
    user.addUserProduct(
      ProductBasketCard(
        productAssetPath: product.productAssetPath,
        productName: product.productName,
        productPrice: product.productPrice,
        productAmount: 1,
      ),
    );
  }
}
