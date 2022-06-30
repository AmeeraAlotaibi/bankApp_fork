// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String username;
  String? image;
  String? password;
  double? balance;

  User({
    this.id,
    required this.username,
    this.password,
    this.image,
    this.balance,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    int? id,
    String? username,
    String? image,
    String? password,
    double? balance,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      image: image ?? this.image,
      password: password ?? this.password,
      balance: balance ?? this.balance,
    );
  }
}
