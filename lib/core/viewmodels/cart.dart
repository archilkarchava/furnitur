import 'package:flutter/material.dart';
import 'package:furnitur/core/models/product.dart';
import 'package:furnitur/core/viewmodels/products.dart';

class CartViewModel extends ChangeNotifier {
  final ProductsModel _products;
  final CartViewModel previous;
  final List<Product> _inCart;
  CartViewModel(this._products, this.previous)
      : _inCart = previous?._inCart ?? [];

  List<Product> get items =>
      _inCart.map((product) => _products.getById(product.id)).toList();
  List<Product> get itemsUnique {
    List<Product> _inCartUnique;
    _inCartUnique = items;
    if (_inCartUnique.length > 1) {
      _inCartUnique.sort(
          (product1, product2) => product1.price.compareTo(product2.price));
      return _inCartUnique.toSet().toList();
    }
    return _inCartUnique;
  }

  int get totalPrice =>
      items.fold<int>(0, (total, current) => total + current.price);
  bool contains(Product product) => _inCart.contains(product);

  int getAmountOf(Product product) {
    return _inCart.where((cartItem) => cartItem.id == product.id).length;
  }

  void add(Product product, {int amount = 1}) {
    for (var i = 0; i < amount; i++) {
      _inCart.add(product);
    }
    notifyListeners();
  }

  void remove(Product product, {int amount = 1}) {
    for (var i = 0; i < amount; i++) {
      _inCart.remove(product);
    }
    notifyListeners();
  }

  void toggleInCart(Product product) {
    if (_inCart.contains(product)) {
      this.remove(product);
    } else {
      this.add(product);
    }
  }
}
