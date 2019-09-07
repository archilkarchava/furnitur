import 'package:flutter/material.dart';
import 'package:furnitur/core/models/cart.dart';
import 'package:furnitur/ui/widgets/cart/cart_item.dart';
import 'package:furnitur/ui/widgets/product_details/back_button.dart';
import 'package:furnitur/ui/widgets/shared/appbar.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _inCart = Provider.of<CartModel>(context, listen: false);
    final _items = _inCart.itemsUnique;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: appBar(
        leftButton: backButton(context),
        backgroundColor: Color(0xffFFFFFF),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = _items[index];
          return CartItem(item);
        },
      ),
    );
  }
}
