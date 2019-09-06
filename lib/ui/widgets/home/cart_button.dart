import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:furnitur/ui/views/cart.dart';

class CartButton extends StatelessWidget {
  final BuildContext context;
  CartButton({this.context});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Boxicons.bxShoppingBag,
        color: Color(0xff647A86),
      ),
      iconSize: 25,
      // alignment: Alignment.centerRight,
      tooltip: 'Cart',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartView()),
        );
      },
    );
  }
}
