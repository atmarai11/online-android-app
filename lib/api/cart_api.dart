import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:techno_gadgets/response/cart_response.dart';
import 'dart:io';

import './http_services.dart';
import '../utils/url.dart';

class CartAPI {
  Future<bool?> addToCart(int quantity, String productId) async {
    var cartAddURL = baseUrl + addCartUrl + productId;

    try {
      var dio = HttpServices().getDioInstance();

      var response = await dio.post(
        cartAddURL,
        data: {"quantity": quantity},
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      debugPrint(err.toString());
    }
    return null;
  }

  Future<CartResponse?> getCart() async {
    var cartGetURL = baseUrl + getCartUrl;

    Future.delayed(const Duration(seconds: 2), () {});
    CartResponse? cartResponse;

    try {
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(
        cartGetURL,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          },
        ),
      );

      debugPrint(response.toString());

      if (response.statusCode == 200) {
        cartResponse = CartResponse.fromJson(response.data);
      } else {
        cartResponse = null;
      }
    } catch (err) {
      throw Exception(err);
    }

    return cartResponse;
  }

  Future<bool?> deleteCart(String cartId) async {
    var cartDeleteURL = baseUrl + cartDeleteUrl + cartId;
    debugPrint(cartDeleteURL);

    Future.delayed(const Duration(seconds: 2), () {});

    try {
      var dio = HttpServices().getDioInstance();
      Response response = await dio.delete(
        cartDeleteURL,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          },
        ),
      );

      debugPrint(response.toString());

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      throw Exception(err);
    }
  }
}
