import 'package:flutter/material.dart';

PreferredSizeWidget appBar(
    {IconButton leftButton, IconButton rightButton, Color backgroundColor}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(90),
    child: Container(
      color: backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 16),
                child: leftButton,
              ),
              Container(margin: EdgeInsets.only(right: 16), child: rightButton),
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    ),
  );
}
