import 'package:meta/meta.dart';

@immutable
class Product {
  final int id;
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

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Product && other.id == id;
}
