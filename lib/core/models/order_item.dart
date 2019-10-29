import 'package:furnitur/core/models/product.dart';
import 'package:meta/meta.dart';

@immutable
class OrderItem {
  final Product item;
  final int quantity;
  OrderItem({@required this.item, @required this.quantity});
  Map<String, dynamic> toJson() => {
        'item': item.toJson(),
        'quantity': quantity,
      };
}
