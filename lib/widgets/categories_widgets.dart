import 'package:flutter/material.dart';
import 'package:techno_gadgets/widgets/single_category.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          SingleCategory(
            imgUrl: 'assets/images/apple.png',
            categoryName: "Apple",
          ),
          SingleCategory(
            imgUrl: 'assets/images/samsung.png',
            categoryName: "Samsung",
          ),
          SingleCategory(
            imgUrl: 'assets/images/xiaomi.png',
            categoryName: "Xiaomi",
          ),
        ],
      ),
    );
  }
}
