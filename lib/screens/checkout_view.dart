import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/confirmed-order.svg',
              height: 180,
            ),
            const SizedBox(height: 40),
            Text(
              'Order Taken',
              style: GoogleFonts.nunito(
                color: const Color(0xFF27214D),
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Your order have been taken and is being attended to',
                style: GoogleFonts.nunito(
                  color: const Color(0xFF111111),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  )),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Continue shopping",
                style: GoogleFonts.nunito(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
