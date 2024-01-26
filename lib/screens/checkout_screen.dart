
import 'package:flutter/material.dart';
import '../widgets/mycolors.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

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
                    Navigator.pushNamed(context, '/dashboardscreen');
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 28,
                    color: MyColors.myGreen,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 78),
                  child: Text(
                    "Checkout",
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
          ),
          Container(
            height: 698,
            decoration: const BoxDecoration(
              color: MyColors.myWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34),
                topRight: Radius.circular(34),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Your product will be delievered very soon",
                  style: TextStyle(
                    fontSize: 24,
                    color: MyColors.myGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/dashboardscreen');
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  label: const Text(
                    "Go back to home page",
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      MyColors.myGreen,
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
