import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/components/combo_contains.dart';
import 'package:fruithub/components/filter_card.dart';
import 'package:fruithub/components/goback_button.dart';
import 'package:fruithub/components/product_basket_card.dart';
import 'package:fruithub/components/recom_combo_card.dart';
import 'package:fruithub/data/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<String> comboContains = [
    'All',
    'Salad Combo',
    'Berry Combo',
    'Mango Combo'
  ];

  int productAmount = 1;
  @override
  Widget build(BuildContext context) {
    // var user = ModalRoute.of(context)!.settings.arguments as User;
    NumberFormat numberFormatter = NumberFormat.decimalPattern('en_us');
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    var usuario = args['usuario'];
    var product = args['product'];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    void _incrementAmount() {
      setState(() {
        productAmount++;
      });
      print(productAmount);
    }

    void _decreaseAmount() {
      if (productAmount <= 1) return;
      setState(() {
        productAmount--;
      });
      print(productAmount);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: height * 0.40,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Image.asset(
                    product.comboAssetPath,
                    height: 176,
                  ),
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
                        product.comboName,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: Color(0xFF27214D),
                          fontWeight: FontWeight.w500,
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
                                backgroundColor: Color(0xFFFFF2E7),
                                foregroundColor: Color(0xFFFFA451),
                                radius: 14,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  icon: Icon(
                                    Icons.remove,
                                    size: 18,
                                  ),
                                  onPressed: _decreaseAmount,
                                ),
                              ),
                              const SizedBox(width: 25),
                              Text(
                                "$productAmount",
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  color: Color(0xFF27214D),
                                ),
                              ),
                              const SizedBox(width: 25),
                              CircleAvatar(
                                backgroundColor: Color(0xFFFFF2E7),
                                foregroundColor: Color(0xFFFFA451),
                                radius: 14,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  icon: Icon(
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
                                color: Color(0xFF27214D),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                numberFormatter
                                    .format(product.comboPrice * productAmount),
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF27214D),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Color(0xFFF3F3F3),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "This combo contains: ",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF27214D),
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: 60,
                        height: 2,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        children: [
                          for (var ingredient in product.comboContains)
                            ComboContains(ingredient: ingredient),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Color(0xFFF3F3F3),
                      ),
                      SizedBox(height: 15),
                      Text(
                        product.comboBrief,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.w300,
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFFFFF7F0),
              child: SvgPicture.asset(
                'assets/icons/heart.svg',
                height: 20,
              ),
            ),
            ElevatedButton(
              child: Text(
                "Add To Basket",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 60),
                backgroundColor: Color(0xFFFFA451),
                elevation: 0,
              ),
              onPressed: () {
                usuario.addUserProduct(
                  ProductBasketCard(
                    productName: product.comboName,
                    productAssetPath: product.comboAssetPath,
                    productPrice: product.comboPrice * productAmount,
                    productQuantity: productAmount,
                  ),
                );
                Navigator.popAndPushNamed(
                  context, '/home', arguments: usuario,
                );
                // Navigator.popAndPushNamed(
                //   context,
                //   '/checkout',
                //   arguments: usuario,
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
