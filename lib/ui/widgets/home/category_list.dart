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
              displayName: "Стулья",
              category: "Стул",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 20,
            ),
            child: CategoryItem(
              displayName: "Столы",
              category: "Стол",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 20,
            ),
            child: CategoryItem(
              displayName: "Кровати",
              category: "Кровать",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 20,
            ),
            child: CategoryItem(
              displayName: "Лампы",
              category: "Лампа",
            ),
          ),
        ],
      ),
    );
  }
}
