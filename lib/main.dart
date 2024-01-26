import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:techno_gadgets/screens/checkout_screen.dart';
import 'package:techno_gadgets/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './screens/dashboard_screen.dart';
import 'screens/register_screen.dart';
import '/screens/getting_started_screen.dart';
import '/screens/login_screen.dart';
import '/screens/product_add_screen.dart';
import '/screens/wearos/wearos_dashboard_screen.dart';
import '/screens/wearos/wearos_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/product_detail_screen.dart';

void main() async {
  AwesomeNotifications().initialize(
    'resource://drawable/launcher',
    [
      NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for Notification app',
        defaultColor: const Color(0xFF9D50DD),
        importance: NotificationImportance.Default,
        ledColor: Colors.white,
        channelShowBadge: true,
      ),
    ],
  );

  await _getTokenFromSharedPreference();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: token != null ? '/' : '/dashboardscreen',
      initialRoute: '/wearosdashboardscreen',
      routes: {
        "/": (context) => const GettingStarted(),
        "/loginscreen": (context) => const LoginScreen(),
        "/registerscreen": (context) => const RegisterScreen(),
        "/cartscreen": (context) => const CartScreen(),
        "/productdetailscreen": (context) => const ProductDetailScreen(),
        "/dashboardscreen": (context) => DashboardScreen(),
        "/checkoutscreen": (context) => const CheckOutScreen(),
        "/productaddscreen": (context) => const AddProduct(),
        "/wearosloginscreen": (context) => const WearOsScreen(),
        "/wearosdashboardscreen": (context) => const WearOsDashboardScreen(),
        // "/myproductscreen": (context) => const MyProductScreen()
      },
    ),
  );
}

_getTokenFromSharedPreference() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? tokenVal = prefs.getString('token');

  if (tokenVal != null) {
    token = tokenVal;
  }
}
