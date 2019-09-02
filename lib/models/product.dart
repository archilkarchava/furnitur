import 'package:meta/meta.dart';

final chairs = [
  Product(
      name: "Стул Ингольф",
      image: "assets/images/image_01.png",
      price: 2990,
      description:
          "Высокая спинка обеспечивает оптимальный комфорт. Массив дерева – износостойкий натуральный материал."),
  Product(
      name: "Ikea Chair 2",
      image: "assets/images/image_02.png",
      price: 3490,
      description: ""),
];

final tables = [
  Product(
      name: "Ikea Table 1",
      image: "assets/images/image_07.png",
      price: 5990,
      description: ""),
  Product(
      name: "Ikea Table 2",
      image: "assets/images/image_08.png",
      price: 7490,
      description: ""),
  Product(
      name: "Ikea Table 2",
      image: "assets/images/image_09.png",
      price: 12490,
      description: ""),
  Product(
      name: "Ikea Table 2",
      image: "assets/images/image_10.png",
      price: 10990,
      description: ""),
];

final beds = [
  Product(
      name: "Ikea Bed 1",
      image: "assets/images/image_11.png",
      price: 22990,
      description: ""),
  Product(
      name: "Ikea Bed 2",
      image: "assets/images/image_12.png",
      price: 28990,
      description: ""),
  Product(
      name: "Ikea Bed 2",
      image: "assets/images/image_13.png",
      price: 14990,
      description: ""),
  Product(
      name: "Ikea Bed 2",
      image: "assets/images/image_14.png",
      price: 11990,
      description: ""),
];

final lamps = [
  Product(
      name: "Ikea Lamp 1",
      image: "assets/images/image_15.png",
      price: 2990,
      description: ""),
  Product(
      name: "Ikea Lamp 2",
      image: "assets/images/image_16.png",
      price: 3990,
      description: ""),
  Product(
      name: "Ikea Lamp 2",
      image: "assets/images/image_17.png",
      price: 5990,
      description: ""),
  Product(
      name: "Ikea Lamp 2",
      image: "assets/images/image_18.png",
      price: 6990,
      description: ""),
];

class Product {
  String name;
  int price;
  String image;
  String description;
  Product(
      {@required this.name,
      @required this.price,
      @required this.image,
      @required this.description});
}
