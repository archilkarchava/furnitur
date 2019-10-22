import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:furnitur/core/models/product.dart';
import 'package:furnitur/core/viewmodels/views/cart.dart';
import 'package:furnitur/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';

class _SelectItemAmount extends StatelessWidget {
  final Product item;

  _SelectItemAmount(this.item);
  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 24, maxWidth: 120),
        child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: Icon(Boxicons.bxMinus,
                        color: Color(0xff647a86), size: 20),
                  ),
                  onTap: () {
                    if (_cart.getAmountOf(item) > 1) {
                      _cart.remove(item);
                    }
                  },
                ),
                Text("${_cart.getAmountOf(item)} шт",
                    style: cartItemPriceTextStyle),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 7),
                    child: Icon(Boxicons.bxPlus,
                        color: Color(0xff647a86), size: 20),
                  ),
                  onTap: () => _cart.add(item),
                ),
              ],
            )),
      ),
    );
  }
}

class CartListItem extends StatelessWidget {
  final Product item;

  CartListItem(this.item);
  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartViewModel>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xffeef6fa),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(item.image),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${item.category} ${item.name}",
                      style: cartItemNameTextStyle),
                  Text("₽${item.price * _cart.getAmountOf(item)}",
                      style: cartItemPriceTextStyle),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Boxicons.bxX),
                    color: Color(0xff647a86),
                    tooltip: "Убрать из корзины",
                    onPressed: () =>
                        _cart.remove(item, amount: _cart.getAmountOf(item)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: _SelectItemAmount(item),
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
