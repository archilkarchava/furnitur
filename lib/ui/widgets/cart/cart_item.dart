import 'package:flutter/material.dart';
import 'package:furnitur/core/models/cart.dart';
import 'package:furnitur/core/models/products.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final Product item;

  CartItem(this.item);
  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartModel>(context);
    return Container(
      child: Row(
        children: <Widget>[
          Text("${item.category} "),
          Text("${item.name} "),
          Text("${item.price} "),
          Text("${_cart.getAmountOf(item)} ")
        ],
      ),
    );
  }
}
