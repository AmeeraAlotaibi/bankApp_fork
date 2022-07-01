// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      username: json['username'] as String,
      password: json['password'] as String?,
      image: json['image'] as String?,
      balance: (json['balance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'image': instance.image,
      'password': instance.password,
      'balance': instance.balance,
    };
