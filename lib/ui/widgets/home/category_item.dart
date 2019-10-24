import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furnitur/core/models/productCategory.dart';
import 'package:furnitur/core/viewmodels/products.dart';
import 'package:furnitur/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final ProductCategory categoryItem;

  CategoryItem(this.categoryItem);
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsModel>(context);
    return GestureDetector(
      onTap: () {
        products.setActiveCategory(categoryItem);
        // products.setOnlyShowOnSale(false);
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
              child:
                  Image(image: CachedNetworkImageProvider(categoryItem.image)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              categoryItem.namePlural,
              style: categoryTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
