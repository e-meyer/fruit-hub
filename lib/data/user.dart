import 'package:flutter/material.dart';
import 'package:fruithub/data/product.dart';

class User extends ChangeNotifier {
  List<Product> userProducts = [];
  var toRemove = [];

  void addUserProduct(Product newItem) {
    userProducts.add(newItem);
    notifyListeners();
  }

  void removeUserProduct(String productName) {
    for (var item in userProducts) {
      if (item.productName == productName) {
        toRemove.add(item);
      }
    }
    userProducts.removeWhere((e) => toRemove.contains(e));
    notifyListeners();
  }

  void resetUserProduct() {
    userProducts = [];
    notifyListeners();
  }
}
