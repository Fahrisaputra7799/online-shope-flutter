import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {

  final List _shopItems = [
    ['Coconut', '10.000', 'lib/images/coconut.png',Colors.green],
    ['Banana', '10.000', 'lib/images/coconut.png',Colors.yellow],
    ['Avocado', '10.000', 'lib/images/coconut.png',Colors.green],
    ['Tomato', '10.000', 'lib/images/coconut.png',Colors.red],
  ];

  get shopItems => _shopItems;
}