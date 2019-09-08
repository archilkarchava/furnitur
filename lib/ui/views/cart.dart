import 'package:flutter/material.dart';
import 'package:furnitur/core/models/cart.dart';
import 'package:furnitur/ui/shared/text_styles.dart';
import 'package:furnitur/ui/widgets/cart/buy_button.dart';
import 'package:furnitur/ui/widgets/cart/cart_list_item.dart';
import 'package:furnitur/ui/widgets/product_details/back_button.dart';
import 'package:furnitur/ui/widgets/shared/appbar.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartModel>(context);
    final _items = _cart.itemsUnique;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: appBar(
        leftButton: backButton(context),
        backgroundColor: Color(0xffFFFFFF),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: _cart.items.length > 0
            ? Flex(
                direction: Axis.vertical,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 14,
                    child: ListView.builder(
                      itemCount: _items.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = _items[index];
                        return CartListItem(item);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text("Сумма: ₽${_cart.totalPrice}",
                        style: totalSumTextStyle),
                  ),
                  BuyButton(),
                ],
              )
            : Center(
                child: Text("В корзине пока нет товаров.",
                    style: totalSumTextStyle),
              ),
      ),
    );
  }
}
