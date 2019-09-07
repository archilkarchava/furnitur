import 'package:flutter/material.dart';
import 'package:furnitur/core/data/products.dart' as data;
import 'package:meta/meta.dart';

class ProductsModel extends ChangeNotifier {
  static final _products = data.products;
  String _activeCategory = "Стул";
  bool _onlyShowOnSale = false;

  Product getById(int id) =>
      _products.singleWhere((product) => product.id == id, orElse: () => null);

  List<Product> getProductsInCategory(String category) {
    if (_onlyShowOnSale) {
      return this
          .itemsOnSale
          .where((product) => product.category == category)
          .toList();
    } else {
      return this
          .items
          .where((product) => product.category == category)
          .toList();
    }
  }

  List<Product> get items => _products;
  List<Product> get itemsOnSale =>
      _products.where((product) => product.oldPrice != null).toList();
  String get activeCategory => _activeCategory;
  bool get onlyShowOnSale => _onlyShowOnSale;
  void setActiveCategory(String category) {
    _activeCategory = category;
    notifyListeners();
  }

  void setOnlyShowOnSale(bool onlyShowOnSale) {
    _onlyShowOnSale = onlyShowOnSale;
    notifyListeners();
  }

  Product operator [](int i) => _products[i];
}

@immutable
class Product {
  final int id;
  final String name;
  final int price;
  final int oldPrice;
  final String image;
  final String description;
  final String category;
  Product(
      {@required this.id,
      @required this.name,
      @required this.price,
      this.oldPrice,
      @required this.image,
      @required this.description,
      @required this.category});

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Product && other.id == id;
}
