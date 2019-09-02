import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:furnitur/models/product.dart';
import 'package:furnitur/shared_components/custom_appbar.dart';
import 'package:furnitur/style.dart';

IconButton backButton(BuildContext context) {
  return IconButton(
    icon: Icon(
      Boxicons.bxArrowBack,
      color: Color(0xff647A86),
    ),
    iconSize: 25,
    tooltip: 'Back',
    onPressed: () {
      Navigator.pop(context);
    },
  );
}

class Details extends StatefulWidget {
  final Product product;
  Details(this.product);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool _inCart = false;
  bool _isFav = false;

  Widget cartButton(bool isActive) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _inCart = !_inCart;
        });
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Color(0xffffe24a),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                color: Color(0xbfffe24a),
                offset: Offset(0, 7),
                blurRadius: 20,
                spreadRadius: 0)
          ],
        ),
        child: Icon(Boxicons.bxShoppingBag,
            color: isActive ? Colors.red : Colors.black),
      ),
    );
  }

  Widget favButton(bool isActive) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFav = !_isFav;
        });
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                color: Color(0x1a000000),
                offset: Offset(0, 7),
                blurRadius: 20,
                spreadRadius: 0)
          ],
        ),
        child: Icon(isActive ? Boxicons.bxsHeart : Boxicons.bxHeart,
            color: isActive ? Colors.red : Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffFFFFFFF),
      appBar: customAppBar(
        leftButton: backButton(context),
      ),
      body: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Image.asset(
                widget.product.image,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              widget.product.name,
              style: productNameTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 30),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "₽" + widget.product.price.toString(),
                        style: productPriceTextStyle,
                      ),
                      SizedBox(height: 25),
                      Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Text(
                          widget.product.description,
                          style: productDescriptionTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      favButton(_isFav),
                      SizedBox(height: 15),
                      cartButton(_inCart),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
