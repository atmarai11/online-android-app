// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      age: json['age'] as String?,
      phoneNo: json['phoneNo'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'phoneNo': instance.phoneNo,
      'password': instance.password,
      'age': instance.age,
    };
