// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      productId: json['productId'] as String?,
      userId: json['userId'] as String?,
      productName: json['productName'] as String?,
      quantity: json['quantity'] as int?,
      total: (json['total'] as num?)?.toDouble(),
    )
      ..id = json['_id'] as String?
      ..imgUrl = json['imgUrl'] as String?;

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      '_id': instance.id,
      'productId': instance.productId,
      'userId': instance.userId,
      'productName': instance.productName,
      'quantity': instance.quantity,
      'total': instance.total,
      'imgUrl': instance.imgUrl,
    };
