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
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: CategoryItem(
              displayName: "Стулья",
              category: "Стул",
              imageAsset: "assets/images/image_05.png",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: CategoryItem(
              displayName: "Столы",
              category: "Стол",
              imageAsset: "assets/images/image_07.png",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: CategoryItem(
              displayName: "Кровати",
              category: "Кровать",
              imageAsset: "assets/images/image_11.png",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: CategoryItem(
              displayName: "Лампы",
              category: "Лампа",
              imageAsset: "assets/images/image_15.png",
            ),
          ),
        ],
      ),
    );
  }
}
