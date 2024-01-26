import 'dart:io';

import 'package:techno_gadgets/model/mobile.dart';

import '../response/mobile_response.dart';
import '../api/mobile_api.dart';

class MobileRepository {
  Future<bool?> addMobile(File? file,Mobile mobile) async {
    return MobileAPI().addMobile(file, mobile);
  }

  Future<MobileResponse?> getMobile(String? category) async {
    return MobileAPI().getMobiles(category);
  }

  Future<MobileResponse?> getAllMobiles() async {
    return MobileAPI().getAllMobiles();
  }

  Future<MobileResponse?> getMobileById(String id) async {
    return MobileAPI().getMobileById(id);
  }
}
