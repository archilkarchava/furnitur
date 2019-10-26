import 'package:flutter/material.dart';
import 'package:furnitur/core/models/cart_item.dart';
import 'package:furnitur/core/models/customer.dart';
import 'package:furnitur/core/models/order.dart';
import 'package:furnitur/core/services/api.dart';
import 'package:furnitur/core/viewmodels/cart.dart';
import 'package:provider/provider.dart';

class ContactUsDialog extends StatefulWidget {
  @override
  _ContactUsDialogState createState() => _ContactUsDialogState();
}

class _ContactUsDialogState extends State<ContactUsDialog> {
  final api = Api();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartViewModel>(context);
    // final _phoneNumberController =
    //     new MaskedTextController(mask: '+7 (000) 000-00-00');
    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController();
    final _phoneNumberController = TextEditingController();
    return AlertDialog(
        content: Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text("Введите ваше имя и номер телефона и мы с вами свяжимся."),
          TextFormField(
            controller: _firstNameController,
            decoration: InputDecoration(labelText: 'Введите ваше имя'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Пожалуйста введите ваше имя.';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _lastNameController,
            decoration: InputDecoration(labelText: 'Введите вашу фамилию'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Пожалуйста введите вашу фамилию.';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _phoneNumberController,
            // keyboardType: TextInputType.number,
            decoration:
                InputDecoration(labelText: 'Введите ваш номер телефона'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Пожалуйста введите ваш номер телефона.';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  final customer = Customer(
                      firstName: _firstNameController.value.text,
                      lastName: _lastNameController.value.text,
                      phoneNumber: _phoneNumberController.value.text);
                  final items = _cart.itemsUnique;
                  final List<CartItem> cartItems = [];
                  for (var item in items) {
                    final cartItem = CartItem(
                      item: item,
                      quantity: _cart.getAmountOf(item),
                    );
                    cartItems.add(cartItem);
                  }
                  final Order order = Order(
                      customer: customer,
                      items: cartItems,
                      sum: _cart.totalPrice);
                  api.addOrderToDatabase(order);

                  Text('Обрабатываем данные.');
                }
              },
              child: Center(child: Text('Отправить')),
            ),
          ),
        ],
      ),
    ));
  }
}
