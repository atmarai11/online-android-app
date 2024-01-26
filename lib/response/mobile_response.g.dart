// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MobileResponse _$MobileResponseFromJson(Map<String, dynamic> json) =>
    MobileResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Mobile.fromJson(e as Map<String, dynamic>))
          .toList(),
      productData: json['productData'] == null
          ? null
          : Mobile.fromJson(json['productData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MobileResponseToJson(MobileResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'productData': instance.productData,
    };
