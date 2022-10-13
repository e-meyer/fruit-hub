// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ConfirmNewProduct {
//   showAlertDialog(BuildContext context, user, product, productAmount) {
//     // set up the buttons
//     Widget cancelButton = ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       onPressed: () {
//         Navigator.of(context).pop(false);
//       },
//       child: Text(
//         "Cancel",
//         style: GoogleFonts.nunito(
//           fontSize: 14,
//           color: Theme.of(context).primaryColor,
//         ),
//       ),
//     );
//     Widget continueButton = ElevatedButton(
//       onPressed: () {
//         Navigator.pop(context, true);
//       },
//       style: ElevatedButton.styleFrom(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         padding: EdgeInsets.zero,
//       ),
//       child: Text(
//         "Continue",
//         style: GoogleFonts.nunito(
//           fontSize: 14,
//           color: Theme.of(context).primaryColor,
//           backgroundColor: Colors.transparent,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 5),
//       actionsAlignment: MainAxisAlignment.center,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(16))),
//       icon: SvgPicture.asset(
//         'assets/icons/shopping-basket.svg',
//         height: 34,
//       ),
//       title: Text(
//         "Add to basket",
//         style: GoogleFonts.nunito(
//           fontSize: 20,
//           fontWeight: FontWeight.w600,
//           color: Theme.of(context).primaryColor,
//         ),
//       ),
//       content: Text(
//         "Adding x$productAmount ${product.productName} to your basket",
//         style: GoogleFonts.nunito(
//           fontSize: 20,
//           fontWeight: FontWeight.w600,
//           color: Color(0xFF27214D),
//         ),
//         textAlign: TextAlign.center,
//       ),
//       actions: [
//         cancelButton,
//         continueButton,
//       ],
//     );
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }
