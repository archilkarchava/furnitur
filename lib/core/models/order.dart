import 'package:furnitur/core/models/cart_item.dart';
import 'package:furnitur/core/models/customer.dart';
import 'package:meta/meta.dart';

@immutable
class Order {
  final Customer customer;
  final List<CartItem> items;
  final double sum;
  Order({@required this.customer, @required this.items, @required this.sum});
  Map<String, dynamic> toJson() => {
        'customer': customer.toJson(),
        'items': items.map((item) => item.toJson()).toList(),
        'sum': sum
      };
}
