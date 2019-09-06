import 'package:flutter/material.dart';
import 'package:furnitur/core/models/products.dart';
import 'package:furnitur/ui/shared/text_styles.dart';
import 'package:furnitur/ui/widgets/home/cart_button.dart';
import 'package:furnitur/ui/widgets/home/category_list.dart';
import 'package:furnitur/ui/widgets/home/menu_button.dart';
import 'package:furnitur/ui/widgets/home/product_list.dart';
import 'package:furnitur/ui/widgets/home/search_bar.dart';
import 'package:furnitur/ui/widgets/shared/appbar.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsModel>(context);
    final String _currentCategory = products.activeCategory;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: appBar(leftButton: menuButton(), rightButton: cartButton()),
      body: Padding(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            searchBar(),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("В наличии", style: filterTextActiveStyle),
                  Text("Распродажа", style: filterTextStyle),
                  Text("На заказ", style: filterTextStyle),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: ProductList(
                    _currentCategory,
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 25, bottom: 15, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Text(
                "Категории",
                style: headingTextStyle,
              ),
            ),
            CategoryList()
          ],
        ),
      ),
    );
  }
}
