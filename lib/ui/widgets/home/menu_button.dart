import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:flutter/material.dart';

IconButton menuButton() {
  return IconButton(
    icon: Icon(
      Boxicons.bxMenuAltLeft,
      color: Color(0xff647A86),
    ),
    iconSize: 25,
    // alignment: Alignment.centerLeft,
    tooltip: 'Navigation menu',
    onPressed: () {},
  );
}
