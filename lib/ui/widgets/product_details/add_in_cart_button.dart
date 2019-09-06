import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:furnitur/core/models/cart.dart';
import 'package:furnitur/core/models/products.dart';
import 'package:provider/provider.dart';

class AddInCartButton extends StatelessWidget {
  final Product product;

  AddInCartButton(this.product);
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    var _isActive = cart.contains(product);
    return GestureDetector(
      onTap: () {
        cart.toggleInCart(product);
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Color(0xffffe24a),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                color: Color(0xbfffe24a),
                offset: Offset(0, 7),
                blurRadius: 20,
                spreadRadius: 0)
          ],
        ),
        child: Icon(
          Boxicons.bxShoppingBag,
          color: _isActive ? Colors.red : Color(0xff647A86),
          size: 30,
        ),
      ),
    );
  }
}
