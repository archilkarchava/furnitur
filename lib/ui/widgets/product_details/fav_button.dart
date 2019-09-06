import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:flutter/material.dart';

Widget favButton({bool isActive = false}) {
  return GestureDetector(
    // onTap: () {
    //   setState(() {
    //     _isFav = !_isFav;
    //   });
    // },
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
      child: Icon(
        isActive ? Boxicons.bxsHeart : Boxicons.bxHeart,
        color: isActive ? Colors.red : Color(0xff647A86),
        size: 30,
      ),
    ),
  );
}
