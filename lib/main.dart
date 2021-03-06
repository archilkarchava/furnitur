// TODO: Possibly tweak cached network images
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furnitur/core/routes.dart';
import 'package:furnitur/core/services/api.dart';
import 'package:furnitur/core/viewmodels/cart.dart';
import 'package:furnitur/core/viewmodels/products.dart';
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
        Provider<Api>(
          builder: (context) => Api(),
        ),
        ChangeNotifierProxyProvider<Api, ProductsModel>(
            builder: (context, api, products) => ProductsModel(api: api)),
        ChangeNotifierProxyProvider<ProductsModel, CartViewModel>(
          // initialBuilder: (_) => CartViewModel(null, null),
          builder: (context, products, previousCart) =>
              CartViewModel(products, previousCart),
        )
      ],
      child: MaterialApp(
        title: 'Furnitur',
        home: HomeView(),
        theme: ThemeData(
          primaryColor: Color(0xff647a86),
          accentColor: Color(0xffffe24a),
        ),
        routes: {
          Routes.Cart: (context) => CartView(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
