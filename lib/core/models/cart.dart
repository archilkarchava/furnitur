import 'package:flutter/material.dart';
import 'package:furnitur/core/models/products.dart';

class CartModel extends ChangeNotifier {
  final ProductsModel _products;
  final List<Product> _inCart;

  CartModel(this._products, CartModel previous)
      : assert(_products != null),
        _inCart = previous?._inCart ?? [];

  List<Product> get items =>
      _inCart.map((product) => _products.getById(product.id)).toList();
  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
  bool contains(Product product) => _inCart.contains(product);

  void add(Product product) {
    _inCart.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    _inCart.remove(product);
    notifyListeners();
  }

  void toggleInCart(Product product) {
    if (_inCart.contains(product)) {
      _inCart.remove(product);
    } else {
      _inCart.add(product);
    }
    notifyListeners();
  }
}
