import 'package:json_annotation/json_annotation.dart';

part 'mobile.g.dart';

@JsonSerializable()
class Mobile {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? description;
  int? quantity;
  double? price;
  String? imgUrl;
  String? category;

  Mobile(
      {this.name,
      this.description,
      this.quantity,
      this.price,
      this.imgUrl,
      this.category});

  factory Mobile.fromJson(Map<String, dynamic> json) => _$MobileFromJson(json);

  Map<String, dynamic> toJson() => _$MobileToJson(this);
}