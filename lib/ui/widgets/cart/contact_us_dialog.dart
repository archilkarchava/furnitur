import 'package:flutter/material.dart';
import 'package:furnitur/core/models/customer.dart';
import 'package:furnitur/core/models/order.dart';
import 'package:furnitur/core/models/order_item.dart';
import 'package:furnitur/core/services/api.dart';
import 'package:furnitur/core/viewmodels/cart.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

Widget _buildResponse(
    {@required BuildContext context, @required bool isSuccess}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Text(
        isSuccess
            ? 'Ваш заказ был успешно оформлен. Мы вам перезвоним.'
            : 'Произошла ошибка при оформлении заказа. Пожалуйста позвоните нам по номеру +7 (900) 000-00-00.',
      ),
      SizedBox(
        height: 10,
      ),
      FlatButton(
          child: Text(
            'Ок',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () => Navigator.pop(context)),
    ],
  );
}

class ContactUsDialog extends StatefulWidget {
  @override
  _ContactUsDialogState createState() => _ContactUsDialogState();
}

class _ContactUsDialogState extends State<ContactUsDialog> {
  final _formKey = GlobalKey<FormState>();
  String _firstName;
  String _lastName;
  String _phoneNumber;
  bool _loading = false;
  bool _isSuccess;
  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartViewModel>(context);
    final _api = Provider.of<Api>(context);
    final _phoneNumberFormatter = MaskTextInputFormatter(
        mask: '+7 (###) ###-##-##', filter: {'#': RegExp(r'[0-9]')});
    return AlertDialog(
        content: _isSuccess != null
            ? _buildResponse(context: context, isSuccess: _isSuccess)
            : Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text("Введите ваше имя и номер телефона и мы с вами свяжимся."),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Введите имя'),
                      textCapitalization: TextCapitalization.sentences,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Пожалуйста введите ваше имя.';
                        }
                        return null;
                      },
                      onSaved: (value) => _firstName = value,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Введите фамилию'),
                      textCapitalization: TextCapitalization.sentences,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Пожалуйста введите вашу фамилию.';
                        }
                        return null;
                      },
                      onSaved: (value) => _lastName = value,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [_phoneNumberFormatter],
                      initialValue: '+7',
                      decoration:
                          InputDecoration(labelText: 'Введите номер телефона'),
                      validator: (value) {
                        if (value.length != 18) {
                          return 'Пожалуйста введите ваш номер телефона.';
                        }
                        return null;
                      },
                      onSaved: (value) => _phoneNumber = value,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              _loading = true;
                            });
                            _formKey.currentState.save();
                            final customer = Customer(
                                firstName: _firstName,
                                lastName: _lastName,
                                phoneNumber: _phoneNumber);
                            final items = _cart.itemsUnique;
                            final List<OrderItem> cartItems = [];
                            for (var item in items) {
                              final cartItem = OrderItem(
                                item: item,
                                quantity: _cart.getAmountOf(item),
                              );
                              cartItems.add(cartItem);
                            }
                            final Order order = Order(
                                customer: customer,
                                items: cartItems,
                                sum: _cart.totalPrice);
                            _api
                                .addOrderToDatabase(order)
                                .then((_) => {
                                      setState(() {
                                        _loading = false;
                                        _isSuccess = true;
                                      })
                                    })
                                .catchError((_) => {
                                      setState(() {
                                        _loading = false;
                                        _isSuccess = false;
                                      })
                                    });
                          }
                        },
                        child: Center(
                          child: Text(
                            _loading ? 'Отправка...' : 'Отправить',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
