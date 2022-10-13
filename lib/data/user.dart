import 'package:flutter/material.dart';
import 'package:fruithub/components/product_basket_card.dart';
import 'package:fruithub/data/product.dart';

class User extends ChangeNotifier {
  List<ProductBasketCard> userProducts = [];
  var itemHolder;

  void addUserProduct(ProductBasketCard newItem) {
    if (isInList(newItem.productName)) {
      itemHolder.productAmount += newItem.productAmount;
      newItem.productPrice =
          (itemHolder.productPrice * itemHolder.productAmount);
      notifyListeners();
      return;
    }
    userProducts.add(newItem);
    notifyListeners();
  }

  void updateUserProduct() {
    notifyListeners();
  }

  void removeUserProduct(String productName) {
    if (isInList(productName)) {
      userProducts.remove(itemHolder);
    }
    notifyListeners();
  }

  void resetUserProduct() {
    userProducts = [];
    notifyListeners();
  }

  bool isInList(String productName) {
    for (var item in userProducts) {
      if (item.productName == productName) {
        itemHolder = item;
        return true;
      }
    }
    return false;
  }
}
