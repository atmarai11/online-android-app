import '../model/mobile.dart';

import 'package:json_annotation/json_annotation.dart';

part 'mobile_response.g.dart';

@JsonSerializable()
class MobileResponse {
  List<Mobile>? data;
  Mobile? productData;

  MobileResponse({this.data, this.productData});

  factory MobileResponse.fromJson(Map<String, dynamic> json) =>
      _$MobileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MobileResponseToJson(this);
}
