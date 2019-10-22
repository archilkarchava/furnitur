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
              image:
                  "https://firebasestorage.googleapis.com/v0/b/furnitur-534fc.appspot.com/o/image_05.png?alt=media&token=6302579d-aca8-4985-b4b9-82005b9c7ed8",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: CategoryItem(
              displayName: "Столы",
              category: "Стол",
              image:
                  "https://firebasestorage.googleapis.com/v0/b/furnitur-534fc.appspot.com/o/image_07.png?alt=media&token=8b2edd1d-a406-40a3-973b-4ee6d3e8ad41",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: CategoryItem(
              displayName: "Кровати",
              category: "Кровать",
              image:
                  "https://firebasestorage.googleapis.com/v0/b/furnitur-534fc.appspot.com/o/image_11.png?alt=media&token=71cd40c9-b595-4dd3-ad1f-36de93cb3821",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: CategoryItem(
              displayName: "Лампы",
              category: "Лампа",
              image:
                  "https://firebasestorage.googleapis.com/v0/b/furnitur-534fc.appspot.com/o/image_15.png?alt=media&token=3b620d0f-67cb-43cd-9a34-f52c47d036d8",
            ),
          ),
        ],
      ),
    );
  }
}
