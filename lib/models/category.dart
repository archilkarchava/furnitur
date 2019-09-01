import 'package:furnitur/models/product.dart';
import 'package:meta/meta.dart';

final categories = [
  Category(
      name: "Стулья", image: "assets/images/image_03.png", products: chairs),
  Category(
      name: "Столы", image: "assets/images/image_04.png", products: tables),
  Category(
      name: "Кровати", image: "assets/images/image_05.png", products: beds),
  Category(name: "Лампы", image: "assets/images/image_06.png", products: lamps),
];

class CategoryList {
  List<Category> categories;

  CategoryList({
    @required this.categories,
  });
}

class Category {
  String name;
  String image;
  List<Product> products;
  Category(
      {@required this.name, @required this.image, @required this.products});
}
