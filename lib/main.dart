import 'package:flutter/material.dart';
import 'package:furnitur/screens/home.dart';

void main() => runApp(FurniturApp());

class FurniturApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furnitur',
      home: FurniturHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
