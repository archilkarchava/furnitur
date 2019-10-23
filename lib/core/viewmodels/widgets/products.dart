import 'package:flutter/material.dart';
import 'package:furnitur/core/models/product.dart';
import 'package:furnitur/core/services/db.dart';

class ProductsModel extends ChangeNotifier {
  DatabaseService _db;
  ProductsModel({@required DatabaseService db}) : _db = db;
  List<Product> _products;
  String _activeCategory = "Стул";
  bool _onlyShowOnSale = false;

  Future<Product> getById(String id) async {
    final product = (await products)
        .singleWhere((product) => product.id == id, orElse: () => null);
    return product;
  }

  Future<List<Product>> getProductsInCategory(String category) async {
    if (_onlyShowOnSale) {
      return (await productsOnSale)
          .where((product) => product.category == category)
          .toList();
    } else {
      return (await products)
          .where((product) => product.category == category)
          .toList();
    }
  }

  Future<List<Product>> get products async {
    _products = await _db.products;
    return _products;
  }

  Future<List<Product>> get productsOnSale async =>
      (await products).where((product) => product.oldPrice != null).toList();
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
}
