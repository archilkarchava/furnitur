import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:furnitur/core/models/product.dart';
import 'package:furnitur/core/viewmodels/cart.dart';
import 'package:furnitur/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';

class SelectItemAmount extends StatelessWidget {
  final Product item;

  SelectItemAmount(this.item);
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
