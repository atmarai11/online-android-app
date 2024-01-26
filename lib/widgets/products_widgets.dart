import 'package:flutter/material.dart';
import 'package:techno_gadgets/widgets/mycolors.dart';

class ProductWidget extends StatelessWidget {
  final String title;
  final String imgUrl;
  final String price;
  final String description;
  final VoidCallback? onTap;
  const ProductWidget({
    Key? key,
    required this.title,
    required this.imgUrl,
    required this.price,
    required this.description,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(
                Icons.favorite_border,
                color: Colors.redAccent,
              )
            ],
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Image.network(
                imgUrl,
                height: 118,
                width: 118,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: MyColors.myGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              description,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: const TextStyle(
                fontSize: 14,
                color: MyColors.myGreen,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price.toString(),
                  style: const TextStyle(
                    fontSize: 15,
                    color: MyColors.myGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(
                  Icons.shopping_cart_checkout_rounded,
                  color: MyColors.myGreen,
                  size: 28,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
