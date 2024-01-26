// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techno_gadgets/widgets/mycolors.dart';

class CartItems extends StatelessWidget {
  String? title;
  int? quantity;
  double? total;
  double? grandTotal;
  VoidCallback? onDelete;
  String? imgUrl;

  CartItems(
      {this.onDelete,
      this.title,
      this.grandTotal,
      this.quantity,
      this.total,
      this.imgUrl,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: 198,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title!,
                      style: const TextStyle(
                        fontSize: 18,
                        color: MyColors.myGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        size: 26,
                        color: Colors.redAccent,
                      ),
                      onPressed: onDelete!,
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 118,
                      width: 118,
                      child: Image.network(
                        imgUrl!.replaceAll('localhost', '10.0.2.2'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 28, top: 18),
                            child: Text(
                              "Total :\$$total",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: MyColors.myGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
