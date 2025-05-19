import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ['Kelapa', '10.000', 'lib/images/coconut.png', Colors.green],
    ['Nanas', '10.000', 'lib/images/nanas.png', Colors.yellow],
    ['Manggis', '10.000', 'lib/images/manggis.png', Colors.deepPurple],
    ['Apel', '10.000', 'lib/images/apel.png', Colors.red],
    ['Semangka', '10.000', 'lib/images/semangka.png', Colors.green],
    ['Pepaya', '10.000', 'lib/images/pepaya.png', Colors.yellow],
    ['Strawberry', '10.000', 'lib/images/strawberry.png', Colors.red],
  ];

  List _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  // add item to cart
  void addItemToCard(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate price total
  String calculatePrice() {
    double totalPrice = 0;

    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
