import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:furnitur/core/models/amount_selector.dart';
import 'package:furnitur/core/models/cart.dart';
import 'package:furnitur/core/models/products.dart';
import 'package:provider/provider.dart';

class AddInCartButton extends StatelessWidget {
  final Product product;

  AddInCartButton(this.product);
  @override
  Widget build(BuildContext context) {
    var _cart = Provider.of<CartModel>(context);
    var _amountSelector = Provider.of<AmountSelectorModel>(context);
    // var _isActive = cart.contains(product);
    return GestureDetector(
      onTap: () {
        _cart.add(product, amount: _amountSelector.amount);
        _amountSelector.reset();
      },
      child: Container(
        width: 70,
        height: 70,
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
          color: Color(0xff647A86),
          size: 30,
        ),
      ),
    );
  }
}
