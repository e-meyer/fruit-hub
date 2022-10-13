import 'package:flutter/material.dart';

class Product {
  final String productName;
  final String productAssetPath;
  final String productBrief;
  final List<String> productContains;
  double productPrice;
  int productAmount;
  Color? productColor;

  Product({
    required this.productBrief,
    required this.productContains,
    required this.productAssetPath,
    required this.productPrice,
    required this.productName,
    required this.productAmount,
    this.productColor,
  });
}