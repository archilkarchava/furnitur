import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furnitur/screens/home.dart';

void main() => runApp(FurniturApp());

class FurniturApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Furnitur',
      home: FurniturHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
