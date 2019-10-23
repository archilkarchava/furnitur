import 'package:flutter/material.dart';
import 'package:furnitur/core/models/product.dart';
import 'package:furnitur/core/services/api.dart';

class ProductsModel extends ChangeNotifier {
  Api _api;
  ProductsModel({@required Api api}) : _api = api;
  List<Product> _products;
  String _activeCategory = "Стул";
  bool _onlyShowOnSale = false;

  Future<void> init() async {
    _products = await _api.fetchProducts();
  }

  List<Product> get products => _products;

  Product getById(String id) {
    final product = _products.singleWhere((product) => product.id == id,
        orElse: () => null);
    return product;
  }

  List<Product> getProductsInCategory(String category) {
    if (_onlyShowOnSale) {
      return productsOnSale
          .where((product) => product.category == category)
          .toList();
    } else {
      return _products
          .where((product) => product.category == category)
          .toList();
    }
  }

  List<Product> get productsOnSale =>
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
}
