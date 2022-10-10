import 'package:flutter/material.dart';
import 'package:fruithub/data/user.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _username = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: const Color(0xFFFFA451),
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
              color: const Color(0xFFFFFFFF),
              height: height * 0.40,
              child: Align(
                alignment: FractionalOffset.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 40, 25, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What is your first name?",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color(0xFF27214D),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: const Color(0xFF5D577E),
                              fontWeight: FontWeight.w600,
                            ),
                            maxLength: 16,
                            controller: _username,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              hintText: 'Chris',
                              hintStyle: const TextStyle(
                                color: Color(0xFFC2BDBD),
                                fontWeight: FontWeight.w600,
                              ),
                              counterText: "",
                              filled: true,
                              fillColor: const Color(0xFFF7F5F5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                            validator: ((value) {
                              final validCharacters = RegExp(r'^[a-zA-Z]+$');

                              if (value == null || value.isEmpty) {
                                return 'Please provide a name';
                              } else if (!validCharacters.hasMatch(value)) {
                                return 'Please enter only valid characters';
                              }

                              return null;
                            }),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 60, bottom: 30),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              backgroundColor: const Color(0xFFFFA451),
                              elevation: 0,
                              minimumSize: const Size.fromHeight(40),
                            ),
                            child: Text(
                              "Start Ordering",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushNamed(
                                  context,
                                  '/home',
                                  arguments: User(_username.text),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
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
