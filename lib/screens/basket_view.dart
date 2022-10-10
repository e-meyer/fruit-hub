import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/components/goback_button.dart';
import 'package:fruithub/data/user.dart';
import 'package:fruithub/screens/home_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

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
                  ElevatedButton(
                    onPressed: () {
                      print(user.userProducts);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      minimumSize: Size.zero, // Set this
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/go-back.svg',
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Go back",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xFF27214D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      "My Basket",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
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
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: ListView(
                key: Key(user.userProducts.length.toString()),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  for (var product in usuario.userProducts) product,
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFFFAFAFA),
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
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: Color(0xFF333333),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/money-sign.svg',
                        color: Color(0xFF27214D),
                        height: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        numberFormatter.format(calculatesTotal()),
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: Color(0xFF27214D),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
              ElevatedButton(
                child: Text(
                  "Checkout",
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
                  print(user.userProducts.length);
                  Navigator.popAndPushNamed(
                    context,
                    '/checkout',
                    arguments: usuario,
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
