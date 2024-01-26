import 'package:flutter/material.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({Key? key}) : super(key: key);

  @override
  State<GettingStarted> createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.green, Colors.purple]),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Welcome to",
                  style: TextStyle(
                      fontSize: 58,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "TechnoGadgets",
                  style: TextStyle(fontSize: 55, color: Colors.black),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registerscreen');
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    Colors.green,
                  )),
                  child: const Text(
                    "Get Started with TechnoGadgets",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}