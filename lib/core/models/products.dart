import 'package:flutter/material.dart';
import 'package:furnitur/core/data/products.dart' as data;
import 'package:meta/meta.dart';

class ProductsModel extends ChangeNotifier {
  static final _products = data.products;
  String _activeCategory = "Стул";
  Product getById(int id) =>
      _products.singleWhere((product) => product.id == id, orElse: () => null);

  List<Product> getProductsInCategory(String category) =>
      _products.where((product) => product.category == category).toList();
  List<Product> get items => _products;
  String get activeCategory => _activeCategory;
  void setActiveCategory(String category) {
    _activeCategory = category;
    notifyListeners();
  }

  operator [](int i) => _products[i];
}

@immutable
class Product {
  final int id;
  final String name;
  final int price;
  final String image;
  final String description;
  final String category;
  Product(
      {@required this.id,
      @required this.name,
      @required this.price,
      @required this.image,
      @required this.description,
      @required this.category});

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Product && other.id == id;
}
