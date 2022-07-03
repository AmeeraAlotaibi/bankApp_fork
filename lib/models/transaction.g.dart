// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      amount: json['amount'] as int,
      type: json['type'] as String,
      senderId: json['senderId'] as int,
      receiverId: json['receiverId'] as int,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'amount': instance.amount,
      'type': instance.type,
      'createdAt': instance.createdAt,
    };
