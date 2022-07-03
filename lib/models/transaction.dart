import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  int senderId;
  int receiverId;
  int amount;
  String type;
  String createdAt;

  Transaction({
    required this.amount,
    required this.type,
    required this.senderId,
    required this.receiverId,
    required this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
