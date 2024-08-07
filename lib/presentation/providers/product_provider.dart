import 'package:flutter/material.dart';
import 'package:fruit_shop/domain/entities/product.dart';
import 'package:fruit_shop/domain/usecases/get_products.dart';

class ProductProvider with ChangeNotifier {
  final GetProducts getProducts;

  ProductProvider({required this.getProducts});

  List<Product> _products = [];
  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    _products = await getProducts();
    notifyListeners();
  }
}
