import 'package:flutter/material.dart';
import 'package:furnitur/core/models/products.dart';
import 'package:furnitur/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final String category;

  final String displayName;

  final String imageAsset;

  CategoryItem(
      {@required this.category, @required this.displayName, this.imageAsset});
  @override
  Widget build(BuildContext context) {
    var products = Provider.of<ProductsModel>(context);
    return GestureDetector(
      onTap: () {
        products.setActiveCategory(category);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Color(0xffe7f1f2),
              borderRadius: BorderRadius.circular(
                18,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Image.asset(imageAsset != null
                  ? imageAsset
                  : products.getProductsInCategory(category)[0].image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              displayName,
              style: categoryTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
