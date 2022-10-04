import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFFFFA451),
              height: height * 0.60,
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Image.asset(
                    'assets/authentication-basket.png',
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
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What is your first name?",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Color(0xFF27214D),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Chris',
                          hintStyle: TextStyle(
                            color: Color(0xFFC2BDBD),
                            fontWeight: FontWeight.w500,
                          ),
                          filled: true,
                          fillColor: Color(0xFFF7F5F5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/auth');
                          },
                          child: Text(
                            "Start Ordering",
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            backgroundColor: Color(0xFFFFA451),
                            elevation: 0,
                            minimumSize: Size.fromHeight(
                                40), // fromHeight use double.infinity as width and 40 is the height
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
      ),
    );
  }
}
