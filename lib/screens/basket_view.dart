import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/components/goback_button.dart';
import 'package:fruithub/data/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  NumberFormat numberFormatter = NumberFormat.decimalPattern('en_us');

  @override
  Widget build(BuildContext context) {
    var user = ModalRoute.of(context)!.settings.arguments as User;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double total = 0;

    calculatesTotal() {
      for (var u in user.userProducts) {
        total += u.productPrice;
      }
      return total;
    }

    void _deleteToDoItem(String prodName) {
      setState(() {
        user.userProducts.removeWhere((item) => item.productName == prodName);
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              width: width,
              height: height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GoBackButton(),
                  Center(
                    child: Text(
                      "My Basket",
                      style: GoogleFonts.nunito(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: user.userProducts.isEmpty
                  ? Container(
                      height: height * 0.7,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Your basket is empty',
                              style: GoogleFonts.nunito(
                                fontSize: 26,
                                fontWeight: FontWeight.w400,
                                color: Colors.black26,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: user.userProducts.length,
                      itemBuilder: (context, index) {
                        return user.userProducts[index];
                      }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFFFAFAFA),
        height: height * 0.15,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/money-sign.svg',
                        color: const Color(0xFF27214D),
                        height: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        numberFormatter.format(calculatesTotal()),
                        style: GoogleFonts.nunito(
                            fontSize: 24,
                            color: const Color(0xFF27214D),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: width * 0.15),
                  backgroundColor: const Color(0xFFFFA451),
                  elevation: 0,
                ),
                child: Text(
                  "Checkout",
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  if (user.userProducts.isEmpty) {
                    return;
                  }
                  user.resetUserProduct();
                  Navigator.popAndPushNamed(
                    context,
                    '/checkout',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
