import 'package:flutter/material.dart';
import 'package:fruit_shop/domain/entities/product.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  void removeAll(Product product) {
    _items.removeWhere((item) => item == product);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  int getProductCount(Product product) {
    return _items.where((item) => item == product).length;
  }

  double get totalPrice {
    return _items.fold(0.0, (total, current) => total + current.price);
  }
}
