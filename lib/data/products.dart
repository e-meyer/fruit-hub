import 'package:flutter/material.dart';
import 'package:fruithub/components/product_card.dart';

class Product extends StatelessWidget {
  Product({super.key});

  List<ProductCard> hotProductList = const [
    ProductCard(
      productName: 'Quinoa fruit salad',
      productAssetPath: 'assets/foods/quinoa-fruit-salad.png',
      productPrice: 10000,
    ),
    ProductCard(
      productName: 'Tropical fruit salad',
      productAssetPath: 'assets/foods/bread-eggs.png',
      productPrice: 10000,
    ),
    ProductCard(
      productName: 'Fruit mix combo',
      productAssetPath: 'assets/foods/fruit-mix-1.png',
      productPrice: 10000,
    ),
    ProductCard(
      productName: 'Cooked fruit salad',
      productAssetPath: 'assets/foods/fruit-mix-2.png',
      productPrice: 10000,
    ),
  ];

  List<ProductCard> populProductList = const [
    ProductCard(
      productName: 'Fruit mix combo',
      productAssetPath: 'assets/foods/fruit-mix-1.png',
      productPrice: 10000,
    ),
    ProductCard(
      productName: 'Quinoa fruit salad',
      productAssetPath: 'assets/foods/quinoa-fruit-salad.png',
      productPrice: 10000,
    ),
    ProductCard(
      productName: 'Honey lime combo',
      productAssetPath: 'assets/foods/honey-lime-combo.png',
      productPrice: 10000,
    ),
    ProductCard(
      productName: 'Berry mango combo',
      productAssetPath: 'assets/foods/berry-mango-combo.png',
      productPrice: 10000,
    ),
  ];

  List<ProductCard> newComboProductList = const [
    ProductCard(
      productName: 'Tropical fruit salad',
      productAssetPath: 'assets/foods/bread-eggs.png',
      productPrice: 10000,
    ),
    ProductCard(
      productName: 'Honey lime combo',
      productAssetPath: 'assets/foods/honey-lime-combo.png',
      productPrice: 10000,
    ),
    ProductCard(
      productName: 'Fruit mix combo',
      productAssetPath: 'assets/foods/fruit-mix-1.png',
      productPrice: 10000,
    ),
    ProductCard(
      productName: 'Quinoa fruit salad',
      productAssetPath: 'assets/foods/quinoa-fruit-salad.png',
      productPrice: 10000,
    ),
  ];

  List<ProductCard> currProductList = const [
    ProductCard(
      productName: 'Quinoa fruit salad',
      productAssetPath: 'assets/foods/quinoa-fruit-salad.png',
      productPrice: 10000,
    ),
    ProductCard(
      productName: 'Tropical fruit salad',
      productAssetPath: 'assets/foods/bread-eggs.png',
      productPrice: 10000,
    ),
    ProductCard(
      productName: 'Fruit mix combo',
      productAssetPath: 'assets/foods/fruit-mix-1.png',
      productPrice: 10000,
    ),
    ProductCard(
      productName: 'Cooked fruit salad',
      productAssetPath: 'assets/foods/fruit-mix-2.png',
      productPrice: 10000,
    ),
  ];

  getCurrProductList() {
    return currProductList;
  }

  setCurrProductList(List<ProductCard> newList) {
    currProductList = newList;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
