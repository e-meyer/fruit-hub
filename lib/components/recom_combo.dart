import 'package:flutter/material.dart';
import 'package:fruithub/components/recom_combo_card.dart';
import 'package:fruithub/data/product.dart';
import 'package:fruithub/data/user.dart';
import 'package:google_fonts/google_fonts.dart';

class RecommendedCombo extends StatefulWidget {
  const RecommendedCombo({super.key, required this.user});

  final User user;

  @override
  State<RecommendedCombo> createState() => _RecommendedComboState();
}

class _RecommendedComboState extends State<RecommendedCombo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommended Combo',
            style: GoogleFonts.poppins(
              color: Color(0xFF27214D),
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor),
            width: 60,
            height: 2,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              RecommendedComboCard(
                product: Product(
                  productAssetPath: 'assets/foods/honey-lime-combo.png',
                  productName: 'Honey lime combo',
                  productPrice: 2000,
                  productAmount: 1,
                  productBrief:
                      'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you to make',
                  productContains: const [
                    'Red Quinoa',
                    'Watermelon',
                    'Fresh Mint',
                    'Strawberries',
                    'Honey',
                    'Limes',
                    'Blueberries'
                  ],
                  user: widget.user,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              RecommendedComboCard(
                product: Product(
                  productAssetPath: 'assets/foods/berry-mango-combo.png',
                  productName: 'Berry mango combo',
                  productPrice: 2000,
                  productAmount: 1,
                  productBrief:
                      'Mango is the perfect brunch for you to make if you are looking for a new fruit salad to eat today.',
                  productContains: const [
                    'Mango',
                    'Pineapple',
                    'Kiwi',
                    'Grapes',
                    'Avocado',
                    'Limes',
                    'Blueberries'
                  ],
                  user: widget.user,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
