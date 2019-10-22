import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furnitur/core/routes.dart';
import 'package:furnitur/core/viewmodels/views/cart.dart';
import 'package:furnitur/core/viewmodels/widgets/products.dart';
import 'package:furnitur/ui/views/cart.dart';
import 'package:furnitur/ui/views/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(FurniturApp());

class FurniturApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsModel>(builder: (_) => ProductsModel()),
        ChangeNotifierProxyProvider<ProductsModel, CartViewModel>(
          initialBuilder: (_) => CartViewModel(null, null),
          builder: (_, products, previousCart) =>
              CartViewModel(products, previousCart),
        )
      ],
      child: MaterialApp(
        title: 'Furnitur',
        home: HomeView(),
        routes: {
          Routes.Cart: (context) => CartView(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
