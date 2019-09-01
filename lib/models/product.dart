import 'package:meta/meta.dart';

final chairs = [
  Product(
      name: "Ikea Chair 1", image: "assets/images/image_01.png", price: 2990),
  Product(
      name: "Ikea Chair 2", image: "assets/images/image_02.png", price: 3490),
];

final tables = [
  Product(
      name: "Ikea Table 1", image: "assets/images/image_07.png", price: 5990),
  Product(
      name: "Ikea Table 2", image: "assets/images/image_08.png", price: 7490),
  Product(
      name: "Ikea Table 2", image: "assets/images/image_09.png", price: 12490),
  Product(
      name: "Ikea Table 2", image: "assets/images/image_10.png", price: 10990),
];

final beds = [
  Product(
      name: "Ikea Bed 1", image: "assets/images/image_11.png", price: 22990),
  Product(
      name: "Ikea Bed 2", image: "assets/images/image_12.png", price: 28990),
  Product(
      name: "Ikea Bed 2", image: "assets/images/image_13.png", price: 14990),
  Product(
      name: "Ikea Bed 2", image: "assets/images/image_14.png", price: 11990),
];

final lamps = [
  Product(
      name: "Ikea Lamp 1", image: "assets/images/image_15.png", price: 2990),
  Product(
      name: "Ikea Lamp 2", image: "assets/images/image_16.png", price: 3990),
  Product(
      name: "Ikea Lamp 2", image: "assets/images/image_17.png", price: 5990),
  Product(
      name: "Ikea Lamp 2", image: "assets/images/image_18.png", price: 6990),
];

class Product {
  String name;
  int price;
  String image;
  Product({
    @required this.name,
    @required this.price,
    @required this.image,
  });
}
