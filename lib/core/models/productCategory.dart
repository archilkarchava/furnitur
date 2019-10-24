import 'package:meta/meta.dart';

@immutable
class ProductCategory {
  final String name;
  final String namePlural;
  final String image;
  ProductCategory({@required this.name, @required this.namePlural, this.image});

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) =>
      other is ProductCategory && other.name == name;
  factory ProductCategory.fromMap(Map<String, dynamic> data) {
    data = data ?? {};
    return ProductCategory(
      name: data['name'],
      namePlural: data['namePlural'],
      image: data['image'] ?? '',
    );
  }
}
