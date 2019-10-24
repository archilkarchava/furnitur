import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furnitur/core/models/product.dart';

class Api {
  static final _db = Firestore.instance;
  final _ref = _db.collection('products');

  Future<Product> fetchProduct(String id) async {
    var doc = await _ref.document(id).get();
    return Product.fromMap({'id': doc.documentID, ...doc.data});
  }

  Future<List<Product>> fetchProducts() async {
    return (await _ref.getDocuments()).documents.map(
      (doc) {
        // final category = ProductCategory.fromMap(doc.data['category']);
        final productMap = {
          'id': doc.documentID,
          ...doc.data,
          // 'category': category
        };
        return Product.fromMap(productMap);
      },
    ).toList();
  }

  // Future<List<String>> fetchCategoryNames() async {
  //   _ref.where('category', )
  //   return (await _ref.getDocuments()).documents.map(
  //     (doc) {
  //       final productMap = {'id': doc.documentID, ...doc.data};
  //       return Product.fromMap(productMap);
  //     },
  //   ).toList();
  // }

  // Stream<List<Product>> fetchProductsStream() {
  //   return _ref.snapshots().map(
  //         (snapshot) => snapshot.documents.map(
  //           (doc) {
  //             final productMap = {'id': doc.documentID, ...doc.data};
  //             return Product.fromMap(productMap);
  //           },
  //         ).toList(),
  //       );
  // }
}
