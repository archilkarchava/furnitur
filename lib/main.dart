// TODO: fix the getter length was called on null, when starting the app
// TODO: fix cart
// TODO: Possibly tweak cached network images
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furnitur/core/routes.dart';
import 'package:furnitur/core/services/db.dart';
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
        // Provider.value(value: DatabaseService),
        Provider<DatabaseService>(
          builder: (context) => DatabaseService(),
        ),
        ChangeNotifierProxyProvider<DatabaseService, ProductsModel>(
            builder: (context, db, products) => ProductsModel(db: db)),
        ChangeNotifierProxyProvider<ProductsModel, CartViewModel>(
          // initialBuilder: (_) => CartViewModel(null, null),
          builder: (context, products, previousCart) =>
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
