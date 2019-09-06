import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:flutter/material.dart';

IconButton cartButton() {
  return IconButton(
    icon: Icon(
      Boxicons.bxShoppingBag,
      color: Color(0xff647A86),
    ),
    iconSize: 25,
    // alignment: Alignment.centerRight,
    tooltip: 'Cart',
    onPressed: () {},
  );
}
