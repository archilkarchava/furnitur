import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitur/models/category.dart';
import 'package:furnitur/models/product.dart';
import 'package:furnitur/style.dart';

class FurniturHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FurniturHomeState();
}

class _FurniturHomeState extends State<FurniturHome> {
  Category _currentCategory = categories[0];

  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 411.075;
    double defaultScreenHeight = 730.8;
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding: EdgeInsets.only(
          left: ScreenUtil.instance.setWidth(30),
          right: ScreenUtil.instance.setWidth(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil.instance.setHeight(35),
                  bottom: ScreenUtil.instance.setHeight(15)),
              child: customAppBar(),
            ),
            customSearchBar(),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil.instance.setHeight(32)),
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
                padding:
                    EdgeInsets.only(top: ScreenUtil.instance.setHeight(32)),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: _currentCategory.products.length,
                  itemBuilder: (BuildContext context, int i) {
                    return productItem(
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
        padding: EdgeInsets.only(
            top: ScreenUtil.instance.setHeight(25),
            bottom: ScreenUtil.instance.setHeight(15),
            left: ScreenUtil.instance.setWidth(30),
            right: ScreenUtil.instance.setWidth(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(25)),
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
                      right: ScreenUtil.instance.setWidth(20),
                    ),
                    child: categoryItem(
                      category: categories[0],
                      onPressed: () =>
                          setState(() => _currentCategory = categories[0]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: ScreenUtil.instance.setWidth(20),
                    ),
                    child: categoryItem(
                      category: categories[1],
                      onPressed: () =>
                          setState(() => _currentCategory = categories[1]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: ScreenUtil.instance.setWidth(20),
                    ),
                    child: categoryItem(
                      category: categories[2],
                      onPressed: () =>
                          setState(() => _currentCategory = categories[2]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: ScreenUtil.instance.setWidth(20),
                    ),
                    child: categoryItem(
                      category: categories[3],
                      onPressed: () =>
                          setState(() => _currentCategory = categories[3]),
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

Widget customAppBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      IconButton(
        icon: Icon(
          Boxicons.bxMenuAltLeft,
          color: Color(0xff647A86),
        ),
        iconSize: ScreenUtil.instance.setSp(25),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(0),
        tooltip: 'Navigation menu',
        onPressed: null,
      ),
      IconButton(
        icon: Icon(
          Boxicons.bxShoppingBag,
          color: Color(0xff647A86),
        ),
        iconSize: ScreenUtil.instance.setSp(25),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(0),
        tooltip: 'Cart',
        onPressed: null,
      ),
    ],
  );
}

Widget customSearchBar() {
  return Container(
    height: ScreenUtil.instance.setHeight(58),
    decoration: BoxDecoration(
      color: Color(0xffeef6fa),
      borderRadius: BorderRadius.circular(ScreenUtil.instance.setSp(18)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: ScreenUtil.instance.setWidth(21),
          ),
          child: Text(
            "Поиск",
            style: searchTextStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: ScreenUtil.instance.setWidth(21),
          ),
          child: Icon(
            Boxicons.bxSearch,
            color: Color(0xff647A86),
            size: ScreenUtil.instance.setSp(25),
          ),
        ),
      ],
    ),
  );
}

Widget categoryItem(
    {@required final Category category,
    @required final GestureTapCallback onPressed}) {
  return RawMaterialButton(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: ScreenUtil.instance.setWidth(80),
          height: ScreenUtil.instance.setHeight(80),
          decoration: BoxDecoration(
            color: Color(0xffe7f1f2),
            borderRadius: BorderRadius.circular(
              ScreenUtil.instance.setSp(18),
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
          padding: EdgeInsets.only(top: ScreenUtil.instance.setHeight(5)),
          child: Text(
            category.name,
            style: categoryTextStyle,
          ),
        ),
      ],
    ),
    onPressed: onPressed,
  );
}

Widget productItem({@required Product product}) {
  return Padding(
    padding: EdgeInsets.only(
      right: ScreenUtil.instance.setWidth(25),
    ),
    child: Container(
      width: ScreenUtil.instance.setWidth(200),
      decoration: BoxDecoration(
          color: Color(0xffeef6fa),
          borderRadius: BorderRadius.circular(ScreenUtil.instance.setSp(18))),
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
                left: ScreenUtil.instance.setWidth(25),
                bottom: ScreenUtil.instance.setHeight(20),
              ),
              child:
                  Text("₽" + product.price.toString(), style: priceTextStyle),
            ),
          ),
        ],
      ),
    ),
  );
}
