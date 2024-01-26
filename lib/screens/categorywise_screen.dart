import 'package:flutter/material.dart';
import 'package:techno_gadgets/model/mobile.dart';
import 'package:techno_gadgets/repository/mobile_repository.dart';
import 'package:techno_gadgets/response/mobile_response.dart';
import 'package:techno_gadgets/screens/product_detail_screen.dart';
import 'package:techno_gadgets/widgets/products_widgets.dart';

import '../widgets/mycolors.dart';

class CategoryWiseScreen extends StatefulWidget {
  String? category;
  CategoryWiseScreen({this.category, Key? key}) : super(key: key);

  @override
  State<CategoryWiseScreen> createState() => _CategoryWiseScreenState();
}

class _CategoryWiseScreenState extends State<CategoryWiseScreen> {
  late Future<MobileResponse?> mobileByCategory;

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
                Padding(
                  padding: const EdgeInsets.only(left: 78),
                  child: Text(
                    widget.category!,
                    style: const TextStyle(
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
                ),
              ],
            ),
          ),
          FutureBuilder<MobileResponse?>(
            future: mobileByCategory,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data != null) {
                  List<Mobile> lstMobiles = snapshot.data!.data!;

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
                                      ProductDetailScreen(mobileId: mobile.id!),
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
                  return const Text('No data');
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mobileByCategory = MobileRepository().getMobile(widget.category!);
  }
}