import 'package:flutter/material.dart';
import 'package:furnitur/core/models/products.dart';
import 'package:furnitur/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final String category;
  
  CategoryItem({@required final this.category});
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
              padding: EdgeInsets.all(7),
              child: Image.asset(
                products.getProductsInCategory(category)[0].image,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              category,
              style: categoryTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
