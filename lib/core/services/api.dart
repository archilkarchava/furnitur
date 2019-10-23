import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furnitur/core/models/product.dart';

class Api {
  static final _db = Firestore.instance;
  final _ref = _db.collection('products');

  Future<Product> fetchProduct(String id) async {
    var doc = await _ref.document(id).get();
    return Product.fromMap({"id": doc.documentID, ...doc.data});
  }

  Future<List<Product>> fetchProducts() async {
    return (await _ref.getDocuments())
        .documents
        .map(
          (doc) => Product.fromMap({"id": doc.documentID, ...doc.data}),
        )
        .toList();
  }

  Stream<List<Product>> fetchProductsStream() {
    return _ref.snapshots().map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => Product.fromMap({"id": doc.documentID, ...doc.data}),
              )
              .toList(),
        );
  }
}
