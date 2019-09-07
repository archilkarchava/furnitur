import 'package:flutter/material.dart';
import 'package:furnitur/ui/shared/text_styles.dart';

class BuyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 100, maxWidth: 500),
      child: DecoratedBox(
        decoration: new BoxDecoration(
          color: Color(0xffffe24a),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                color: Color(0xbfffe24a),
                offset: Offset(0, 7),
                blurRadius: 20,
                spreadRadius: 0)
          ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Заказать",
            style: buyButtonTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
