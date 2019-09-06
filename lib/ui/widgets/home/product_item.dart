import 'package:flutter/material.dart';
import 'package:furnitur/core/models/products.dart';
import 'package:furnitur/ui/shared/text_styles.dart';
import 'package:furnitur/ui/views/product_details.dart';

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
        padding: EdgeInsets.only(
          right: 25,
        ),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
              color: Color(0xffeef6fa),
              borderRadius: BorderRadius.circular(18)),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Image.asset(
                    product.image,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                    bottom: 20,
                  ),
                  child: Text("₽" + product.price.toString(),
                      style: productPriceTextStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
