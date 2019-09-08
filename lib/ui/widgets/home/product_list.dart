import 'package:flutter/material.dart';
import 'package:furnitur/core/models/products.dart';
import 'package:furnitur/ui/widgets/home/product_item.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  final String category;
  final String filter;

  final ScrollController scrollController = ScrollController();

  ProductList(this.category, {this.filter = "Все"});
  @override
  Widget build(BuildContext context) {
    final _products = Provider.of<ProductsModel>(context);
    // _products.addListener(() {
    //   _scrollProductsToBeginning();
    // });
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
