import 'package:shared_preferences/shared_preferences.dart';

import 'http_services.dart';
import '../model/user.dart';
import '../response/login_response.dart';
import '../utils/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserAPI {
  _setTokenToSharedPreferences(String token) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  Future<bool> registerUser(User user) async {
    bool isLogin = false;
    Response response;

    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.post(url, data: user.toJson());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<bool> login(String email, String password) async {
    try {
      var dio = HttpServices().getDioInstance();

      var response = await dio.post(
        loginUrl,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        debugPrint('Inside Login, status OK ${response.data}');
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        token = loginResponse.token;
        _setTokenToSharedPreferences(token!);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
