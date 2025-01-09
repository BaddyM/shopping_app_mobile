import 'package:flutter/material.dart';
import 'package:shopping_app/models/cart.dart';

class CartProvider extends ChangeNotifier {
  final List<Cart> _cartItems = [];
  List<Cart> get cartItems => _cartItems;

  double _subTotal = 0.0;
  double get subTotal => _subTotal;
  int _cartCounter = 0;
  int get cartCounter => _cartCounter;

  void addToCart(Cart item) {
    if (_cartItems.contains(item) == false) {
      _cartItems.add(item);
    }
    _cartCounter = _cartItems.length;
    notifyListeners();
  }
}
