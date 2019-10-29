import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furnitur/core/models/product.dart';
import 'package:furnitur/core/viewmodels/cart.dart';
import 'package:furnitur/ui/shared/text_styles.dart';
import 'package:furnitur/ui/widgets/cart/select_item_amount.dart';
import 'package:provider/provider.dart';

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
                child: Image(image: CachedNetworkImageProvider(item.image)),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${item.category.name} ${item.name}",
                      style: cartItemNameTextStyle),
                  Text("₽${item.price.round() * _cart.getAmountOf(item)}",
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
                    child: SelectItemAmount(item),
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
