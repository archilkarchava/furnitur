import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furnitur/core/models/product.dart';

class DatabaseService {
  final Firestore _db = Firestore.instance;
  Future<Product> getProduct(String id) async {
    var snap = await _db.collection('products').document(id).get();
    return Product.fromMap(snap.data);
  }

  Future<List<Product>> get products async {
    // final snapshot = await _db.collection('products').getDocuments();
    return _db
        .collection('products')
        .snapshots()
        .map((list) => list.documents.map((doc) {
              // final id = doc.documentID;
              final product =
                  Product.fromMap({"id": doc.documentID, ...doc.data});
              return product;
              // return Product.fromMap(doc.data);
            }).toList())
        .first;
  }
}
