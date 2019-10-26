import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furnitur/core/models/order.dart';
import 'package:furnitur/core/models/product.dart';
import 'package:furnitur/core/models/productCategory.dart';

class Api {
  static final _db = Firestore.instance;
  final _productsRef = _db.collection('products');
  final _ordersRef = _db.collection('orders');

  Future<Product> fetchProduct(String id) async {
    var doc = await _productsRef.document(id).get();
    return Product.fromMap({'id': doc.documentID, ...doc.data});
  }

  Future<List<Product>> fetchProducts() async {
    return Future.wait((await _productsRef.getDocuments()).documents.map(
      (doc) async {
        final ProductCategory category =
            ProductCategory.fromMap((await doc.data['category'].get()).data);

        final productMap = {
          'id': doc.documentID,
          ...doc.data,
          'category': category
        };
        return Product.fromMap(productMap);
      },
    ).toList());
  }

  Future<DocumentReference> addOrderToDatabase(Order order) async {
    final orderMap = order.toJson();
    return _ordersRef.add(orderMap);
  }

  // Future<List<String>> fetchCategoryNames() async {
  //   _productsRef.where('category', )
  //   return (await _productsRef.getDocuments()).documents.map(
  //     (doc) {
  //       final productMap = {'id': doc.documentID, ...doc.data};
  //       return Product.fromMap(productMap);
  //     },
  //   ).toList();
  // }

  // Stream<List<Product>> fetchProductsStream() {
  //   return _productsRef.snapshots().map(
  //         (snapshot) => snapshot.documents.map(
  //           (doc) {
  //             final productMap = {'id': doc.documentID, ...doc.data};
  //             return Product.fromMap(productMap);
  //           },
  //         ).toList(),
  //       );
  // }
}
