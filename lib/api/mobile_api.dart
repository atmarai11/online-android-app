import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:mime/mime.dart';

import '../response/mobile_response.dart';
import './http_services.dart';
import '../utils/url.dart';
import '../model/mobile.dart';
import 'package:http_parser/http_parser.dart';

class MobileAPI {
  Future<bool> addMobile(File? file, Mobile mobile) async {
    const mobileAddURL = baseUrl + addMobileUrl;
    try {
      var dio = HttpServices().getDioInstance();
      MultipartFile? image;

      if (file != null) {
        var mimeType = lookupMimeType(file.path);

        image = await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
          contentType: MediaType(
            'image',
            mimeType!.split('/')[1],
          ),
        );

        var formData = FormData.fromMap({
          "name": mobile.name,
          "description": mobile.description,
          "quantity": mobile.quantity,
          "price": mobile.price,
          "category": mobile.category,
          "img": image,
        });

        var response = await dio.post(
          mobileAddURL,
          data: formData,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: "Bearer $token",
            },
          ),
        );

        debugPrint(response.toString());

        if (response.statusCode == 200) {
          return true;
        }
      }
    } catch (err) {
      debugPrint(err.toString());
      throw Exception(err);
    }

    return false;
  }

  Future<MobileResponse?> getAllMobiles() async {
    var mobileURL = baseUrl + mobileAllUrl;

    Future.delayed(const Duration(seconds: 3), () {});
    MobileResponse? mobileResponse;

    try {
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(mobileURL);

      if (response.statusCode == 200) {
        mobileResponse = MobileResponse.fromJson(response.data);
      } else {
        mobileResponse = null;
      }
    } catch (err) {
      throw Exception(err);
    }

    return mobileResponse;
  }

  Future<MobileResponse?> getMobiles(String? category) async {
    var mobileURL = baseUrl + mobileUrl + category!;

    debugPrint(mobileURL);

    Future.delayed(const Duration(seconds: 3), () {});
    MobileResponse? mobileResponse;

    try {
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(mobileURL);

      debugPrint(response.toString());

      if (response.statusCode == 200) {
        mobileResponse = MobileResponse.fromJson(response.data);
      } else {
        mobileResponse = null;
      }
    } catch (err) {
      throw Exception(err);
    }

    return mobileResponse;
  }

  Future<MobileResponse?> getMobileById(String? id) async {
    var mobileURL = baseUrl + mobileGet + id!;
    debugPrint(mobileURL);

    Future.delayed(const Duration(seconds: 3), () {});
    MobileResponse? mobileResponse;

    try {
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(mobileURL);

      debugPrint(response.toString());

      if (response.statusCode == 200) {
        mobileResponse = MobileResponse.fromJson(response.data);
      } else {
        mobileResponse = null;
      }
    } catch (err) {
      throw Exception(err);
    }

    return mobileResponse;
  }
}