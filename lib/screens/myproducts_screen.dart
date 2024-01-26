import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../widgets/mycolors.dart';
import '../widgets/products_widgets.dart';

class MyProductScreen extends StatefulWidget {
  const MyProductScreen({Key? key}) : super(key: key);

  @override
  State<MyProductScreen> createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen> {
  List<double> _accelerometerValues = <double>[];
  final List<StreamSubscription<dynamic>> _streamSubscription =
      <StreamSubscription<dynamic>>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
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
                  padding: EdgeInsets.only(
                    left: 64,
                  ),
                  child: Text(
                    "My Products",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: MyColors.myGreen),
                  ),
                ),
                const Spacer(),
                Badge(
                  badgeColor: Colors.redAccent,
                  padding: const EdgeInsets.all(6),
                  badgeContent: const Text(
                    "0",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
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
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 8,
            ),
            child: const Text(
              "My Products",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: MyColors.myGreen,
              ),
            ),
          ),
          GridView.count(
            childAspectRatio: 0.58,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            // crossAxisSpacing: 10,
            shrinkWrap: true,
            children: const [
              ProductWidget(
                title: "Iphone11",
                imgUrl: "assets/images/iphone11.jpg",
                price: '200000',
                description: "Iphone11 description",
              ),
              ProductWidget(
                title: "Iphone 11",
                imgUrl: "assets/images/iphone11.jpg",
                price: '200000',
                description: "Iphone 11 description",
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _streamSubscription.add(
      accelerometerEvents!.listen(
        (AccelerometerEvent event) => {
          setState(
            () {
              _accelerometerValues = <double>[event.x, event.y, event.z];
            },
          )
        },
      ),
    );
  }
}

