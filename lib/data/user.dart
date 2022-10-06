import 'package:flutter/cupertino.dart';
import 'package:fruithub/components/product_basket_card.dart';

class User extends ChangeNotifier {
  final String name;
  List<ProductBasketCard> userProducts = [];

  void addUserProduct(ProductBasketCard newItem) {
    userProducts.add(newItem);
    print(userProducts.length);
    print('notificou');
    notifyListeners();
  }

  void resetUserProduct() {
    userProducts = [];
    notifyListeners();
  }

  User(this.name);
}
