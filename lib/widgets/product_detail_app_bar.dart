import 'package:flutter/material.dart';
import 'package:techno_gadgets/widgets/mycolors.dart';

class ProductDetailAppBar extends StatelessWidget {
  const ProductDetailAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 28,
              color: MyColors.myGreen,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 68),
            child: Text(
              "Product",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: MyColors.myGreen,
              ),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.favorite,
            size: 28,
            color: Colors.redAccent,
          )
        ],
      ),
    );
  }
}
