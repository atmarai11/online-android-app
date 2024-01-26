import 'package:flutter/material.dart';
import '../widgets/mycolors.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

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
                    "About Us",
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
          SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: MyColors.myWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34),
                  topRight: Radius.circular(34),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: Column(
                  children: [
                    const Text(
                      "TechnoGadgets provides quality mobile phones to all over Nepal. Basically, we have three brands mobile phones are available here i.e. Samsung, Apple, Xiaomi with limited and suitable price.",
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: MyColors.myGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      children: const [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                          child: Text(
                            "Contact Us:",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: MyColors.myGreen,
                            ),
                          ),
                        ),
                        Text(
                          "Phone No: 9861616578",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: MyColors.myGreen,
                          ),
                        ),
                        Text(
                          "Location: Putalisadak, Kathmandu, Nepal",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: MyColors.myGreen,
                          ),
                        ),
                      ],
                    ),
                    Text("Google Map here")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
