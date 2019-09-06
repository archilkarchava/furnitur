import 'package:flutter/material.dart';
import 'package:furnitur/core/models/products.dart';
import 'package:furnitur/ui/widgets/home/product_item.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  final String category;
  final String filter;

  void _scrollProductsToBeginning() {
    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  final ScrollController scrollController = ScrollController();

  ProductList(this.category, {this.filter = "all"});
  @override
  Widget build(BuildContext context) {
    final _products = Provider.of<ProductsModel>(context);
    _products.addListener(() {
      _scrollProductsToBeginning();
    });
    final _productsInCategory = _products.getProductsInCategory(category);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      controller: scrollController,
      itemCount: _productsInCategory.length,
      itemBuilder: (context, index) {
        final product = _productsInCategory[index];
        return ProductItem(product);
      },
    );
  }
}
