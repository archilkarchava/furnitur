import 'package:flutter/material.dart';
import 'package:furnitur/core/viewmodels/widgets/products.dart';
import 'package:furnitur/ui/widgets/home/product_item.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  final String category;

  Future<void> _scrollProductsToBeginning() async {
    if (scrollController.hasClients) {
      await scrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  final ScrollController scrollController = ScrollController();

  ProductList(this.category);
  @override
  Widget build(BuildContext context) {
    final _products = Provider.of<ProductsModel>(context);
    _products.addListener(() async {
      await _scrollProductsToBeginning();
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
