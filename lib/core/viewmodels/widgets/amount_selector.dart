import 'package:flutter/foundation.dart';

class AmountSelectorModel extends ChangeNotifier {
  int _amount = 1;
  int get amount => _amount;

  void reset() {
    _amount = 1;
    notifyListeners();
  }

  void increment() {
    _amount += 1;
    notifyListeners();
  }

  void decrement() {
    if (_amount > 1) {
      _amount -= 1;
    }
    notifyListeners();
  }
}
