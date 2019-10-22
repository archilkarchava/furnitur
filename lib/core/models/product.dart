import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class Product {
  final String id;
  final String name;
  final int price;
  final int oldPrice;
  final String image;
  final String description;
  final String category;
  Product(
      {@required this.id,
      @required this.name,
      @required this.price,
      this.oldPrice,
      @required this.image,
      @required this.description,
      @required this.category});

  // @override
  // int get hashCode => id.hashCode;

  // @override
  // bool operator ==(Object other) => other is Product && other.id == id;
  factory Product.fromMap(Map<String, dynamic> data) {
    data = data ?? {};
    return Product(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      price: data['price'],
      oldPrice: data['oldPrice'],
      image: data['image'] ?? '',
      description: data['description'] ?? '',
      category: data['category'],
    );
  }
}
