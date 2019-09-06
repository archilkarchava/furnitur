import 'package:flutter/material.dart';
import 'package:furnitur/core/models/products.dart';
import 'package:furnitur/ui/shared/text_styles.dart';
import 'package:furnitur/ui/widgets/product_details/add_in_cart_button.dart';
import 'package:furnitur/ui/widgets/product_details/back_button.dart';
import 'package:furnitur/ui/widgets/product_details/fav_button.dart';
import 'package:furnitur/ui/widgets/shared/appbar.dart';

class ProductDetailsView extends StatelessWidget {
  final Product product;
  ProductDetailsView(this.product);
  final bool _inCart = false;
  final bool _isFav = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffFFFFFFF),
      appBar: appBar(
        leftButton: backButton(context),
        backgroundColor: Color(0xffE9F3F6),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffE9F3F6),
              Color(0xffFFFFFF),
              Color(0xffE9F3F6),
            ],
            // stops: [
            //   0.0,
            // ],
          ),
        ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Image.asset(
                  product.image,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                product.name,
                style: productNameTextStyle,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 30),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "₽" + product.price.toString(),
                          style: productPriceTextStyle,
                        ),
                        SizedBox(height: 25),
                        Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Text(
                            product.description,
                            style: productDescriptionTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        favButton(isActive: _isFav),
                        SizedBox(height: 15),
                        addInCartButton(isActive: _inCart),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
