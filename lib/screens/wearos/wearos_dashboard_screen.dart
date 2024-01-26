import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:wear/wear.dart';

import '../../model/cart.dart';
import '../../repository/cart_repository.dart';
import '../../response/cart_response.dart';
import '../../widgets/wear_os_cart_app_bar.dart';
import '../../widgets/wear_os_cartItems.dart';
import '../../widgets/mycolors.dart';
import '../cart_screen.dart';

class WearOsDashboardScreen extends StatefulWidget {
  const WearOsDashboardScreen({Key? key}) : super(key: key);

  @override
  State<WearOsDashboardScreen> createState() => _WearOsDashboardScreenState();
}

class _WearOsDashboardScreenState extends State<WearOsDashboardScreen> {
  late Future<CartResponse?> allCarts;
  double grandTotal = 0;

  _deleteCart(String cartId) async {
    bool? isDeleted = await CartRepository().deleteCart(cartId);

    if (isDeleted!) {
      _refreshPage(context);
    } else {
      _showMotionToast(isDeleted);
    }
  }

  void _showMotionToast(bool isAdded) {
    if (isAdded) {
      MotionToast.success(
        toastDuration: const Duration(seconds: 2),
        description: const Text('Mobile added successfully.'),
      ).show(context);
    } else {
      MotionToast.error(
        toastDuration: const Duration(seconds: 2),
        description: const Text('Mobile addition failed.'),
      ).show(context);
    }
  }

  _refreshPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const CartScreen(),
      ),
      (Route<dynamic> route) => true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) {
        return AmbientMode(
          builder: (context, mode, child) {
            return Scaffold(
              body: ListView(
                children: [
                  const CartAppBar(),
                  SingleChildScrollView(
                    child: Container(
                      // height: 700,
                      decoration: const BoxDecoration(
                        color: MyColors.myWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(34),
                          topRight: Radius.circular(34),
                        ),
                      ),
                      child: FutureBuilder<CartResponse?>(
                        future: allCarts,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.data != null) {
                              List<Cart> lstCarts = snapshot.data!.data!;

                              debugPrint(lstCarts[0].productName!);

                              for (var e in lstCarts) {
                                grandTotal += e.total!;
                              }

                              return Column(
                                children: [
                                  Column(
                                    children: lstCarts
                                        .map((cart) => CartItems(
                                            quantity: cart.quantity,
                                            title: cart.productName,
                                            total: cart.total,
                                            grandTotal: grandTotal,
                                            imgUrl: cart.imgUrl,
                                            onDelete: () {
                                              _deleteCart(cart.id!);
                                            }))
                                        .toList(),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    height: 128,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Total",
                                              style: TextStyle(
                                                color: MyColors.myGreen,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24,
                                              ),
                                            ),
                                            Text(
                                              "\$$grandTotal",
                                              style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: MyColors.myGreen,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 48,
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: MyColors.myGreen,
                                              shape:
                                                  const BeveledRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/checkoutscreen');
                                            },
                                            child: const Text(
                                              "Check Out",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
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
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.blue),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    allCarts = CartRepository().getCart();
  }
}
