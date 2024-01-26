import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:techno_gadgets/widgets/mycolors.dart';

class DashAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          const Icon(
            Icons.sort,
            size: 28,
            color: MyColors.myGreen,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 24,
            ),
            child: Text(
              "TechnoGadgets",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MyColors.myGreen),
            ),
          ),
          const Spacer(),
          Badge(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/cartscreen');
              },
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: MyColors.myGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

