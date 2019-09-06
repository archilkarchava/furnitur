import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furnitur/core/models/cart.dart';
import 'package:furnitur/core/models/favourites.dart';
import 'package:furnitur/core/models/products.dart';
import 'package:furnitur/core/routes.dart';
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
    // var _products = Provider.of<ProductsModel>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsModel>(
            builder: (context) => ProductsModel()),
        ChangeNotifierProxyProvider<ProductsModel, CartModel>(
          // initialBuilder: (_) => CartModel(_products, null),
          builder: (context, products, previousCart) =>
              CartModel(products, previousCart),
        ),
        ChangeNotifierProxyProvider<ProductsModel, FavouritesModel>(
          // initialBuilder: (_) => FavouritesModel(_products, null),
          builder: (context, products, previousFavourites) =>
              FavouritesModel(products, previousFavourites),
        ),
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
