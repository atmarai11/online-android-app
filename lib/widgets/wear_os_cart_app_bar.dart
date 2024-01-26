import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:techno_gadgets/screens/dashboard_screen.dart';
import 'package:techno_gadgets/widgets/mycolors.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Future.delayed(Duration.zero, () {
                Navigator.pushNamed(context, '/wearosloginscreen');
              });
            },
            child: const Icon(
              Icons.arrow_back,
              size: 18,
              color: MyColors.myGreen,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(7.0),
            child: Text(
              "Cart",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: MyColors.myGreen,
              ),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.more_vert,
            size: 28,
            color: MyColors.myGreen,
          )
        ],
      ),
    );
  }
}
