import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techno_gadgets/model/mobile.dart';
import 'package:techno_gadgets/repository/cart_repository.dart';
import 'package:techno_gadgets/response/mobile_response.dart';
import 'package:techno_gadgets/widgets/mycolors.dart';
import 'package:motion_toast/motion_toast.dart';
import '../widgets/product_detail_app_bar.dart';
import '../repository/mobile_repository.dart';

class ProductDetailScreen extends StatefulWidget {
  final String? mobileId;
  const ProductDetailScreen({this.mobileId, Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late Future<MobileResponse?> mobile;

  List<double> _accelerometerValues = <double>[];
  final List<StreamSubscription<dynamic>> _streamSubscription =
      <StreamSubscription<dynamic>>[];

  int quantity = 1;

  _changeQuantity(String op) {
    if (op == '+') {
      setState(() => quantity++);
    } else if (op == '-') {
      if (quantity == 1) return;
      setState(() => {quantity--});
    }
  }

  _addToCart(String productId) async {
    bool? isCartAdded = await CartRepository().addToCart(quantity, productId);

    if (isCartAdded!) {
      _showMotionToast(isCartAdded);
    } else {
      _showMotionToast(isCartAdded);
    }
  }

  void _showMotionToast(bool isAdded) {
    if (isAdded) {
      MotionToast.success(
        toastDuration: const Duration(seconds: 2),
        description: const Text('Cart added successfully.'),
      ).show(context);
    } else {
      MotionToast.error(
        toastDuration: const Duration(seconds: 1),
        description: const Text('Cart addition failed.'),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_accelerometerValues.isNotEmpty &&
        _accelerometerValues[0] <= 0.0 &&
        _accelerometerValues[1] <= 4.9 &&
        _accelerometerValues[2] <= -8.49) {
      setState(() {
        quantity++;
      });
    }

    debugPrint(
        'x: ${_accelerometerValues[0]}, y: ${_accelerometerValues[1]}, z: ${_accelerometerValues[2]}');

    return _myWidget();
  }

  Widget _myWidget() {
    return Scaffold(
        backgroundColor: MyColors.myWhite,
        body: ListView(
          children: [
            const ProductDetailAppBar(),
            FutureBuilder<MobileResponse?>(
              future: mobile,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data != null) {
                    Mobile mobileData = snapshot.data!.productData!;

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.network(
                            mobileData.imgUrl!
                                .replaceAll('localhost', '10.0.2.2'),
                            height: 298,
                          ),
                        ),
                        Arc(
                          edge: Edge.TOP,
                          arcType: ArcType.CONVEY,
                          height: 28,
                          child: Container(
                            width: double.infinity,
                            color: Colors.white,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 48, bottom: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          mobileData.name!,
                                          style: const TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold,
                                              color: MyColors.myGreen),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18),
                                          child: Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.6),
                                                      spreadRadius: 1,
                                                      blurRadius: 8,
                                                    )
                                                  ],
                                                ),
                                                child: IconButton(
                                                  icon: const Icon(
                                                    CupertinoIcons.minus,
                                                  ),
                                                  onPressed: () {
                                                    _changeQuantity('-');
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Text(
                                                  quantity.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: MyColors.myGreen,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.6),
                                                      spreadRadius: 1,
                                                      blurRadius: 8,
                                                    )
                                                  ],
                                                ),
                                                child: IconButton(
                                                  icon: const Icon(
                                                    CupertinoIcons.add,
                                                  ),
                                                  onPressed: () {
                                                    _changeQuantity('+');
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 18.0,
                                    ),
                                    child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Rs.${mobileData.price!}",
                                              style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: MyColors.myGreen,
                                              ),
                                            ),
                                            ElevatedButton.icon(
                                              onPressed: () {
                                                _addToCart(mobileData.id!);
                                              },
                                              icon: const Icon(
                                                CupertinoIcons.cart_badge_plus,
                                              ),
                                              label: const Text(
                                                "Add to Cart",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                  MyColors.myGreen,
                                                ),
                                                padding:
                                                    MaterialStateProperty.all(
                                                  const EdgeInsets.symmetric(
                                                      vertical: 13,
                                                      horizontal: 15),
                                                ),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            28),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 18,
                                      bottom: 14.0,
                                    ),
                                    child: Text(
                                      mobileData.description!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        height: 1.6,
                                        color: MyColors.myGreen,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Text('No data');
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
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  );
                }
              },
            ),
          ],
        ));
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
    mobile = MobileRepository().getMobileById(widget.mobileId!);
  }
}
