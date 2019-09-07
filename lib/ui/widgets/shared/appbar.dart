import 'package:flutter/material.dart';

PreferredSizeWidget appBar(
    {Widget leftButton, Widget rightButton, Color backgroundColor}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(70),
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
                margin: const EdgeInsets.only(left: 16),
                child: leftButton,
              ),
              Container(
                  margin: const EdgeInsets.only(right: 16), child: rightButton),
            ],
          ),
        ],
      ),
    ),
  );
}
