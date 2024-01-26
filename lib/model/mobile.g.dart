// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mobile _$MobileFromJson(Map<String, dynamic> json) => Mobile(
      name: json['name'] as String?,
      description: json['description'] as String?,
      quantity: json['quantity'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      imgUrl: json['imgUrl'] as String?,
      category: json['category'] as String?,
    )..id = json['_id'] as String?;

Map<String, dynamic> _$MobileToJson(Mobile instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'quantity': instance.quantity,
      'price': instance.price,
      'imgUrl': instance.imgUrl,
      'category': instance.category,
    };
