import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:furnitur/ui/shared/text_styles.dart';

Container searchBar() {
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
