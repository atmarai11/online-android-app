import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String? email;
  String? fullName;
  String? phoneNo;
  String? password;
  String? age;

  User({
    this.email,
    this.fullName,
    this.age,
    this.phoneNo,
    this.password,
  });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return _$ProductFromJson(json);
//   }

//   Map<String, dynamic> toJson() => _$ProductToJson(this);
// }

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
//Converting json to user object:
  // factory User.fromJson(Map<String, dynamic> json) => User(

      // email: json["email"],
      // address: json["address"],
      // username: json["username"],
      // phone: json["phone"],
      // password: json["password"],
      // country: json["country"]
      // );

  // Map<String, dynamic> toJson() => {
        // "email": email,
        // "address": address,
        // "phone": phone,
        // "username": username,
        // "password": password,
        // "country": country
      // };
// }
//Converting the user object to json:


