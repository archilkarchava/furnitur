import 'package:flutter/material.dart';
import 'package:furnitur/core/viewmodels/products.dart';
import 'package:furnitur/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';

class FilterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _products = Provider.of<ProductsModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Все",
                style: !_products.onlyShowOnSale
                    ? filterTextActiveStyle
                    : filterTextStyle),
          ),
          onTap: () => _products.setOnlyShowOnSale(false),
        ),
        InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Распродажа",
                style: _products.onlyShowOnSale
                    ? filterTextActiveStyle
                    : filterTextStyle),
          ),
          onTap: () => _products.setOnlyShowOnSale(true),
        ),
      ],
    );
  }
}
