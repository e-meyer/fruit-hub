import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/data/user.dart';

class BasketButton extends StatelessWidget {
  const BasketButton({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: Colors.grey,
              spreadRadius: 0,
              offset: Offset(0, 0.5),
            )
          ],
        ),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xFFFFFFFF),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/basket',
                arguments: user,
              );
            },
            icon: SvgPicture.asset(
              'assets/icons/shopping-basket.svg',
            ),
          ),
        ),
      ),
    );
  }
}
