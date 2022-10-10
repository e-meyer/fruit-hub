import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/components/combo_contains.dart';
import 'package:fruithub/components/goback_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int productAmount = 1;
  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormatter = NumberFormat.decimalPattern('en_us');
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    var user = args['user'];
    var product = args['product'];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    void _incrementAmount() {
      if (productAmount >= 99) return;
      setState(() {
        productAmount++;
      });
    }

    void _decreaseAmount() {
      if (productAmount <= 1) return;
      setState(() {
        productAmount--;
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: height * 0.40,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          GoBackButton(),
                        ],
                      ),
                    ),
                    Hero(
                      tag: 'productImage',
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          product.productAssetPath,
                          height: 176,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Theme.of(context).primaryColor,
              child: Container(
                width: width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productName,
                        style: GoogleFonts.nunito(
                          fontSize: 24,
                          color: const Color(0xFF27214D),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: const Color(0xFFFFF2E7),
                                foregroundColor: const Color(0xFFFFA451),
                                radius: 14,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 18,
                                  ),
                                  onPressed: _decreaseAmount,
                                ),
                              ),
                              const SizedBox(width: 25),
                              SizedBox(
                                width: 30,
                                child: Center(
                                  child: Text(
                                    "$productAmount",
                                    style: GoogleFonts.nunito(
                                      fontSize: 24,
                                      color: const Color(0xFF27214D),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 25),
                              CircleAvatar(
                                backgroundColor: const Color(0xFFFFF2E7),
                                foregroundColor: const Color(0xFFFFA451),
                                radius: 14,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  icon: const Icon(
                                    Icons.add,
                                    size: 18,
                                  ),
                                  onPressed: _incrementAmount,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/money-sign.svg',
                                height: 16,
                                color: const Color(0xFF27214D),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                numberFormatter.format(
                                    product.productPrice * productAmount),
                                style: GoogleFonts.nunito(
                                  color: const Color(0xFF27214D),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: const Color(0xFFF3F3F3),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "This combo contains: ",
                        style: GoogleFonts.nunito(
                          color: const Color(0xFF27214D),
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: 60,
                        height: 2,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        children: [
                          for (var ingredient in product.productContains)
                            ComboContains(ingredient: ingredient),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: const Color(0xFFF3F3F3),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        product.productBrief,
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: const Color(0xFF333333),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: const Color(0xFFFFF7F0),
                              child: SvgPicture.asset(
                                'assets/icons/heart.svg',
                                height: 20,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 60),
                                backgroundColor: const Color(0xFFFFA451),
                                elevation: 0,
                              ),
                              child: Text(
                                "Add To Basket",
                                style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () {
                                _addProductToBasket(user, product);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addProductToBasket(user, product) {
    bool isInList = false;
    for (var item in user.userProducts) {
      if (item.productName == product.productName) {
        item.productAmount += productAmount;
        item.productPrice =
            item.productPrice + (productAmount * product.productPrice);
        isInList = true;
      }
    }
    ;
    if (!isInList) {
      user.addUserProduct(product);
    }
  }
}
