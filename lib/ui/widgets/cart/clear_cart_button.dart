import 'package:flutter/material.dart';
import 'package:furnitur/core/viewmodels/cart.dart';
import 'package:furnitur/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';

class ClearCartButton extends StatelessWidget {
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartViewModel>(context);
    return FlatButton(
      child: Text(
        'Очистить',
        style: clearCartButtonTextStyle,
      ),
      onPressed: () => _cart.clear(),
    );
  }
}
