import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:furnitur/models/category.dart';
import 'package:furnitur/models/product.dart';
import 'package:furnitur/screens/details.dart';
import 'package:furnitur/shared_components/custom_appbar.dart';
import 'package:furnitur/style.dart';

class FurniturHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FurniturHomeState();
}

class _FurniturHomeState extends State<FurniturHome> {
  Category _currentCategory = categories[0];
  ScrollController _productsScrollController = ScrollController();

  void _scrollProductsToBeginning() {
    _productsScrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  Widget categoryItem({@required final Category category}) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Color(0xffe7f1f2),
              borderRadius: BorderRadius.circular(
                18,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(7),
              child: Image.asset(
                category.image,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              category.name,
              style: categoryTextStyle,
            ),
          ),
        ],
      ),
      onTap: () => setState(() {
        _currentCategory = category;
        _scrollProductsToBeginning();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: customAppBar(leftButton: menuButton, rightButton: cartButton),
      body: Padding(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // customAppBar(),
            customSearchBar(),
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  controller: _productsScrollController,
                  itemCount: _currentCategory.products.length,
                  itemBuilder: (BuildContext context, int i) {
                    return ProductItem(
                      product: _currentCategory.products[i],
                    );
                  },
                ),
              ),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                    ),
                    child: categoryItem(
                      category: categories[0],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                    ),
                    child: categoryItem(
                      category: categories[1],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                    ),
                    child: categoryItem(
                      category: categories[2],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                    ),
                    child: categoryItem(
                      category: categories[3],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

IconButton menuButton = IconButton(
  icon: Icon(
    Boxicons.bxMenuAltLeft,
    color: Color(0xff647A86),
  ),
  iconSize: 25,
  // alignment: Alignment.centerLeft,
  tooltip: 'Navigation menu',
  onPressed: () {},
);

IconButton cartButton = IconButton(
  icon: Icon(
    Boxicons.bxShoppingBag,
    color: Color(0xff647A86),
  ),
  iconSize: 25,
  // alignment: Alignment.centerRight,
  tooltip: 'Cart',
  onPressed: () {},
);

Widget customSearchBar() {
  return Container(
    height: 58,
    decoration: BoxDecoration(
      color: Color(0xffeef6fa),
      borderRadius: BorderRadius.circular(18),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: 21,
          ),
          child: Text(
            "Поиск",
            style: searchTextStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 21,
          ),
          child: Icon(
            Boxicons.bxSearch,
            color: Color(0xff647A86),
            size: 25,
          ),
        ),
      ],
    ),
  );
}

class ProductItem extends StatelessWidget {
  const ProductItem({@required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Details(product)));
      },
      child: Padding(
        padding: EdgeInsets.only(
          right: 25,
        ),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
              color: Color(0xffeef6fa),
              borderRadius: BorderRadius.circular(18)),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Image.asset(
                    product.image,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                    bottom: 20,
                  ),
                  child: Text("₽" + product.price.toString(),
                      style: productPriceTextStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
