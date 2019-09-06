import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:flutter/material.dart';

Widget addInCartButton({bool isActive = false}) {
  return GestureDetector(
    // onTap: () {
    //   setState(() {
    //     _inCart = !_inCart;
    //   });
    // },
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
      child: Icon(
        Boxicons.bxShoppingBag,
        color: isActive ? Colors.red : Color(0xff647A86),
        size: 30,
      ),
    ),
  );
}
