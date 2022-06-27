// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String,
      password: json['password'] as String,
      image: json['image'] as String? ?? "",
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'image': instance.image,
      'password': instance.password,
    };
