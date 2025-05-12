import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final List<String> _cart = ['banana', 'maça', 'uva'];

  int get count => _cart.length;

  List<String> get cart => _cart;

  void addItem(String item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    if (index >= 0 && index < _cart.length) {
      _cart.removeAt(index);
      notifyListeners();
    }
  }
}
