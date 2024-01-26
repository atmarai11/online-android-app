import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  @JsonKey(name: '_id')
  String? id;
  String? productId;
  String? userId;
  String? productName;
  int? quantity;
  double? total;
  String? imgUrl;

  Cart(
      {this.productId,
      this.userId,
      this.productName,
      this.quantity,
      this.total});

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
