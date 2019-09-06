import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:flutter/material.dart';

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
