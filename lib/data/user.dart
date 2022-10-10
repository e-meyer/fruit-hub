import 'package:flutter/cupertino.dart';
import 'package:fruithub/components/product_basket_card.dart';
import 'package:fruithub/data/product.dart';

class User extends ChangeNotifier {
  final String name;
  List<Product> userProducts = [];
  var toRemove = [];

  void addUserProduct(Product newItem) {
    userProducts.add(newItem);
    notifyListeners();
  }

  void removeUserProduct(String productName) {
    userProducts.forEach((item) {
      if (item.productName == productName) {
        toRemove.add(item);
      }
    });
    userProducts.removeWhere((e) => toRemove.contains(e));
    notifyListeners();
    print(userProducts.length);
  }

  void resetUserProduct() {
    userProducts = [];
    notifyListeners();
  }

  User(this.name);
}
