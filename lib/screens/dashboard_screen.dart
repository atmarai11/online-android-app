import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:techno_gadgets/screens/about_us_screen.dart';
import 'package:techno_gadgets/screens/home_screen.dart';
import 'package:techno_gadgets/screens/product_add_screen.dart';
import 'package:techno_gadgets/widgets/mycolors.dart';


class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  double _proximityValue = 0;

  final List<StreamSubscription<dynamic>> _streamSubscription =
      <StreamSubscription<dynamic>>[];

  List<Widget> lstWidgets = [
    const HomeScreen(),
    const AddProduct(),
    const AboutUsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    if (_proximityValue <= 4.0 && _proximityValue != 0.0) {
      setState(() {
        if (_currentIndex < 3) {
          _currentIndex++;
        } else {
          _currentIndex = 0;
        }
      });
    }

    return Scaffold(
      body: lstWidgets[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        height: 68,
        color: MyColors.myGreen,
        items: const [
          Icon(
            Icons.home,
            size: 28,
            color: Colors.white,
          ),
          Icon(
            Icons.add_a_photo,
            size: 28,
            color: Colors.white,
          ),
          Icon(
            Icons.people,
            size: 28,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _streamSubscription.add(
      proximityEvents!.listen(
        (ProximityEvent event) => {
          setState(() {
            _proximityValue = event.proximity;
          })
        },
      ),
    );
  }
}