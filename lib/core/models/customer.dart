import 'package:meta/meta.dart';

@immutable
class Customer {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  Customer(
      {@required this.firstName,
      @required this.lastName,
      @required this.phoneNumber});
  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
      };
}
