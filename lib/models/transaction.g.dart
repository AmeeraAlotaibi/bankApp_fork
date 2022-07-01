// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      amount: json['amount'] as int,
      type: json['type'] as String,
      senderID: json['senderID'] as int,
      receiverID: json['receiverID'] as int,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'senderID': instance.senderID,
      'receiverID': instance.receiverID,
      'amount': instance.amount,
      'type': instance.type,
    };
