import 'package:flutter/material.dart';
import 'package:furnitur/core/viewmodels/products.dart';
import 'package:furnitur/ui/shared/text_styles.dart';
import 'package:furnitur/ui/widgets/home/cart_button.dart';
import 'package:furnitur/ui/widgets/home/category_list.dart';
import 'package:furnitur/ui/widgets/home/filter_list.dart';
import 'package:furnitur/ui/widgets/home/product_list.dart';
import 'package:furnitur/ui/widgets/shared/appbar.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _products = Provider.of<ProductsModel>(context);
    return FutureBuilder(
      future: _products.init(),
      builder: (context, _) {
        if (_products.items == null || _products.items.length == 0) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xffffe24a))),
            ),
          );
        }
        return Scaffold(
          backgroundColor: Color(0xffFFFFFF),
          appBar: appBar(rightButton: CartButton(context)),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FilterList(),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ProductList(
                    _products.activeCategory,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding:
                const EdgeInsets.only(top: 25, bottom: 15, left: 30, right: 30),
            child: SizedBox(
              height: 152,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Text(
                      "Категории",
                      style: headingTextStyle,
                    ),
                  ),
                  Expanded(child: CategoryList())
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
