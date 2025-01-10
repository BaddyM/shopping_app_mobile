import 'package:flutter/material.dart';
import 'package:shopping_app/models/cart.dart';

class CartProvider extends ChangeNotifier {
  final List<Cart> _cartItems = [];
  List<Cart> get cartItems => _cartItems;
  int _cartCounter = 0;
  int get cartCounter => _cartCounter;
  int qty = 0;
  double cartTotal = 0;

  void addToCart(Cart item) {
    if (_cartItems.contains(item) == false) {
      _cartItems.add(item);
    }
    _cartCounter = _cartItems.length;
    notifyListeners();
  }

  void checkQty(index, newQty) {
    double originalPrice = (cartItems[index].price!.toDouble() / cartItems[index].qty!.toDouble());
    cartItems[index].qty = newQty;
    cartItems[index].price = (originalPrice * newQty);
    notifyListeners();
  }

  void removeItem(index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  void cartSubTotal() {
    cartTotal = 0;
    for (int i = 0; i < cartItems.length; i++) {
      cartTotal = cartTotal + cartItems[i].price!;
    }
    notifyListeners();
  }

  void checkout() {
    cartItems.clear();
    _cartCounter = 0;
    notifyListeners();
  }
}
