import 'package:flutter/material.dart';
import 'package:furnitur/core/models/products.dart';

class CartItem extends StatelessWidget {
  final Product item;

  CartItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text("${item.category} "),
          Text("${item.name} "),
          Text("${item.price} ")
        ],
      ),
    );
  }
}
