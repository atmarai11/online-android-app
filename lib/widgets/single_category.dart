import 'package:flutter/material.dart';
import 'package:techno_gadgets/screens/categorywise_screen.dart';

class SingleCategory extends StatelessWidget {
  final String imgUrl;
  final String categoryName;
  const SingleCategory(
      {Key? key, required this.imgUrl, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryWiseScreen(
              category: categoryName,
            ),
          ),
        )
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imgUrl,
              height: 38,
              width: 38,
            ),
            Text(
              categoryName,
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
