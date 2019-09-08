import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class ContactUsDialog extends StatefulWidget {
  @override
  _ContactUsDialogState createState() => _ContactUsDialogState();
}

class _ContactUsDialogState extends State<ContactUsDialog> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _controller = new MaskedTextController(mask: '+7 (000) 000-00-00');
    return AlertDialog(
        content: Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text("Введите ваше имя и номер телефона и мы с вами свяжимся."),
          TextFormField(
            decoration: InputDecoration(labelText: 'Введите ваше имя'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Пожалуйста введите ваше имя.';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _controller,
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
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
                  // If the form is valid, display a Snackbar.
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
