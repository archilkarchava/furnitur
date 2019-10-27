import 'package:flutter/material.dart';
import 'package:furnitur/core/models/product.dart';
import 'package:furnitur/core/models/productCategory.dart';
import 'package:furnitur/core/services/api.dart';

class ProductsModel extends ChangeNotifier {
  Api _api;
  ProductsModel({@required Api api}) : _api = api;
  List<Product> _products;
  ProductCategory _activeCategory = ProductCategory(
      name: 'Стол',
      namePlural: 'Столы',
      image:
          'https://firebasestorage.googleapis.com/v0/b/furnitur-534fc.appspot.com/o/image_07.png?alt=media&token=8b2edd1d-a406-40a3-973b-4ee6d3e8ad41');
  bool _onlyShowOnSale = false;

  Future<void> init() async {
    _products = await _api.fetchProducts();
  }

  List<Product> get items => _products;

  Product getById(String id) {
    final product = _products.singleWhere((product) => product.id == id,
        orElse: () => null);
    return product;
  }

  List<ProductCategory> getCategories() {
    final _categories =
        _products.map((product) => product.category).toSet().toList();
    return _categories;
  }

  List<Product> getProductsInCategory(ProductCategory category) {
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

  List<Product> get productsOnSale => _products
      .where((product) =>
          product.oldPrice != null && product.oldPrice > product.price)
      .toList();
  ProductCategory get activeCategory => _activeCategory;
  bool get onlyShowOnSale => _onlyShowOnSale;
  void setActiveCategory(ProductCategory category) {
    _activeCategory = category;
    notifyListeners();
  }

  void setOnlyShowOnSale(bool onlyShowOnSale) {
    _onlyShowOnSale = onlyShowOnSale;
    notifyListeners();
  }
}
