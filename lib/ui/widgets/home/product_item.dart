import 'package:flutter/material.dart';
import 'package:furnitur/core/models/product.dart';
import 'package:furnitur/ui/shared/text_styles.dart';
import 'package:furnitur/ui/views/product_details.dart';

Widget _displayPrice(Product product) {
  if (product.oldPrice != null && product.oldPrice > product.price) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text("₽${product.oldPrice}", style: productListOldPriceTextStyle),
          SizedBox(
            height: 5,
          ),
          Text("₽${product.price}", style: productListSalePriceTextStyle),
        ],
      ),
    );
  } else {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Text("₽${product.price}", style: productListPriceTextStyle),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsView(product)));
      },
      child: Padding(
        padding: const EdgeInsets.only(
          right: 25,
        ),
        child: Container(
          width: 230,
          decoration: BoxDecoration(
              color: Color(0xffeef6fa),
              borderRadius: BorderRadius.circular(18)),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    product.image,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: _displayPrice(product)),
            ],
          ),
        ),
      ),
    );
  }
}
