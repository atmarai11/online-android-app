import '../model/cart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse {
  List<Cart>? data;

  CartResponse({this.data});

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}
