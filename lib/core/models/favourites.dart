import 'package:flutter/material.dart';
import 'package:furnitur/core/models/products.dart';

class FavouritesModel extends ChangeNotifier {
  final ProductsModel _products;
  final List<Product> _favoured;

  FavouritesModel(this._products, FavouritesModel previous)
      : assert(_products != null),
        _favoured = previous?._favoured ?? [];

  List<Product> get items =>
      _favoured.map((product) => _products.getById(product.id)).toList();
  void add(Product product) {
    _favoured.add(product);
    notifyListeners();
  }
}
