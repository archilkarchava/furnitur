import 'package:flutter/material.dart';
import 'package:furnitur/ui/widgets/home/category_item.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: 20,
            ),
            child: CategoryItem(
              category: "Стулья",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 20,
            ),
            child: CategoryItem(
              category: "Столы",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 20,
            ),
            child: CategoryItem(
              category: "Кровати",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 20,
            ),
            child: CategoryItem(
              category: "Лампы",
            ),
          ),
        ],
      ),
    );
  }
}
