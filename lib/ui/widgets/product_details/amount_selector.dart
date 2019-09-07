import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:furnitur/core/models/amount_selector.dart';
import 'package:furnitur/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';

class AmountSelector extends StatelessWidget {
  @override
  Widget build(context) {
    final _amountSelector = Provider.of<AmountSelectorModel>(context);
    return Container(
      width: 70,
      height: 157,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
              color: Color(0x3f647a86),
              offset: Offset(0, 7),
              blurRadius: 20,
              spreadRadius: 0)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(Boxicons.bxPlus),
            color: Color(0xff647A86),
            iconSize: 30,
            onPressed: () => _amountSelector.increment(),
          ),
          Text(
            "${_amountSelector.amount}",
            style: productDetailsPriceTextStyle,
          ),
          IconButton(
            icon: Icon(Boxicons.bxMinus),
            color: Color(0xff647A86),
            iconSize: 30,
            onPressed: () => _amountSelector.decrement(),
          ),
        ],
      ),
    );
  }
}
