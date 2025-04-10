import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  addProductToCart(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  removeProductFromCart(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}
