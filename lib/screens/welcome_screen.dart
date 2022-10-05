import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: height * 0.60,
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Image.asset(
                  'assets/welcome-basket.png',
                ),
              ),
            ),
          ),
          Container(
            color: Color(0xFFFFFFFF),
            height: height * 0.40,
            child: Align(
              alignment: FractionalOffset.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Get The Freshset Fruit Salad Combo",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF27214D),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "We deliver the best and freshet fruit salad in town. Order for a combo today!!!",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Color(0xFF5D577E),
                      ),
                    ),
                    SizedBox(height: 60),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/auth');
                        },
                        child: Text(
                          "Let's Continue",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          backgroundColor: Theme.of(context).primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minimumSize: Size.fromHeight(40),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
