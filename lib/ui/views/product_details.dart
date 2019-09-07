import 'package:flutter/material.dart';
import 'package:furnitur/core/models/amount_selector.dart';
import 'package:furnitur/core/models/products.dart';
import 'package:furnitur/ui/shared/text_styles.dart';
import 'package:furnitur/ui/widgets/home/cart_button.dart';
import 'package:furnitur/ui/widgets/product_details/add_in_cart_button.dart';
import 'package:furnitur/ui/widgets/product_details/amount_selector.dart';
import 'package:furnitur/ui/widgets/product_details/back_button.dart';
import 'package:furnitur/ui/widgets/shared/appbar.dart';
import 'package:provider/provider.dart';

class ProductDetailsView extends StatelessWidget {
  final Product product;
  ProductDetailsView(this.product);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AmountSelectorModel>(
      builder: (_) => AmountSelectorModel(),
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFFF),
        appBar: appBar(
          leftButton: backButton(context),
          rightButton: CartButton(context),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      product.image,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 30, right: 30, bottom: 30),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            "${product.category}\n${product.name}",
                            style: productDetailsNameTextStyle,
                          ),
                          SizedBox(height: 29),
                          Text(
                            "₽" + product.price.toString(),
                            style: productDetailsPriceTextStyle,
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Text(
                              product.description,
                              style: productDetailsDescriptionTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            AmountSelector(),
                            SizedBox(
                              height: 20,
                            ),
                            AddInCartButton(product)
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
