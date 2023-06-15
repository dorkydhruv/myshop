import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.title});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String prodId, double price, String title) {
    if (_items.containsKey(prodId)) {
      _items.update(
          prodId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1,
              title: existingCartItem.title));
    } else {
      _items.putIfAbsent(
          prodId,
          () => CartItem(
              id: DateTime.now().toString(),
              price: price,
              quantity: 1,
              title: title));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
