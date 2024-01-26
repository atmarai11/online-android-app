import 'package:flutter/material.dart';
import 'dart:async';
import 'package:techno_gadgets/database/database_instance.dart';
import 'package:techno_gadgets/repository/mobile_repository.dart';
import 'package:techno_gadgets/response/mobile_response.dart';
import 'package:techno_gadgets/screens/product_detail_screen.dart';
import '../model/mobile.dart';
import '../widgets/dash_app_bar.dart';
import '../widgets/mycolors.dart';
import '../widgets/products_widgets.dart';
import '../widgets/categories_widgets.dart';

import '../entities/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<MobileResponse?> allMobiles;

  _addProductToFloor(List<Mobile> mobiles) async {
    try {
      final database = await DatabaseInstance.instance.getDatabaseInstance();
      await database.productDAO.dropTable();

      for (var mobile in mobiles) {
        ProductFloor spotFloor = ProductFloor(
          category: mobile.category,
          description: mobile.description,
          name: mobile.name,
          imageUrl: mobile.imgUrl,
          price: mobile.price,
          productId: mobile.id,
          quantity: mobile.quantity,
        );

        await database.productDAO.insertSpot(spotFloor);
      }
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  List<ProductFloor?> lstMobilesFloor = [];

  _getMobilesFromFloor() async {
    try {
      final database = await DatabaseInstance.instance.getDatabaseInstance();
      lstMobilesFloor = await database.productDAO.getAllMobiles();
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DashAppBar(),
        Container(
          padding: const EdgeInsets.only(top: 15),
          decoration: const BoxDecoration(
            color: MyColors.myWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34),
              topRight: Radius.circular(34),
            ),
          ),

          // Search Widget
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 6),
                      height: 48,
                      width: 298,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Mobiles....."),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.search,
                      color: MyColors.myGreen,
                      size: 26,
                    )
                  ],
                ),
              ),

              // Categories Text Widget
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 8,
                ),
                child: const Text(
                  "Categories:",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: MyColors.myGreen,
                  ),
                ),
              ),

              // Categoris widgets
              CategoriesWidget(),

              // Items
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 8,
                    ),
                    child: const Text(
                      "Our Products",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: MyColors.myGreen,
                      ),
                    ),
                  ),
                  FutureBuilder<MobileResponse?>(
                    future: allMobiles,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data != null) {
                          List<Mobile> lstMobiles = snapshot.data!.data!;

                          _addProductToFloor(lstMobiles);

                          return GridView.count(
                            childAspectRatio: 0.565,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            // crossAxisSpacing: 10,
                            shrinkWrap: true,
                            children: lstMobiles
                                .map(
                                  (mobile) => ProductWidget(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailScreen(
                                                  mobileId: mobile.id!),
                                        ),
                                      )
                                    },
                                    title: mobile.name!,
                                    imgUrl: mobile.imgUrl!
                                        .replaceAll('localhost', '10.0.2.2'),
                                    price: 'Rs.${mobile.price}',
                                    description: mobile.description!,
                                  ),
                                )
                                .toList(),
                          );
                        } else {
                          return GridView.count(
                            childAspectRatio: 0.565,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            // crossAxisSpacing: 10,
                            shrinkWrap: true,
                            children: lstMobilesFloor
                                .map(
                                  (mobile) => ProductWidget(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailScreen(
                                                  mobileId: mobile!.productId!),
                                        ),
                                      )
                                    },
                                    title: mobile!.name!,
                                    imgUrl:
                                        'https://img.icons8.com/ios/500/no-image.png',
                                    price: 'Rs.${mobile.price}',
                                    description: mobile.description!,
                                  ),
                                )
                                .toList(),
                          );
                        }
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    allMobiles = MobileRepository().getAllMobiles();

    _getMobilesFromFloor();
  }
}
